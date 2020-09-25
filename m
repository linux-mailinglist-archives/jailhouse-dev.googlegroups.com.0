Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB2NZW35QKGQE5MF5NRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F0278195
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 09:31:54 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id n24sf717359ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 00:31:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601019114; cv=pass;
        d=google.com; s=arc-20160816;
        b=tjRdIX+EOg5wS1PHOcgNvI/tOO5nTDBXk0C0lsokWZHPdLE4d5bg6Htburi/m/QLYo
         liqMgFryT3WWFhFyNGt20FzeQdz1KLsd5+743pKpIQkYzN42WbWNIUL6KPnakkcTV5eM
         VSnvdiJ7T1+xWozW41gmx9CLWqWYPM0FtyVXdRAfr0ZYt0i4jCElDGwIkXHlmAfDKQ+u
         BQIFuwxyLN8qliU1B/WIYv3nkZQ/fS7ldU93zgPvCgz/cyIpgsd8sIKpH9rc84+DO2ui
         Bm8t2SX9Rzk1qqxnkaNaAklSbCPhgLiCWMcR5ZtDZKonxHOURkObUA55FyDZZhSAnbRi
         eXYw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=qBQ+GhloxY48668IrlgyjpjkS8MLiq8urttPpDLzhew=;
        b=hsElz8ItC6+ItPdw8JaTQ3Hrou+pHicUYR1AQP8m1UClxGz4JQDWyDp1IxUXMLsBwl
         2VEvVqiN8zQmZN99QCUgE6tYeDXq8QrVQwTKTWTTxgHY5cDMRHrQMcmOJPlw/noMCn4b
         CZiADx4U5OpmfR812IdOQNgwOkIytebaCI6qB7VKrP1AYqGuD6Kg/dZ2LGcuWtOGvCQL
         hdUE1HJWyRonvw4+E0G+Bjt4JocySuqCkMOeK1fAIOTW3dPyg7ZW8GBZKAbSvuOkAnVT
         hu3SCnuSpID/TZ9/Dkfhfs3jCd5JnVDHO0e0bqyNb4muMvw4k/6fvzqb4hW/Fk/kMy+G
         Fzlg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Zi9pcfB2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qBQ+GhloxY48668IrlgyjpjkS8MLiq8urttPpDLzhew=;
        b=e280gs8RIIiUaAR4oaxQv8qMM7LomMb6h3fxsn/PnQT2D89y1UXBOE7W6kDFYH9e5a
         03kxWlqOa1G6luq7Kwh0yXkRsHb9B4cB6UnHgHjD7KhqrvVjqSIcHxeBp4NAVG4XNUUl
         mLawI4oLEj8G/hk6r/uADTjnfDdDT5SRuKLqu77WlVaGav+tO9OV1kqTZ/sGTWz1kXlb
         UEvI2j6vm6n1p8bzPaJny2lKfP7XANREPqdERSce+7Bchb5boHssysMSypIR4u4eacF+
         2OqhQdGH3KKqax1fo6GmBj2d72a5Y5Cmmy6QuTzY80TpfiL4nqCV6eHlb7x+8NY2hA+R
         Fnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qBQ+GhloxY48668IrlgyjpjkS8MLiq8urttPpDLzhew=;
        b=TkzJwISKEx3K1DZSjEVAwXokWXwBHM+eVb0Z2kUdQfDJjHg4GLvp36qaKsR4BJThFj
         Z5L08jDzoVTBtG0lDwwpZ5Ys9xsxPcu0onltTlzvg7WFbQkdR6WxI9q717PWc4VvzmQf
         OR+rlDHDuWeoXFK7LldxS1otEFuELggmPVk+SSH3S+EBBYOVH3SsAQXh2U0tIvAUl8tn
         +dtccEMX7A4KOyG3SM6pOez950kvcb3vcn//znyUajfH0n+DvKfdBWsabsQykt2I6Mc9
         cjnbXGRGIYOP/QsqVkUBXoZHQ9s+Q4+1xkrkiYxkx+HI0gwyQdy1RLGYcYjTloIDr1wl
         ctSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532u4Ho+uWCKjH4txvw8r0sqtBRJp12owBrhG30KEE/IS62sE+uK
	oDoUXDdRp3CWeDVyoQa3SCo=
X-Google-Smtp-Source: ABdhPJw8Dsfd+OFIerkUJXMtqHcuBnSjK7+eBkWcWtrAGAzd6WS/LM9lJS23GmEkKL7B+S0/pM8VdA==
X-Received: by 2002:a2e:a58c:: with SMTP id m12mr960597ljp.378.1601019114394;
        Fri, 25 Sep 2020 00:31:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls26958lfp.3.gmail; Fri, 25 Sep
 2020 00:31:53 -0700 (PDT)
