Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB245XT7AKGQEFNJ4W3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E862D2332
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 06:28:11 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id z6sf5653288wrl.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Dec 2020 21:28:11 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607405291; cv=pass;
        d=google.com; s=arc-20160816;
        b=VigviO9N8650dNQAx6jVY4y4yqU/uZ3AkPmyFM2NuK5r8Wi4SF0qoA12pP3rapUkJf
         UgXRcG6CN/mOwsgDT3L1YBmxVXX1TYzpEipf5JsbWREhIc7MCrrqvhySO1oPS71EzD5n
         HdPSsUIAjm4r4M7QXtzmk+jQWJ+L5yL6Q5bFoJtwuGc0U1zgEYlNdHRshj9aFWPMyv6J
         sMM79fe5HzTZVoif36CDOTK7mDeOJQMkjpm9Zf9NHvKbx3Q5DPZufi65Cn2e7Vdxdd0v
         Jz7gExrK+0SToUB6ITnbb4IgpV5Lns1tdAVBrNhA2QDMrhYGkt4k6ZVgVZfQXI3nF/on
         EZHA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=sa760jW/80q6k6sq6XzXEVu6UVDBF+CTEkFH3o5i9Y0=;
        b=afwv4s66kH3S/5AINRDepJpTcYiqSCF9XNtm/3nxYc9UyR7l/2cXLptPmbKmFe26no
         am37YEqwgSjXeUOie/Fovc2MB9WrxPthZy1mXF2IY+6Cz9Ol9i2hJw/qqkXF3evab+SK
         y2jLM1YLB9CzJNqwzB8TBug2ekeshtRiXmnqmSJx8+1fUqmJWYci+yFdLGUeOinPYeq+
         TsWewSrS4g839lT5R4QU/vbX25S98muK/srA54pIMQVCEiHCMGg/nnTKvnJTW/pK1dDc
         K80jWbc+/ysHO4O8sjhjxGu7Z7uc4JcHuhXqYzQAZul4BtZoV+/bF0gze+YRmpNtlIYD
         ggAg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YzvzwSNf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sa760jW/80q6k6sq6XzXEVu6UVDBF+CTEkFH3o5i9Y0=;
        b=sx1Y4T5h7fANzwIZuA3gyDyFi8XxEKFroaD7DUxS+m/5hhQnTNurkTdfh4zZ7YLOlq
         K+qajthvL2aEjghILqWa1EzEY+BqTDKCRO/am0F2B5pD55uCcmuBCC1oTJsP5EyTxh+z
         C2D8+gvNsPG/c0u1hdUB+H/v4bY/nzxBk0c7dH76wyuedoGlaIFnhAzQP7VQUTxlQJwl
         zgVwqJIgEb1BnyZ/DKbuk+6SuKWSBuqcvlO9rgbMpMHDp9JD2CWiFU1wE9idEML6JwxS
         KuPiNT7kbMLUY/EF3zQ2YELHvZkHbaBi7JaLawjBL24AwgWKtEXuNiaAOmQiJYmYLh+f
         Ijew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sa760jW/80q6k6sq6XzXEVu6UVDBF+CTEkFH3o5i9Y0=;
        b=kE/LswgUBsEgZlsVJUkbBEZZv4Nj/IxCKP7hXvmo6BTQAft7w4Cy1fqxnrdF99ow+e
         7OYbcPqflsDsP/6NreTzKYyS1Pj6ILowI1XAxFU4r7OkUwL5jkdUtsN/X0fsrSK25l+o
         q6rxOCORsAVi9XuniOjH91gP1bkQwx6Kqv7AKwmQ2gfooHWzy7RHibiapeyBXi+XO85T
         7A0f7uUpzdAC9PawRp0w2x33bKGz/0GkgITycrC8NwubHXzjj6KmBwk5mstbJm6A9jqL
         oFCRGI1ZigiZ/0dBso3StbsahE3aGGRuEpoGvxX28Ecqp+49/8slFBgOpOUiM1f2Omzx
         BjSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/XrCI1afRbjZXQ7ltCU0zGRxEF0Fi2bBzK3qlVUO55H5zDx5j
	6UHz0yg5XaEG3YGwrb3Wl5w=
X-Google-Smtp-Source: ABdhPJyMKPwtZKE0BZZI1Tcl0DYs1iHRwWxyxjvuVXYvg1aCWRN4TNn6e1QQBLkvzWfvgHYRktt8ZA==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr23141992wrn.333.1607405291402;
        Mon, 07 Dec 2020 21:28:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb0e:: with SMTP id s14ls1124768wrn.2.gmail; Mon, 07 Dec
 2020 21:28:10 -0800 (PST)
