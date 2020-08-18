Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBLWG534QKGQE7WE5BFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F8248223
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:45:19 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id t21sf4326428lff.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:45:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597743918; cv=pass;
        d=google.com; s=arc-20160816;
        b=rR54TDpQ9aPhY5wjPZASXs2+E0jMY6s4Y8zy9YcM+zbW9jYb29Cwkw4tl+Gz9NcldG
         OabTnkp7DulQtHDfEl4/jvpK4HVy3joNilhsxuJYFBQ/iOsTwYedGn9ZQkLiMqYZyd3D
         0HjsNwgXNwe724L4WtkvhMo0MLulgVEixL96CAq/L86/n4vTEUufIVoEcq5xgVj0Imhb
         bzEbnOQT5HFJA0cFIBxNapNIWXZ8RkzmGK8AOo/RBlTk+EPiFL8Akc9OIBIG/eknfW8w
         hWrYDPAV02Vmk1SNEqERFDi8sn3RohDZ5g/TUg807dJHMrv5azYiuHDp4upSWUsmPlaz
         Mdag==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=+2AHMkOiQYQcnThCCYVJfIaa+M8G7/7m7xaz2GyP6d8=;
        b=WNnrT8d7RLcoEn7UwbK/NKxADu9wpOLfi3Cm7IO3kiwcubixlnkms2P3GDoRwVheqV
         OKuZxUsSygclaKUm14tQDPW9Wa7uPI6Wyr88biKe99B4R+ITRwh9OpGy6HLdNKpTC+Qg
         xmxzWNtOTrt+tbC3gGk4SuLQtL2s3D4bhVtiJBQkYfVrKKULzscQDhwF+jkiDbF9kAfA
         nXlGMwq1CqRN0b4XxRbh+Cb/kOvR4ZrNfTxd7DIRBReLlOJvs7/qzSu5JCrrJQIpzbTX
         N0H7pNLIl5tFLACMmBpWSU8iLMubVW974qE0VVQHiZ5NY15NIYEmBhKOL9myZvZrzGLL
         EHeA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Nz656Dkx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+2AHMkOiQYQcnThCCYVJfIaa+M8G7/7m7xaz2GyP6d8=;
        b=dvFMsTipcr+C3OqyNZAvCsvH0J+21P1l5Urq28A+kafQFwA4HRX/dUQ+0jsHEzYpCS
         qpeyS1xl0JhgIgiPAu1VSviEajeVoCuMBI7HkcOSG0YgH4n7z7YjahKmKjhwO41cHgne
         KKnxYCbUro4PmjtPfASuR1nf6KaihGmz1bc2oM5vSUUx94IwfhD4cfv2HnslG70szgyZ
         8904ClQpDmtfLzE+XHIZHjmgIJymB/S4w/ohT5XPMXNptco0EGMUsEEr0Avr4wZTHNCZ
         hWEcSZB7/PPwIkCgI9PdlM4GNu8EMCf4TZfeyjWsgw+lCWCQx9elabEbSqox9drc7Esn
         va3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+2AHMkOiQYQcnThCCYVJfIaa+M8G7/7m7xaz2GyP6d8=;
        b=uFIbZPXLFSwZYdlrRJU9W9VPNyYTU4DUGVR//dp9EK8DuSDo244t4vMMdxHV/7pIPl
         RRtvPxdu5n0nauJylin8EzLQGG0+O09UlgDZJnIi+J+T9sTVTDa4QUvnRlsDsJxM/Gve
         v5+LSwsVfWA2NKud5SFxwHeNlfCjNNqPRhlMhuuzQhb61ca9cOiq0x0SpXQ4Uw4V+3/5
         wWVfXN5km6WC/pl6KCB6iCsqDumg/NseyyLFaYZjdRM3ZFl9jA39auzNM5AhItTKDeIm
         mIyssuwYIOLwzIfTdNju8HeRt8wgPpK5eheuQvTUCKiPQOQazZ5CddJobsm0sRIEfxhY
         z9lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533SJQautRwenQpcQN+P+vhPHk+xlXHoGt+uU5ZBziKwpTELO+/r
	BohNJAqbvFQmJy6pk8pK9oA=