X-Received: by 2002:a19:7fd8:: with SMTP id a207mr978113lfd.11.1601019113030;
        Fri, 25 Sep 2020 00:31:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601019113; cv=pass;
        d=google.com; s=arc-20160816;
        b=MMqsiDTkjILPZNpP8lHupQvb+c6EavUF3mbihD88aE9cRca+SOY6a+Tz2dkytQ3pge
         FRRG4rZjgUfUybJqjtobrwDyOlaLmJIkUwI/6o53yY2O+qT6FEmvjZc4+TdYzW9Vf0XD
         TX4HfqYbmmxv5EQuGgmsGZ8jaXcAWMVqJpTKR8RUm5Di2Rgf3THtKOjkSXUX/tQJkGlP
         ZhnflDcsoK9Anq/TzS2IhByMc15Jm0nMYhig8VhdhDo2H0JMVVfVZZFo7H2TgQhclxSx
         QQFaNkfduPmDvjyjWTZTAM3K+EN7f6NFuGrKFXcODpbiD2XDRCevmyuZSZ0uo9brYLBF
         BqmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=upPop1rkJ3lnrHF9X4BHSrqV31iSprY/S1+LaOfvkrc=;
        b=hmZXSklpkNISl+L6X/pczAMmUlHA2Pk1uB4l8ScFRhgPNO+W9KR8pq8NJaw5/k+AAr
         +Cg+3gsBKtuhrGXIWW6rCd0wCOUaLiVb8+T7HCIeXcSAvp4ofB0Posn1moWE3W/T/GMo
         zk5YzRikylm+6QeZeXXyPukVWlEtRX3SJdEaE/dxeclnoGY1w6FabMSkBvW+lJYM6Mqu
         2LGEB9lrBO3HgxREj5sRfiOytK7gkxAs0E7tW5XjADHxH0VJqBisAgaYJsOjSLEB3r5D
         HHTlV/EtL7ilf01UnlPamYqSPH6ox6Qvai3UcGTAgKHMyRUBmoP6ciV48bcgp91wBQ/d
         63YQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Zi9pcfB2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com. [40.107.20.84])
        by gmr-mx.google.com with ESMTPS id k10si51095ljj.0.2020.09.25.00.31.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.84 as permitted sender) client-ip=40.107.20.84;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUzaRYg96OKjl5r1zljdKyEL0OPIZ3hVD7Lx5zn3w0HKpiZx47PTUYtT3TxDH0djMEEsyYt4qmOPFA762+h3UjrGVjwlqelojVEv2p2KfJN/2dA6gvRAB2QL/YVOln6JrpLwX2cyS80eriyy6jR2ZTJn7pWY5si4Lea2c6+8Fj0w306EF7S6Ik3LJqU1zAmZQwa0dx7tNt+gJytwPPxvyEwntZ8J4zj34YZxoqdcEI3PcakHWgAaui/P7K09dalP5wvPKEj/5/q/HRjxLh0SoLKyI776C1ScwB0UqqJHYenx4kncZLhtbRrzwvWJjIZeeW3snRVlS5wZLo/NqJjx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upPop1rkJ3lnrHF9X4BHSrqV31iSprY/S1+LaOfvkrc=;
 b=LRMACnIcc/hXBACFGK0Bge1vJCtNB9ah3oSz47ahOomNExaOdqt6/5bfYCZsNRukl1mLOgRaHgvuHnOpfDmy88+Y6/C2HbplFgwn3dZaHv3Al5NwoxC14gdZUUnEQPLY3ZXIMlsbFAHXu8BhrF2+kjmwdRoNfFGBCIEWCyYdTFueLQIEPY8FnXL4Nn8S0Xcbz7SLKK0ie4hrNft0Vqv3ni+ol0akavS6kNkJzebg29JpsAfoe24rPxxLs8aan6wyY79ppxFgk/si8qgzZAxqCRH+P94rj1adX6mEnWbzu1hlSXDeX9BoKBUrDYw03YqOJuSibcb7iaIZbMSgdRFP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 07:31:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.022; Fri, 25 Sep
 2020 07:31:51 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Topic: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Index: AQHWkKwNK0JWEvsu4kGyPQM5pp+tJal49wyAgAACZgCAAAC/AA==