X-Received: by 2002:adf:b194:: with SMTP id q20mr11590743wra.199.1607405290487;
        Mon, 07 Dec 2020 21:28:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607405290; cv=pass;
        d=google.com; s=arc-20160816;
        b=FU+w3M6c9y+DajkFP37n995H4HhYjFwR2/aHZmzDfKyt5xH6Wdbrt0MG+nRHRJoffO
         YC665VJOyQuo5UmKC60IwaY+KPcXSDdqvy2Mus5efHtxjBnJ4mhJfJ7ozedeNwAi0WFO
         awfgdl5VqHX1wwBI4KWJWU3w8wDwn4MYhj5jIjfAc/v067uN7LRdJWe73q+jansRzS11
         Y9Kyl5rOkmlWiNGlmCzS2i5VR9j8g29BCksjVQKAooAcOEPTP2gXULgZ/jx+WraFlTW9
         EdWjSRKcmqdeI0wgrsqEbJH3Lc+fcmOkHzl/q2qQYxtX0z36lS7+pAUiilBbVMjpqk1C
         8uBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=OpuEX+2nGzYQbp5RxGMflSUtr87GYRbWHArGiKF2n1g=;
        b=vopr8Gv4nRfcowoKPOWSIigQ2J9xasDZCKo5lE0qW9EivlkDvpkXMXY8aX93AsBUX3
         1qGqImttBbd3EnNQLACy7Nr5NP8BfRV7AkxV35OLitSzcXgiiQd+E18mN4gG0V+CRDEe
         2+qFuSOZSo+IkF6Yp2IryemvKkyawEfs3VscIUUciNxoF16WhFHj+0H+jtb1P7t6vPSu
         SbhXtU9QzV1eukadcJvoMdSHTgM+nc4QDoP65CtWgKzStejpNFvncUgSojU/vHv7EWzF
         CUr7MEp7m0WaGWug7CgPc3qOmNkz+2lna9iqulVUsbL66XX7IADIPr8Lk3+JmKb8MgxX
         jB8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YzvzwSNf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150078.outbound.protection.outlook.com. [40.107.15.78])
        by gmr-mx.google.com with ESMTPS id x130si26180wmg.2.2020.12.07.21.28.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 21:28:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.78 as permitted sender) client-ip=40.107.15.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHqicx464ZiZkZxde2YV+x3tHoe2TyorIkrzZRpEUzcu4BOGAmIi1XUW4KKwYW9j++Pxxg/vVVkXi3Qg3gmzVqgpbUu4F+bkcNLJSRbo3uDyZwxXrJuixcY33GLgAlAjQSnYKg6gIMBphKFiN910O+Pwa3JLeC8MXTyNiDpreDnQBfrJDbfPgfuW3Zz28qvGIG8O621QrW3tPwn12YM1+I/9diwaWiLfnXngW1e4tEDLfVbL73JVp44bJxGBD5utxhHcWJWSsKOjf90NDPybFomZQPeV1/Rpa8IHha6d2oU9igdbdBWGw56g67WG0yN5MZTq05mTs+ePROzemjxd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpuEX+2nGzYQbp5RxGMflSUtr87GYRbWHArGiKF2n1g=;
 b=cJvVIKz2maqpIcEIErhwEcklQpQ321Gq+xGS4tgClYFgWw4G2n8N1x1Vle0515GMf2zWmcNgJNmfpPMl8xeK26+836l8RhBjRbLNOOU/yPaDEzDj68ruqpkh2hK63CCQCVwHfW/hhdM3NpR5HGWLM/w7/PRij4pHyF6ZC9AcaMAYqF405zbfZAgbN8AiHN6LGwxPsRPwcHpVmE1kgkk+snY3YOfZR/LAJ5ymaSx8M/6mU2+lGJ08VwGck0fyAJ5SiVJuBm1Hf6ZxHY9s/fevZzdqg5PAaPz915M2PmsAEveK9prMJ8bkT3dnClcnofWPdDOj46TOtYIw84bjHFVTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7787.eurprd04.prod.outlook.com (2603:10a6:10:1e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 05:28:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Tue, 8 Dec 2020
 05:28:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQADqiQAACSJ9gAABUGw0A==
Date: Tue, 8 Dec 2020 05:28:08 +0000
Message-ID: <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5025c16-da86-41b3-ceff-08d89b3a0c15
x-ms-traffictypediagnostic: DBBPR04MB7787:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB778732FEA383250E2CC05B7988CD0@DBBPR04MB7787.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cYf3GoX20nAb3Pl4m8Xxt7ae5sjp1OFsOApyE+s2lGmwW+TcNYKhNh4lXgceIG0UnoOGB2Z3Wsb3dF2dMO68gTaibm7A1xqVWhE5djABvte0RDwGIt4Hb/oFI5lbIsdTIz0vSnJ8kAfYnO5r7ua73xZ2JLGeHh9uqZGicu6sDHsqZX1a5rigEAPKrSchjvpqXhMCH3ZH6w79Qa+HyHqcGBTpQtCIvYg8W2mPh/FSjX4AzXjwBQ9JbVV/J73yGxih104qlrgm8hD2i8zNKecKv0gjyebTToyj1451j203Ul3BNbqZ4j/lVgbcR0ngePR/1hbzBjJODFFPY7KhfzWAUvr1WqbnQ7taW1FZa2JY2AP+e4jLjZThwl2j0MOS7j2m9lTZ5X3MEk7tj2SpaZDxtg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(66476007)(76116006)(66446008)(66946007)(86362001)(33656002)(64756008)(52536014)(71200400001)(5660300002)(110136005)(8936002)(8676002)(44832011)(186003)(9686003)(966005)(7696005)(6506007)(83380400001)(66556008)(26005)(53546011)(2906002)(45080400002)(55016002)(2940100002)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?c2JEdDg5YjQvcWRLR2VOcDBndVpFdzA2NEZ3a29BYkEwTEtoTm1NS3BvNUdS?=
 =?utf-8?B?L2NvY29rLzhhbFRKQUo5b082RUwzcDBaSmxRMkFoMnVEcEZpSFVQVzJKbU1Y?=
 =?utf-8?B?R3hBWG9FRnBOdWlRM09IbzBPSHZ4NGNRaDRZMitHQ3h3bXJDNGZ3aTRXTDZS?=
 =?utf-8?B?dkp1R0lLaStURnNXZnlQTEtBRE1XQ080bWZXNEowQ00wb0Ric3VCWlpUa041?=
 =?utf-8?B?MXJzMVJtUU5jV1FGdlF4NGlNZUlJRkhOaEJ0QmFEREZmQVRTVDFQeWpCMWYv?=
 =?utf-8?B?Zk1FbE5WVXpyNFZKWGZYUFpYSWI4blFvbytjVXJCYW1ZZ2VPOHk5TmtjQkZy?=
 =?utf-8?B?czFTZVo0UFZqanpLUjNoK1lQRzRVbEJzUkl6Z3ZhNko1Qzd4cy9SeHRidXFn?=
 =?utf-8?B?S1RDSlhEaElXWlBTc0d2dzBES0YwMzRiT1krNzNES0kzelpVTDhacXVuOW1y?=
 =?utf-8?B?Y3pOSzRmWVVhc0RHK214VmtuWXg1UmxjTUw1d2dibUZGOFFudnRlTmplMEVk?=
 =?utf-8?B?S2RtWUpmdGIzWWduZlNoNFBidzVINXZkNmlZRjdrNXoxNDJ2cHlKVUEzM2Nx?=
 =?utf-8?B?dFlFRVFsR29NTndFQTRxR2ZxS0doUWtFQnpZK1ZmVnFFdnVXaGdKclJsSThW?=
 =?utf-8?B?VlBvTVFYdjk2UEtOVDR2Vi84T254bThwUW5INUtMdTFpb1FRUWlXOVJCUG9X?=
 =?utf-8?B?N0hFdndxRXdVa1JiM1lkMVFmRGY0K0FFdkl6d3VxUVlsYjREOEc1OGhOaXZD?=
 =?utf-8?B?Qzc2ZFJNT3JsTExuaU5lSG13TW5qU1l0S2t5NUc2M2wxUmpsUlNWZ1VVNjhW?=
 =?utf-8?B?MktvNTNleXNMc3FKUEY1bUJ2UzQ4UDJPbDI1MTdQcE1GMENFeWY2RytVR2pI?=
 =?utf-8?B?TUtpdld4SjJqMU04S1BnS3lMblIzZFpZTE9KMi9Rc09kREZFUW5ZcnowWlhY?=
 =?utf-8?B?emJaY1VVOGxoaDdIV1NWZkRLTEp4RGljOXoxdXpsWTM5VG5rak5vYkVYWTJM?=
 =?utf-8?B?ckRqeEdPdUdKYTRWUFdEL0h2ZUxtYWkvajFac3ZjNVJYZmhGQUE4M2RPdEdS?=
 =?utf-8?B?SnBIbUU0SHloVFRueHl1M2orZzNxRGtOSUUrNkc0QnVISHJlZFpFSG84REZO?=
 =?utf-8?B?R2RiYy9Tc1hROHpzemE0dFg4TkprWU01V0ZBWUJUbVpzOWtvNjd3Wi9Od24y?=
 =?utf-8?B?Tk9XeStEczl6V0pNWEJYUUlwR1dsL2RxeXJuZm50VUJVdjA4MzM2Z3FkTzBM?=
 =?utf-8?B?YUh4eWNmd3hvSTlORkliM2FDcjV6RkxWWGZQQlRVT3VoYWQ1Mk5SUlZHb0pz?=
 =?utf-8?Q?ewfDzCXr10lFQ=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5025c16-da86-41b3-ceff-08d89b3a0c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 05:28:08.5409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lVLwFb5rP+TnJDGS1RmVA4K121xb5jGueswZMAUOrZV5wBVWeVBTuWhK/BdV4L9H2fXzTNyUMXqETSbIJTbWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7787
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=YzvzwSNf;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: RE: ARM64 MSIX enabling error
> 
> > Subject: Re: ARM64 MSIX enabling error
> >
> > On 07.12.20 08:46, Peng Fan wrote:
> > > Hi,
> > >
> > > I use MSIX, not INTX in root cell file, but always met the following error.
> > > uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> > >
> > >
> > > I am trying virtio ivshmem on my board, but seems virtio ivshmem
> > > vi_find_vqs not work with INTX, so I change to MSIX to see how.
> > > But met upper error, any suggestions?
> >
> > MSI-X for virtual devices only works when injecting them into a
> > physical PCI bus which is using MSI-X already. Is that the case here?
> > If not, you need to debug the INTx case.
> 
> ok. Thanks.
> 
> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
> 
> But it responds to input very slow, when I press enter key, it takes long time to
> respond.

After correct the interrupt number, it responds to enter key fast.
But if I not press enter key, the virtio-ivshmem-console /dev/uio1 will show
nothing. If I press enter key, it will show one line boot log.
Press one more time, it will show the other boot log.
I need press enter always, then could see the boot log printed out.

Regards,
Peng.

> 
> device_status: 0x3
> device_features_sel: 1
> device_features_sel: 0
> driver_features_sel: 1
> driver_features[1]: 0x13
> driver_features_sel: 0
> driver_features[0]: 0x1
> device_status: 0xb
> queue_sel: 0
> queue size: 8
> queue driver vector: 0
> queue desc: 0x200
> queue driver: 0x280
> queue device: 0x2c0
> queue enable: 1
> queue_sel: 1
> queue size: 8
> queue driver vector: 0
> queue desc: 0x400
> queue driver: 0x480
> queue device: 0x4c0
> queue enable: 1
> device_status: 0xf
> [  226.993850] IPv6: ADDRCONF(NETDEV_CHANGE): eth2: link becomes
> ready
> 
> NXP i.MX Release Distro 5.10-gatesgarth imx8mpevk hvc0
> 
> imx8mpevk login:
> r
> oNXP i.MX Release Distro 5.10-gatesgarth imx8mpevk hvc0
> 
> imx8mpevkot login: Password: o
> 
> Thanks,
> Peng.
> 
> >
> > Jan
> >
> > --
> > Siemens AG, T RDA IOT
> > Corporate Competence Center Embedded Linux
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgrou
> > ps
> > .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F3bbd059e-632b-da36-1f79
> -
> >
> de1731e1352e%2540siemens.com&amp;data=04%7C01%7Cpeng.fan%40nxp
> > .com%7C155f3a290ef74116dbea08d89a928628%7C686ea1d3bc2b4c6fa92
> cd
> >
> 99c5c301635%7C0%7C0%7C637429301388787283%7CUnknown%7CTWFpb
> >
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> >
> 6Mn0%3D%7C1000&amp;sdata=7s7hZumLfWQ0bBKPbES%2F2%2FcILeuhW
> > %2BaFULzFB3Gd%2B4Q%3D&amp;reserved=0.
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FDB6PR0402MB2760AF37C2
> A42481C80249E788CD0%2540DB6PR0402MB2760.eurprd04.prod.outlook.co
> m&amp;data=04%7C01%7Cpeng.fan%40nxp.com%7Ca70e1df6e24b45ab026
> b08d89b24ed55%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63
> 7429930184238963%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> =sk6lTN7eZD2UNTgyE5PYWe94B4Zt%2FPdpJXo7Y6fCNh8%3D&amp;reserved
> =0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760C14BDE7BECED2A60906488CD0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
