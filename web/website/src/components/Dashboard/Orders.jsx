import React from 'react';
import Link from '@material-ui/core/Link';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Title from './Title';

// Generate Order Data
function createData(id, date, name, shipTo, paymentMethod, amount) {
    return { id, date, name, shipTo, paymentMethod, amount };
}

const rows = [
    createData(0, '16 Nov, 2020', 'Djurovic Nicolas', 'Leon de bruxelles', 'VISA ?•••• 3719', 35),
    createData(1, '17 Nov, 2020', 'Djurovic Nicolas', 'Paradie du fruits ', 'VISA ?•••• 2574', 15),
    createData(2, '18 Nov, 2020', 'Djurovic Nicolas', 'Le Bureau', 'MC ?•••• 1253', 40),
    createData(3, '19 Nov, 2020', 'Djurovic Nicolas', 'Flunch', 'AMEX ?•••• 2000', 15),
];

function preventDefault(event) {
    event.preventDefault();
}

const useStyles = makeStyles((theme) => ({
    seeMore: {
        marginTop: theme.spacing(3),
    },
}));

export default function Orders() {
    const classes = useStyles();
    return (
        <React.Fragment>
            <Title>Historique Paiement</Title>
            <Table size="small">
                <TableHead>
                    <TableRow>
                        <TableCell>Date</TableCell>
                        <TableCell>Nom</TableCell>
                        <TableCell>Envoyez a</TableCell>
                        <TableCell align="right">Montant </TableCell>
                    </TableRow>
                </TableHead>
                <TableBody>
                    {rows.map((row) => (
                        <TableRow key={row.id}>
                            <TableCell>{row.date}</TableCell>
                            <TableCell>{row.name}</TableCell>
                            <TableCell>{row.shipTo}</TableCell>
                            <TableCell align="right">{row.amount}</TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
            <div className={classes.seeMore}>
                <Link color="primary" href="#" onClick={preventDefault}>
                    Voir plus
        </Link>
            </div>
        </React.Fragment>
    );
}