Date: Fri, 25 Sep 2020 07:31:51 +0000
Message-ID: <DB6PR0402MB27609F4FCD02299AF5F4A42988360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <e566d2fb-c942-ec6a-829f-0ac22b3c5ca1@siemens.com>
In-Reply-To: <e566d2fb-c942-ec6a-829f-0ac22b3c5ca1@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91727610-4baa-489b-8408-08d861251203
x-ms-traffictypediagnostic: DB8PR04MB6859:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6859C74213DD5A052F4D6E0188360@DB8PR04MB6859.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +oUC1/5Q4hixw6mLTkCm6dyYJXHTcg+VgbIwEoJK3ncKEi6O3C1mkQa32XrnvIwJOSC6fuWKheUwca1t4PHhLJBc4iUDuY6xqDseBo4Oy64m+qbt7LExdIbeDsxnI7H47BAwzoQrVKJnPV7/+yzIlDzG74yRZ9NOyEkJLWtbRHabyAxb8X7In414LdGq6DEuppv75FvFCzeK8fvqZPzfV8EmBBbd44RLMdPbYyLA+LkEJ1OvfdNhgQIpngRt8NyA83URE9E/P4accg/jMdc0z1KVm6gGF0SfNwiDRcXswYBZV4uMp1MKJeysbppheH4/93p4pg92gBPDSaSapSuDgC54P9ay8esBHfhiL308vBPGjfQ+A3qwyejWpgMN1AIJ2CT+mUkeJH8u1AV+tICOS4VWrVPLCR3ofJrHMIop8zo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(66476007)(66446008)(64756008)(83380400001)(7696005)(66556008)(52536014)(66946007)(2906002)(5660300002)(76116006)(110136005)(316002)(53546011)(44832011)(33656002)(26005)(8676002)(186003)(9686003)(478600001)(8936002)(86362001)(6506007)(71200400001)(55016002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: i0CfW+ZT46+dEiRPkqmRPHRWomWHXLc/DGpsA2f9hGUGJLf0o6pGuw3vXzphEgjKS/ZCKQvMNTYgbzpYSiDKvUNd1RVROOnsjB/WGUVkWi1rk0FXRoQK98+tvQ6xY2MBZ96X+RDXLY/AmqRoiJ06Lu0h3M7kuBwX1KX9vwWw05AXi+CbvhH4ZP6HGKM9XCCKlnzGtiqTm/wWcJgnDfEeeWPAqEelAl6CpNEIlPjEMt1tpk9kj4r24vtDq+wzTgE+ULSVGTSrZ5VAQkMlIpeuwjrVlft0v5x9YysSgH6MNYeXGGWNUSdXhVwKFMHiMfuf42GBmcH+eF71qhH5IwXeCNHOm9idde8ClgflFWgTXLAmh8EceLRgCfAMs+sLOULaZ5x0G1k1xUui+Pi3+yGIOhsmNNvF7QgkCs6kAKvqeh8+F/k4oT7UvbtT0LTgFJzBipHDjYb5OBbNb54NvgEPEpKrFkNhethOw7PeOEV8GgvJrCqQQovAbSBd1g0cANYQvFmx2ZM4FUnkLqPYxtMzlW4l7AGvpz3D5ps/zf9Al/NQj/fKyILgwvZklrG71Cb43LzGvdT7ENqYgz2M2rKThvqH5ZNLld05f2KoUpjBa0YTsL83r8t7lsrhbAagvFd8TNnDJdEJ1x3ZMbMoVtFR1A==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91727610-4baa-489b-8408-08d861251203
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 07:31:51.5580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhTP6zBnGU5SWKK0UVoM/AypvHTCaTwPDV8osD9Rg7YV+tDKFN1dagincuW6opoeP/4YnQ6B00nnNZ3w4n1wsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Zi9pcfB2;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.84 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>=20
> On 25.09.20 09:19, Jan Kiszka wrote:
> > On 22.09.20 08:45, Alice Guo wrote:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * .pci_mmconfig_base is fixed; if you change it,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * update the value in mach.h
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * (PCI_CFG_BASE) and regenerate the inmate library
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_mmconfig_base =3D 0xfd700000,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_mmconfig_end_bus =3D 0x0,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_is_virtual =3D 1,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_domain =3D 0,
> >> +
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .i=
ommu_units =3D {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D
> JAILHOUSE_IOMMU_ARM_MMU500,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =3D 0x7f=
80,
> >
> > How is the sid_mask of a platform retrieved? Can this be derived from
> > information in a normal device tree?
> >
> > Or is this coming from here:
> >
> > /* ID0 */
> > id =3D arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_ID0); [...]
> > /* Max. number of entries we have for stream matching/indexing */ if
> > (smmu->version =3D=3D ARM_SMMU_V2 && id & ARM_SMMU_ID0_EXIDS) {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smmu->features |=3D ARM_SMM=
U_FEAT_EXIDS;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D 1 << 16;
> > } else {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D 1 << FIELD_GET(ARM=
_SMMU_ID0_NUMSIDB, id); }
> > smmu->streamid_mask =3D size - 1;
> >
> > If it were so simple, I would actually say do the same in Jailhouse and
> > drop the configurable. We may even demand ARM_SMMU_ID0_EXIDS if
> that is
> > practically the only case in the field by now.
>=20
> This was non-sense.
>=20
> >
> > But I'm lacking a full picture yet.
> >
>=20
> Seems to be the DT property stream-match-mask. And that's unset for the
> zynqmp, so let's see how far I'll get with that.

To i.MX8QM, we need set the mask to extract the sid from bus,
otherwise smmu will not work for the client.

Regards,
Peng.

>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB27609F4FCD02299AF5F4A42988360%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
