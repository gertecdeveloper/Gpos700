import React, { Component } from "react";
import { StyleSheet, FlatList, Text, View, Button } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default class Sat extends Component {
    constructor(props) {
        super(props);

        this.state = {
            GridListItems: [
                { key: "ATIVAÇÃO SAT",onPress: ()=>this.props.navigation.navigate("ativarSat") },
                { key: "ASSOCIAR ASSINATURA" ,onPress: ()=>this.props.navigation.navigate("associarSat")},
                { key: "TESTE SAT",onPress: ()=>this.props.navigation.navigate("testeSat") },
                { key: "CONFIGURAÇÕES DE REDE",onPress: ()=>this.props.navigation.navigate("configSat") },
                { key: "ALTERAR CÓDIGO DE ATIVAÇÃO",onPress: ()=>this.props.navigation.navigate("alterarCodigo") },
                { key: "OUTRAS FERRAMENTAS",onPress: ()=>this.props.navigation.navigate("ferramentasSat") }
            ]
        };
    };

    render() {
        return (
            <View>
                <SafeAreaView>
                    <Text style={styles.title}> GERSAT - Aplicativo de Ativação </Text>
                </SafeAreaView>

                <View style={{marginTop:20}}>
                    <FlatList
                        data={ this.state.GridListItems }
                        renderItem={ ({item}) =>
                        <View style={{marginStart:50, marginEnd: 50, marginBottom: 20}}>
                            <Button
                                color= 'gray'
                                title={item.key}
                                onPress={() => item.onPress()}
                            />
                        </View>}
                    />
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    title: {
        fontSize: 22,
        textAlign: 'center',
        fontWeight: 'bold',
        marginTop: 15,
        color: '#707070',
    }
})