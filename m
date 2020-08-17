Return-Path: <jailhouse-dev+bncBDEN32754MOBBNMR5H4QKGQEKC72LJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC142461E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:07:02 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id t9sf6117254edw.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 02:07:02 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597655222; cv=pass;
        d=google.com; s=arc-20160816;
        b=ONXAkrxsDbIDqv7U6j6tJ+RGaU1xnoOToVBm64lckVasX/ngCtIFzwYbUWwMa1wrI/
         en6K0jfMLCDLQDd2/82yTxRL9OorO8hQgMw5gZGSiK1gENXrjIXcPSHYW2ZeDOwhvDZZ
         R/FLmrYbFileHnhYKkSer9tVCaqkx8ePLCXHI9XCHyTmEgICcKJT2ubZvV5fXGzYagzc
         svOVUxUWfyTnhYM2MEyNM1N1opNIyJuUrhEufqX0sjD1UcBW8k6Y3iCoGCRMIcynegvc
         6ROVrHlEHFuoee5Q5J1P8JGTFwQlqQjsIuR07TRHPswV0hDOO9pXGyTJTgoGsrAH/0FC
         N/7g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=CYw+YYNZqIUcvJ5f1krA/nFmDM42lrvGuM5eZSrXeQM=;
        b=EGNDZKzbTNE+Q1dMRds77NUsqvEcFCVmLfXb0RvreJVxY5FoYAgi3UowOXyBEAozHk
         M1+doFKILbWR8OyWK76pQwF+C1Mm57HsjZp7B1jGa1ybgAY0BJZh3fa7W4eaX2NZMZKa
         cuVcaWtComPMRh/uTXny/mWP0gySKpye+i3T92kiMUK8vHWQ7TrouyYIeeSbZXGjnFR5
         WPTXQcQORxowEfJq/3nbVgcUt0wZWm1HJ6htyzdvBDvWL1ry64b/pc7OQz7QV1iGXq7J
         Oxo373JkyfBbpUxBNzrDqjRaCXbl6KMAaff5y5jZK3+tMFAI3JHW1b3BZBAR6940pPjA
         vlQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TisMlWFu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYw+YYNZqIUcvJ5f1krA/nFmDM42lrvGuM5eZSrXeQM=;
        b=GXvYqO+HN80AXHufoK+ex7S2rlCm24ywilZprrtaN0xu+EkSis42u2q5nl80p94eS7
         MJnVNz6QC0geK0axUT6XgKpF1JgRkSV5FoSm8dniqp2yadhUlDIHzZ0flnM8Nnucp8IF
         FvkAR5hWj9jlHRZiERKIPLJGV4jr+X92+480ukWS9x6jSMp6EUTQ0mtTN8gCXaW9tzL8
         yI755S3SWpb1IMETCEsncv0GFyM/zaW/iSQuAcSl9gbb4+h64LyM92v36RXOFxWRsIHi
         40eDoaTimJFrzSYt5iPrLAzn4M9ughqGmz8HFEsKnza/vWN357Y2IIvkBl3rdGlDCQTV
         nXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CYw+YYNZqIUcvJ5f1krA/nFmDM42lrvGuM5eZSrXeQM=;
        b=kP5lNtX/yXbuop8Chhetz/PQQMAsbsuvzRzfQsKuiL+HsN09s/1VK9AErTabwPT/ZH
         8JI9JppyCDYv61ApX/CFXEPNW6JUlydfOnQEyvyOigPwu8ZnXOaOVn28zllAiaeTOK2N
         D8mHIcC87NEPQZseizPP16ru6UhjsXMHSP+gWxlBcj46mJxfEMzpbpWsAxdb1wVjRBcA
         86vw/12krk+OOMxIjiRNJwpnpW/l5pxBY12LoWDVla40YmQk4yJ5ViWPJTJKIlf1qMH0
         cL2BljF92glYdzBXpsbhVVXZa/e42tgOfSejrdlMwKbT4zXIeBlzbE2n37J7TQlKZ2Sq
         HobA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dAxzEHyreev1niZzOGfSNCK0EWzpo5b2hAzmKGF1oH2J68si0
	phgs9h+OEXynoVTz7PoZ1jk=