X-Google-Smtp-Source: ABdhPJybYeR62Cay3+bxzYhT7SEEEwta7tRWni+FxjdFQbdAOMBSDcjkH2F2XJZ8Ttrqa/jIqkT7Bw==
X-Received: by 2002:a2e:9c95:: with SMTP id x21mr9022370lji.96.1597743918668;
        Tue, 18 Aug 2020 02:45:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8994:: with SMTP id c20ls608766lji.0.gmail; Tue, 18 Aug
 2020 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:651c:204f:: with SMTP id t15mr10217514ljo.308.1597743917772;
        Tue, 18 Aug 2020 02:45:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597743917; cv=pass;
        d=google.com; s=arc-20160816;
        b=seqL4Imz4VeZlFQDURcvAE0zF0Nd1BpVrxqnKhclVKUxGdcZ+VzCyKLF/JX+ofV4dW
         r19PeuU+T55CEktO0XVyjUqq4+TBwanAxBb/SWMrXaGlCNOVGzd70dS6n5woNKUjYgKf
         zlE95qNqyTFi8eiRS5I+MckrNzP//4cMHoIF7mC/R3E9gxnBRGr4zL6fWosgjanpCZac
         SGxKl2wXQxb2vyEcrEfLWrSQQpFjJnfgEkQ7iKur877GZlUa0YoXmf6a+2gI27YNDjk/
         V3DcgCQb11HrFwigAeBiWmKcIyjy0+lPRFg0fVX+sP/tD4U0d2/y7WmuAeyJKdwoiYJo
         oy/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Ty2RSaueGZq9ttvjoMh/70AiiMsGOxU3YfryI4aWtWM=;
        b=g7y0/ne/UtMACPQy5CLQqo7COk0kdnRDJH66VVAdzvAqI0cYBrY4mhDnroDrH9vo2Z
         NAgiLult0ZumVuGlgbuk5bUTPwk9HVE7ohY6XT0UcEJyoRbamRLtTdyc+DmPMfs+MXVS
         MUg1kC2Vo2t6grorqVaESiCCBhnMMZGP3H2/Bkcx6mj86hC1ssq7WCtmUIGwR4MGigZ+
         30GMurz4NpBaR0dmT2RVEa9nYEJwJAw8u8hii87MVEwtcGSFK3zwA4YyK+ZEDGNFYWMa
         3qCPzg2cwccz/0kICUr5J2vo6HIa7xzfGr04pZOeHz1mRJadxzJwLtF2rcCEeKePxThX
         f4Fw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Nz656Dkx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com. [40.107.20.55])
        by gmr-mx.google.com with ESMTPS id t3si569228ljg.1.2020.08.18.02.45.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 02:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.55 as permitted sender) client-ip=40.107.20.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3L1zY6TROJGcCHPlstkxSe6zxLC5cEI6QOOx4PQGzE9Crd+hhmMl6oxy/CIB+k8bLpQn5HhONOc4RYnSg3zqLykWcUQYwPTMuST58g/HHwB7Uf0rB6AyGy7Gweq+gCn/HWYSFx6+DAEh/VVNuzb31ubMFUgRaRoYkMO8rUYag6LB95uSM1yjT4hm+CTeKd7P/PQ0pQd0AiSLfmiPri2SISu95tERuSYhQ2l8oHVKvzQOlczUX7YFkw2xjnMVaOQx0bNiAUi8wwTi518kqyUZ1rjrOZOtPj2mk9hSHD7S3Q7hUSOgF4jIxQxuiPryLn+hp4nb+x4QAJAtJKOR6+Vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty2RSaueGZq9ttvjoMh/70AiiMsGOxU3YfryI4aWtWM=;
 b=jdtULuMRILX4GejHoaB0xTeLyurD595L9warGA/CB6xwIuaAdyBSp1bs4hsklr4J+hEgMWsXdClK26fL/dG1k8LZ4rapOYsuXt+gBI9OYA6vywzaeRVWqlvujEY7MdmTsONNL2EP/HbS2WGxSR7C7YD9Y2HJ2ixjALUxAzrk3xZlFgMBVKb1EjakXTLT49GMD0Su55JsV72XkJjO2uI2f1CVohhsZk6bJdvzFmtqKvMDQ142SnL8ieCZOVZWhO79SJ0IxExQO/gq4zF7C9rEr3wOPdxthP2cUcBNq1sAUdNB1CH2o/a7E89GjCeppQga9z1y6fMv1ma27jba8uoBrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 09:45:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Tue, 18 Aug
 2020 09:45:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: RE: [PATCH 06/10] Add libbaremetal
Thread-Topic: [PATCH 06/10] Add libbaremetal
Thread-Index: AQHWbGRD5zCxHBIdykSEGCFUwoysfqkyir8AgATRQiCAAAoEgIAAWiYAgAALm4CAABXnAIAAA9WAgAAHtICABC77kIAAV24AgAEB4vCAAAZ7AIAAMbuw
Date: Tue, 18 Aug 2020 09:45:15 +0000
Message-ID: <DB6PR0402MB2760E6327F6376DC675A066B885C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <4bfa6a8a-e4a8-9b4b-eb10-820242fab80a@siemens.com>
 <DB6PR0402MB276074B8DEA27776C106C72D885C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <977b8ea8-ba1a-c7be-e892-dba198d2f561@siemens.com>