X-Google-Smtp-Source: ABdhPJzs4qaayeBUHPCOVToqHmSWirpMd2iHVKDuOlqj/5o5oRUQ6jkVFNzSHAJsZtP4t5XR1bT/+A==
X-Received: by 2002:a17:906:d930:: with SMTP id rn16mr14724221ejb.330.1597655222306;
        Mon, 17 Aug 2020 02:07:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:17ce:: with SMTP id s14ls7151137edy.1.gmail; Mon,
 17 Aug 2020 02:07:01 -0700 (PDT)
X-Received: by 2002:aa7:d596:: with SMTP id r22mr14102617edq.204.1597655221424;
        Mon, 17 Aug 2020 02:07:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597655221; cv=pass;
        d=google.com; s=arc-20160816;
        b=hCZuzujs8HWiFWlhjlcL79lF3cs6e7tW1UyF+NCsW3ct2cdmZPi4yQvMdrDA3apA4R
         UNq/yvblmqhWTLBy+luLewwHcrMYgrnQIj866yFrfJMZP+Cd/NfTMKofN3u6b9B/5nVr
         qTKmKUux+MzCZDWY3wZB+lNR4kgNw05JJ2TcGfjQbKRQpiOPvFIAvyJSJZ5sh9Q1WRmX
         BEqKqq+oXIAleYTgWTbPVL3eveI1p7XbT8f7IuDbHza9QL8O+agC0E2Uk5/3RVRWIIWL
         BPS7Qbpwxg34Kh0SLP9/pdAN+xV/D6Jr2zRruKifyWe4J55Jg4AQd97kx6+M3tad4kzG
         c8Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=MRVXDMUdea/8otFH5ZRGCz0KqA2xP8MZoOvFajGW6fI=;
        b=WLbaa5uK06UK+lMPN7poSCyaxRcOG0APNHRo8sg2wZCRMJF0RHgavJKw99NJGml+u7
         UHAjQd94ZujfZ9/JvI9dY0ryP8L+64cvpm1xnP3i5CuQDG1kCtp0F6RVNJ+cAtgWkb0L
         /o9FaZTnLt4LQhtGCMGZewSktMq2XGeWJMWqU7NpW2IU/aUowiYVKB/es9j+2JLnXRUA
         WKnAehqxNGJeyY/Uj14+MX27FzJQ3bftYtzLcScn0GSMi/wFZAhXewgr5U9Dgaumgab3
         /lrV9ERe8C0Ul9T8jwK/CoQvoNnqCo69L+WCbkH1M/kycdpATUZTNwm1n4Z1pWRqTE2I
         Omrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TisMlWFu;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80045.outbound.protection.outlook.com. [40.107.8.45])
        by gmr-mx.google.com with ESMTPS id lw8si732962ejb.1.2020.08.17.02.07.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.45 as permitted sender) client-ip=40.107.8.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwjfpPik6qNPM1cqUHTyKjKXZvOT+m5hJFBq3RAe6M/u5Ts+ZMa5zpAuQarSoQuqhOMFsEjXBi87FGsgMMz1UWX2zNYuGc8pMkUz2qXzyuHuSJMAa5RqTY4EjOkVGHVJDdWEA/p2WQX0G3wIIRJ34ixjNmgYN/f3iJjdaLJcvL/h8L5QxsD49H4IhDC8VyZH5X4HKaJxt+J9gC3Kl1qLr8NS79pPXknrRyE0gqaOGpFqmLSl0AFDAoBkmTxaTV1lT6h8BphxHuOat0oCq7vFgsEz3CyAMEtdRJfq6P8s7fEFcwAnTEkOrtf8eHKZHHDSyEiNqa3ZDx3oboP3VnPilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRVXDMUdea/8otFH5ZRGCz0KqA2xP8MZoOvFajGW6fI=;
 b=HnR9G6UJ8VG4psi819ovn09YPOVTIdX4p9NUPJefy26KPODnDPq8HgbpCC6yuXBXgZUkRoSG7U78g7bnwFsZ29+uCZEk9DtlpvOA4PtVuvoDWsrrs09A7cj/rsEQ5cp5t1sECC4UQZDe3F4YRKkXkq8AguprltXe7SYXhWifQa+eDWUmm2dz1Bk+DaU3TI4vTRDiiYTz7oTR98xBJjxpvMlO6fWvrKSYGqgqWSHAalef8TanGismVgHyhLHaPb9KvW85a2kvhiCML7sLn/Qfw25Y1l+Q2ghPkhaMIh3bMVP6wZ7epn32OCca35IhEmNc5HFz/aYQMI8xgl6XLenCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4267.eurprd04.prod.outlook.com (2603:10a6:5:27::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 09:06:59 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 09:06:59 +0000
From: Alice Guo <alice.guo@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Peng Fan <peng.fan@nxp.com>
Subject: RE: [EXT] Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell
 configuration files
Thread-Topic: [EXT] Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell
 configuration files
Thread-Index: AQHWcjRDiDVWx713P02WY6ExL07Hdqk3npiAgARn2WA=
Date: Mon, 17 Aug 2020 09:06:58 +0000
Message-ID: <DB8PR04MB706508CAD1386D15A5234BFCE25F0@DB8PR04MB7065.eurprd04.prod.outlook.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <20200815190949.6837-4-alice.guo@nxp.com>
 <abc77bec-9b59-e56f-a188-18859536ba3f@siemens.com>
In-Reply-To: <abc77bec-9b59-e56f-a188-18859536ba3f@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a38f57c1-50dd-4fb4-10d1-08d8428ce5c9
x-ms-traffictypediagnostic: DB7PR04MB4267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4267011C2A3A6862DD4D37FDE25F0@DB7PR04MB4267.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eax1Q6vKH5S31jTX740jjijmnm8YLd294UnkvcisZZDtX9WEzM8Ni1+FDZO7Dru7mcdwmgrJGw6IFO4qrIfkyOdzBkNgWCF0XRkZkDvd4WVPA8lIPGvO1wrFxF14dNKbyELtBbtr9VMtYDjp2/0LTpY23ibDuB6Hx1qqf2KUd3MigGhVhXRZZ8+9LwVOwEmfyfJNtoSYSbWy5zrVWcVBMQxH8mUO4QpIYJWbdZxXglm6oVAS9kz/hHqzT6k31B4d/zlWrPETA3CduYKx/8USYkQB/9fJD22FvlW2arsKSksJa5EvlRhIQGWyIRLAEiUPkyVS6joV6N1mEjHe2nGhe0WtNET/aFEyKFmQTBKBUV9TRos/NRHyqmWGXvTS2zOy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(6506007)(30864003)(8676002)(26005)(110136005)(33656002)(186003)(66446008)(8936002)(66476007)(4326008)(53546011)(71200400001)(64756008)(66556008)(2906002)(55016002)(52536014)(7696005)(86362001)(76116006)(5660300002)(83380400001)(44832011)(66946007)(316002)(478600001)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ls4CQERSU7Tw6ISdmXvO4Bfek4991xCLUmdOtWtWhQrBD0/Wu3Kx/j5PJ1IfosseKiXy+iH5GYfHs1cXgEur6jaLOFOlHYtZu62Gbz9H99jUmsyhYM0l4+qgtvRiX6b50NUyT+ZDhLQYaRVYNzjx3LDWf3/VKFFgG/9qMP8owpdc0D9MpWhtoSrUGo+gMzM0a+bg6dkwrMNk9RHCpV3Lg6WUP5uIozliEZWqldMeCislPqNQW//bd+5cUZDnGakCQDyTw/qGGhmeTdHErBi8dJs/gEOV7K3xasq12nnwbuBNoINHtkZwhnbz0Tt/M5HSF2USlPOUUYyG4kobIqWOujjfijx50O42p0XzIa+wxa/0ojSh9MMBcUnBqohmXQ55VpCGbxUXjYAk0L9ATRSk5O5Re8ZQmlM7AZ6ev/6u4aik6r7Q8A9jsRUoKeiW2VTDYjQTm6Lu3VST2vZDUZnCKvYKixB4kZnfUWv9h8tWijwrNvYIb5N6f0a7RZNJ0+5X137DUk/8Zwekdc2Tbk3l/nqdPjygETaJu+ckQyBkYtBh5cFEW0fa49qxgNczws5Nuifqx6Eqy7/2Inz7TsUivZEz/XQcpNPkadpARhpBnbN9SmE6NyUa0TJDQOUXgHzlwtF9XZebufII/hOebZvFlg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38f57c1-50dd-4fb4-10d1-08d8428ce5c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 09:06:58.9515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCbJIIGT5Kstdf5wteUgwey2esHIzGdctlj63IzD5ZaeAFoSnuV4IzKOV6xUpjO1HP+jdOV88c2p3umt6Iv3VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4267
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=TisMlWFu;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.8.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2020=E5=B9=B48=E6=9C=8814=E6=97=A5 21:48
> To: Alice Guo <alice.guo@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Peng Fan <peng.fan@nxp.com>
> Subject: [EXT] Re: [PATCH V2 4/4] configs: arm64: imx8dxl: add cell confi=
guration
> files
>=20
> Caution: EXT Email
>=20
> On 15.08.20 21:09, Alice Guo wrote:
> > Add imx8dxl-gic-demo-aarch32.c to support AArch32 VM on the imx8dxl
> > platform. Distinguish whether it is AArch32 inmate cell by the macro
> > JAILHOUSE_CELL_AARCH32.
> >
> > Add "imx8dxl-gic-demo-aarch64.c" for AArch64 VM.
> >
> > "imx8dxl.c" is used for the root cell.
> >
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >   configs/arm64/imx8dxl-gic-demo-aarch32.c |  64 +++++++++
> >   configs/arm64/imx8dxl-gic-demo-aarch64.c |  64 +++++++++
>=20
> Sorry, missed that so far:
>=20
> Please add a imx8dxl-inmate-demo.c, instead of aarch64, and make sure it =
is in
> line with other inmate-demo configs. That will ease using this target wit=
h all
> kinds of inmates, including tests (once we have more...).
>=20
> And for the aarch32 variant: If the only difference is the flag, maybe pu=
t that in
> a define and include the imx8dxl-inmate-demo.c, rather than copying it. W=
ill
> make maintenance easier.


[alice]:
Accoring your comment, add the following code to configs/arm64/imx8dxl-gic-=
demo.c.
But it cannot work correctly because this file will not be compiled when bu=
ilding for arm32. Do them need to be changed?
#if defined(CONFIG_ARM)
               .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |=20
JAILHOUSE_CELL_AARCH32, #elif defined(CONFIG_ARM64)
               .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG, #endif

>=20
> >   configs/arm64/imx8dxl.c                  | 173
> +++++++++++++++++++++++
> >   3 files changed, 301 insertions(+)
> >   create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch32.c
> >   create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch64.c
> >   create mode 100644 configs/arm64/imx8dxl.c
> >
> > diff --git a/configs/arm64/imx8dxl-gic-demo-aarch32.c
> > b/configs/arm64/imx8dxl-gic-demo-aarch32.c
> > new file mode 100644
> > index 00000000..80dbd366
> > --- /dev/null
> > +++ b/configs/arm64/imx8dxl-gic-demo-aarch32.c
> > @@ -0,0 +1,64 @@
> > +/*
> > + * iMX8DXL target - gic-demo
> > + *
> > + * Copyright 2020 NXP
> > + *
> > + * Authors:
> > + *  Alice Guo <alice.guo@nxp.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.
> > +See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +struct {
> > +     struct jailhouse_cell_desc cell;
> > +     __u64 cpus[1];
> > +     struct jailhouse_memory mem_regions[3]; }
> > +__attribute__((packed)) config =3D {
> > +     .cell =3D {
> > +             .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> > +             .revision =3D JAILHOUSE_CONFIG_REVISION,
> > +             .name =3D "gic-demo-aarch32",
> > +             .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
> JAILHOUSE_CELL_AARCH32,
> > +             .cpu_set_size =3D sizeof(config.cpus),
> > +             .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> > +             .num_irqchips =3D 0,
> > +             .num_pci_devices =3D 0,
> > +             .console =3D {
> > +                     .address =3D 0x5a060000,
> > +                     .type =3D JAILHOUSE_CON_TYPE_IMX_LPUART,
> > +                     .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> > +                              JAILHOUSE_CON_REGDIST_4,
> > +             },
> > +     },
> > +
> > +     .cpus =3D {
> > +             0x2,
> > +     },
> > +
> > +     .mem_regions =3D {
> > +             /* UART1 */ {
> > +                     .phys_start =3D 0x5a060000,
> > +                     .virt_start =3D 0x5a060000,
> > +                     .size =3D 0x1000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             /* RAM: Top at 4GB Space */ {
> > +                     .phys_start =3D 0xa1700000,
> > +                     .virt_start =3D 0,
> > +                     .size =3D 0x00100000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> > +             },
> > +             /* communication region */ {
> > +                     .virt_start =3D 0x80000000,
> > +                     .size =3D 0x00001000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_COMM_REGION,
> > +             },
> > +     }
> > +};
> > diff --git a/configs/arm64/imx8dxl-gic-demo-aarch64.c
> > b/configs/arm64/imx8dxl-gic-demo-aarch64.c
> > new file mode 100644
> > index 00000000..88d436fe
> > --- /dev/null
> > +++ b/configs/arm64/imx8dxl-gic-demo-aarch64.c
> > @@ -0,0 +1,64 @@
> > +/*
> > + * iMX8DXL target - gic-demo
> > + *
> > + * Copyright 2020 NXP
> > + *
> > + * Authors:
> > + *  Alice Guo <alice.guo@nxp.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.
> > +See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +struct {
> > +     struct jailhouse_cell_desc cell;
> > +     __u64 cpus[1];
> > +     struct jailhouse_memory mem_regions[3]; }
> > +__attribute__((packed)) config =3D {
> > +     .cell =3D {
> > +             .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> > +             .revision =3D JAILHOUSE_CONFIG_REVISION,
> > +             .name =3D "gic-demo",
> > +             .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
> > +             .cpu_set_size =3D sizeof(config.cpus),
> > +             .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> > +             .num_irqchips =3D 0,
> > +             .num_pci_devices =3D 0,
> > +             .console =3D {
> > +                     .address =3D 0x5a060000,
> > +                     .type =3D JAILHOUSE_CON_TYPE_IMX_LPUART,
> > +                     .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> > +                              JAILHOUSE_CON_REGDIST_4,
> > +             },
> > +     },
> > +
> > +     .cpus =3D {
> > +             0x2,
> > +     },
> > +
> > +     .mem_regions =3D {
> > +             /* UART1 */ {
> > +                     .phys_start =3D 0x5a060000,
> > +                     .virt_start =3D 0x5a060000,
> > +                     .size =3D 0x1000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_IO |
> JAILHOUSE_MEM_ROOTSHARED,
> > +             },
> > +             /* RAM: Top at 4GB Space */ {
> > +                     .phys_start =3D 0xa1700000,
> > +                     .virt_start =3D 0,
> > +                     .size =3D 0x00100000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> > +             },
> > +             /* communication region */ {
> > +                     .virt_start =3D 0x80000000,
> > +                     .size =3D 0x00001000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_COMM_REGION,
> > +             },
> > +     }
> > +};
> > diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c new
> > file mode 100644 index 00000000..f94692bc
> > --- /dev/null
> > +++ b/configs/arm64/imx8dxl.c
> > @@ -0,0 +1,173 @@
> > +/*
> > + * i.MX8DXL Target
> > + *
> > + * Copyright 2020 NXP
> > + *
> > + * Authors:
> > + *  Alice Guo <alice.guo@nxp.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.
> > +See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +struct {
> > +     struct jailhouse_system header;
> > +     __u64 cpus[1];
> > +     struct jailhouse_memory mem_regions[15];
> > +     struct jailhouse_irqchip irqchips[3];
> > +     struct jailhouse_pci_device pci_devices[2]; }
> > +__attribute__((packed)) config =3D {
> > +     .header =3D {
> > +             .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> > +             .revision =3D JAILHOUSE_CONFIG_REVISION,
> > +             .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> > +             .hypervisor_memory =3D {
> > +                     .phys_start =3D 0xbfc00000,
> > +                     .size =3D       0x00400000,
> > +             },
> > +             .debug_console =3D {
> > +                     .address =3D 0x5a060000,
> > +                     .size =3D 0x1000,
> > +                     .flags =3D JAILHOUSE_CON_TYPE_IMX_LPUART |
> > +                              JAILHOUSE_CON_ACCESS_MMIO |
> > +                              JAILHOUSE_CON_REGDIST_4,
> > +                     .type =3D JAILHOUSE_CON_TYPE_IMX_LPUART,
> > +             },
> > +             .platform_info =3D {
> > +                     .pci_mmconfig_base =3D 0xbf700000,
> > +                     .pci_mmconfig_end_bus =3D 0x0,
> > +                     .pci_is_virtual =3D 1,
> > +                     .pci_domain =3D 0,
> > +                     .arm =3D {
> > +                             .gic_version =3D 3,
> > +                             .gicd_base =3D 0x51a00000,
> > +                             .gicr_base =3D 0x51b00000,
> > +                             .maintenance_irq =3D 25,
> > +                     },
> > +             },
> > +             .root_cell =3D {
> > +                     .name =3D "imx8dxl",
> > +                     .num_pci_devices =3D
> ARRAY_SIZE(config.pci_devices),
> > +                     .cpu_set_size =3D sizeof(config.cpus),
> > +                     .num_memory_regions =3D
> ARRAY_SIZE(config.mem_regions),
> > +                     .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> > +                     .vpci_irq_base =3D 2, /* Not include 32 base */
>=20
> Is SPI 2 actually free on this board? Usually, those low IRQs are all in =
use. Just to
> double-check.


[alice]:
Yes, I have checked "i.MX 8DualXLite Applications Processor Reference Manua=
l".

>=20
> > +             },
> > +     },
> > +
> > +     .cpus =3D {
> > +             0x3,
> > +     },
> > +
> > +     .mem_regions =3D {
> > +             /* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> > +                     .phys_start =3D 0xbf900000,
> > +                     .virt_start =3D 0xbf900000,
> > +                     .size =3D 0x1000,
> > +                     .flags =3D JAILHOUSE_MEM_READ,
> > +             },
> > +             {
> > +                     .phys_start =3D 0xbf901000,
> > +                     .virt_start =3D 0xbf901000,
> > +                     .size =3D 0x9000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE ,
> > +             },
> > +             {
> > +                     .phys_start =3D 0xbf90a000,
> > +                     .virt_start =3D 0xbf90a000,
> > +                     .size =3D 0x2000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE ,
> > +             },
> > +             {
> > +                     .phys_start =3D 0xbf90c000,
> > +                     .virt_start =3D 0xbf90c000,
> > +                     .size =3D 0x2000,
> > +                     .flags =3D JAILHOUSE_MEM_READ,
> > +             },
> > +             {
> > +                     .phys_start =3D 0xbf90e000,
> > +                     .virt_start =3D 0xbf90e000,
> > +                     .size =3D 0x2000,
> > +                     .flags =3D JAILHOUSE_MEM_READ,
> > +             },
> > +             /* IVSHMEM shared memory regions for 00:01.0
> (networking) */
> > +             JAILHOUSE_SHMEM_NET_REGIONS(0xbfa00000, 0),
> > +             /* MMIO (permissive): TODO: refine the map */ {
> > +                     .phys_start =3D 0x00000000,
> > +                     .virt_start =3D 0x00000000,
> > +                     .size =3D       0x80000000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_IO,
> > +             },
> > +             /* RAM */ {
> > +                     .phys_start =3D 0x80200000,
> > +                     .virt_start =3D 0x80200000,
> > +                     .size =3D 0x21d00000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE,
> > +             },
> > +             /* Inmate memory */{
> > +                     .phys_start =3D 0xa1700000,
> > +                     .virt_start =3D 0xa1700000,
> > +                     .size =3D 0x1e000000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE,
> > +             },
> > +             /* Loader */{
> > +                     .phys_start =3D 0xbfb00000,
> > +                     .virt_start =3D 0xbfb00000,
> > +                     .size =3D 0x100000,
> > +                     .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE,
> > +             },
> > +     },
> > +
> > +     .irqchips =3D {
> > +             /* GIC */ {
> > +                     .address =3D 0x51a00000,
> > +                     .pin_base =3D 32,
> > +                     .pin_bitmap =3D {
> > +                             0xffffffff, 0xffffffff, 0xffffffff, 0xfff=
fffff,
> > +                     },
> > +             },
> > +             /* GIC */ {
> > +                     .address =3D 0x51a00000,
> > +                     .pin_base =3D 160,
> > +                     .pin_bitmap =3D {
> > +                             0xffffffff, 0xffffffff, 0xffffffff, 0xfff=
fffff,
> > +                     },
> > +             },
> > +             /* GIC */ {
> > +                     .address =3D 0x51a00000,
> > +                     .pin_base =3D 288,
> > +                     .pin_bitmap =3D {
> > +                             0xffffffff, 0xffffffff, 0xffffffff, 0xfff=
fffff,
> > +                     },
> > +             },
> > +     },
> > +
> > +     .pci_devices =3D {
> > +             { /* IVSHMEM 0000:00:00.0 (demo) */
> > +                     .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +                     .domain =3D 0,
> > +                     .bdf =3D 0 << 3,
> > +                     .bar_mask =3D
> JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +                     .shmem_regions_start =3D 0,
> > +                     .shmem_dev_id =3D 0,
> > +                     .shmem_peers =3D 3,
> > +                     .shmem_protocol =3D
> JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> > +             },
> > +             { /* IVSHMEM 0000:00:01.0 (networking) */
> > +                     .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +                     .domain =3D 0,
> > +                     .bdf =3D 1 << 3,
> > +                     .bar_mask =3D
> JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +                     .shmem_regions_start =3D 5,
> > +                     .shmem_dev_id =3D 0,
> > +                     .shmem_peers =3D 2,
> > +                     .shmem_protocol =3D
> JAILHOUSE_SHMEM_PROTO_VETH,
> > +             },
> > +     },
> > +};
> >
>=20
> Will a linux inmate config follow?


[alice]:
Yes.

>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence
> Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB8PR04MB706508CAD1386D15A5234BFCE25F0%40DB8PR04MB7065.eurprd=
04.prod.outlook.com.