In-Reply-To: <977b8ea8-ba1a-c7be-e892-dba198d2f561@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d6cb191-e4a5-436c-0a92-08d8435b6928
x-ms-traffictypediagnostic: DBAPR04MB7223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7223555B63060ACF27FA454A885C0@DBAPR04MB7223.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Po+34sjVzlVq/mhoXIM+2JGthnhz+bLOvlB2R4pcqf8V9g4KTw1OsT9aoykTFSheYySTvrem9L4JYnO33vsl6VlvVDkFLPWuiDvn8pV2v1VUZE1AlxqmV6AgNEQ5eoNJKtTesSfMNeh0xlDZqKfDAq47JihstKik2QaQ6iJItC6ijSozdBZTpxw/v/wVAMP5TEtrzXXyGmXFwT8H3cpBOdQdaMU+lwG+QfOSUkuZNcuUYRVqGmDJdWqZZZV5iWKE0SvbN8q6mFr9HnKH9vmR5eWsTzWsgmaZhc+cc2sMqC9VjwM9zMlC4efelKJ/HHOPnCChFbxziuyVl5CmQS4TVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(66946007)(76116006)(33656002)(71200400001)(83380400001)(478600001)(2906002)(8936002)(86362001)(55016002)(44832011)(8676002)(186003)(66476007)(66556008)(64756008)(66446008)(4326008)(110136005)(7696005)(52536014)(6506007)(53546011)(5660300002)(54906003)(9686003)(316002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dTwq2qS5Wi3yuWiQKI4bL8Od8GpykPhbPqMAVjLGhMZBC5UsGVOFUJXu4nEcpzpRnZJ2ykg+5NuOgq8cf60wBSDYfjOmNKZNgvC0xnwLANnR+wL5syy0Ixp4gR4+CgSxv5F0vNNygY4n0OMCrfVUEUClIFKpdcLg3FlxEE1OJLLpr4DtdtyZNIDg29tuSh9rb7lOMQt9ckcFG06vOK5yATvgnZlr+D4fXyrcQ0Mm/STGfWFxuwCwZewaenwnU+KrHBxvdEGW5qIrsReoPhR7I8IkPmryHE2rc4knUgIT/WUGl2YZXhV9R/NyAQFQfHBOWouYx0yO4n0L+ELsMr+PKj3N8XShS6dDG1K35zRD2x7fMOmBY7AmmQ+9L+vz1UaW8VO9qlkSDcIedy0+C7zYjak9bkUws2ENYTitogPC4Mel5Utuf4zb1oj2WAmlWvdWgBa6w4gHjqI9o4D78vubJR3PJlT/zsmFZBGsd6L3uQxEzD/oND/bjnK58mMzBmgA5XGNk6Qh0GOz52Qr28X2bV3zX9GoWpvEEu6QVblM7Uf+4VHVhDOLxYIw2R+3Z13vCX7Um/bliFb4IwiKTfwDHVMZoHSydYAqbxgc3ODxyOwRWTNXIBFbVjMbUKw+OlYadr556qr3AP+90E2tj6pR7w==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6cb191-e4a5-436c-0a92-08d8435b6928
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 09:45:15.7272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vEhHJZIM0iJ05ZisRGF9Sjd+VfPgi2nZvBs6OU4T0VWw+V9XVNesvrHNg3/zDahUv57OtZYCmSrCJAUA30Axg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Nz656Dkx;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 06/10] Add libbaremetal
> 
> On 18.08.20 08:22, Peng Fan wrote:
> >> Subject: Re: [PATCH 06/10] Add libbaremetal
> >>
> >> On 17.08.20 11:41, Peng Fan wrote:
> >>>> Subject: Re: [PATCH 06/10] Add libbaremetal
> >>>
> >>> Since we come to discuss in a bigger picture, how do you suggest to
> >>> proceed about the bootloader part?
> >>>
> >>
> >> The key is to understand to use cases. What are your primary drivers
> >> to push the loader out of Linux?
> >
> > We have product using aarch64 jailhouse with aarch32 root cell Linux.
> > With Linux as the loader, we have to add lots of hacks.
> >
> > Alought we are trying to upstream aarch64 jailhouse with aarch32
> > inmate cell, we consider to make root cell in aarch32 mode finally.
> >
> 
> Interesting. aarch32 with pae? What kind of hacks would be needed? To jump
> from aarch32, likely EL2 via the hyp stub, to aarch64?

Yes. We have LPAE enabled.

Just part of hacks:
a stub code to do EL2 initialization, built out using uboot baremtal, 
just like the bootloader did.
a magic code in the head of kernel head.S and secondary_start to 
handle switching to aarch32, the magic code will jump to the aarch64
stub code, then switch to aarch32 mode and back to Linux entry.
When aarch32 linux jailhouse driver execute entry in jailhouse, we
also patch jailhouse with a magic code to handle switch and other stuff.


Since that code is not public available, I could not provide more details.

Regards,
Peng.

> 
> > Is it "just" boot speed, ie. do you need a full-featured
> >> Jailhouse later on?
> >
> > Need a full-featured jailhouse.
> 
> But then how does the early partitioning help? You still need to make every
> runtime feature work from aarch32 root cell against some aarch64 Jailhouse.
> Loading, specifically.
> 
> >
> > Or how close would a static boot-time partitioning come to
> >> your use cases?
> >
> > Not evaluated this. But if it could support communication between
> > cells, it should be fine to use it.
> >
> 
> Sure, ivshmem will remain a must. We would not support cell destruction and
> creation, possibly cell re-loading if there is a good use case.
> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E6327F6376DC675A066B885C0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
