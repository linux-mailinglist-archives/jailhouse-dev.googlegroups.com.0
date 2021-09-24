Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBQVAW2FAMGQENAB4QUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id E8147416E29
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 10:45:54 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id z6-20020a50cd06000000b003d2c2e38f1fsf9577093edi.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 01:45:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632473154; cv=pass;
        d=google.com; s=arc-20160816;
        b=oP1IfIrg8SaYGjwYMi9geTOqrCDD296K/neiYoDzcreHxmIVfhlEdTt/a4F1VQC5bv
         vEtkaCvvRLg+W/x3OIICNywOSEGnsf/iyShBV52gJKrl+iBsqlWuNZmds8O/9GqeJKnP
         E9Vx8ywNnsRDC1KianVPpDP7rt0AKokRVeRZdT1S8yzSuNGQ0f6C3L20P18otmnaMabY
         rqVwUZK7PhWIViVaHCadMcIO0iKjvBb8UCKxltH4ii5C7yziVBUO3z1WzETUvi6xuHCc
         ahgFLkxlPeaabY48CPdAHzXKwnmBgQTRcJ7tsr3H6MnbwVEBGUIWsfvgjFIakQskAJrq
         k05g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=w66NnuXcsET8c2rFjGLDqutJBzHZCJDG6qxFrCWDR10=;
        b=G2Zuk/l1sj2GF3tM7n28lrxPqeIQwLhevnYOpJRU1W9JRHBdQvxpLpdiw1SqUrMtuW
         Iz2VO1844faUfmIxSWDVIndmVeNbJBAHsSH2A4zKTzS080Wkl9UpEM64QQAWXCFEORmK
         M088gxN5MtnxDSB2a7QhcWcCAbtA1Og/LM5ShBRo41FN3XIF3wLbLCVChUqhIzDiWdAm
         8NzmaRy+1Na2qQ/2RqMzjEdTzSRCzqp7xaYtViYbrCFeEwJ5YkVPlHniED+yCE1OOrDo
         fEyw0JgFX5wd9wX3c7j5v3T0ryhFDN6GopLsMSfSiCa9ON/TyiQiSWXXxOmzKzOsX3G8
         /+oA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=HPvD14C1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w66NnuXcsET8c2rFjGLDqutJBzHZCJDG6qxFrCWDR10=;
        b=YeDDxRZrnlAptNVbgjpznBEjo/S7Ti+U1Tyq5RiA3fuw/48r64zW9nEsPwrbRyco8q
         0RMlbZHGn2rPMAcD0uT+AbRftmD0dUhV3hIfXXlfWql33C4q2JwVjrT9UD6BSwNbZAI8
         Z4SKWyfFKKM5BEtZr2RYNRZo03bmAL3Oalv1V5yL7yf5+pJ9RtVcUaIwaYmPG23WLdEW
         dkh5m1kMnU+tfuDBVbTuOJN/k9DUNuo+te/TzTmPhhiKdSj3uY444EGy9jdDAIDikD9c
         3MArkIxneB5j75MVCmK/EFYziZz+Js76U3npAIc5Eb8xKiuZZhFa3Ey3iDxxKuGH0B9F
         1ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w66NnuXcsET8c2rFjGLDqutJBzHZCJDG6qxFrCWDR10=;
        b=CcYIQAE9AnWqd/1hQJY42+pDxkxkYZBq/K7zlW+mGKCRPdh0Y2zl3n7CdudPj/707W
         HUqVfdgVmiHPqUEee3q9ckFeE+XuQM/U5Y6ug9QU7RSWuGEurUru4bbBBGGtXRuieBz9
         HKqy6C5Izloll4iinrrjgV5vfC4wLgpy/EiXxLqojcQDygkZ/xcXm/+hRfW6/QUVBLFc
         45imGRzqbr0pudDq0Ivkc8el8A5ZjLRftUvSOT0E3PagWCyfDsozSBGQ0LeTQmAamDBc
         NtfGVTiymJO+XfrCr/oLKU1qgMF1crsO0Hx6FhRqDw0sUehr4gCoIJRVjDxa5WD/pcms
         Fa9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531N5HqhwBg90LEYwJ6hP2/0si4Ovbuv3Dj6N3OJoorcQr7fOc69
	leV64LJ+vk0BgK/2Wf9tyZY=
X-Google-Smtp-Source: ABdhPJw0EOLhqN3o92Po68M8jC+U4isIVm4Qo0IrwXrGlO1i7FE0w3CkmSJfAcwFLKskAQ5sRwAmBg==
X-Received: by 2002:a17:907:9604:: with SMTP id gb4mr9981972ejc.142.1632473154552;
        Fri, 24 Sep 2021 01:45:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3597:: with SMTP id o23ls3712454ejb.8.gmail; Fri, 24
 Sep 2021 01:45:53 -0700 (PDT)
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr9941027eje.165.1632473153316;
        Fri, 24 Sep 2021 01:45:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632473153; cv=pass;
        d=google.com; s=arc-20160816;
        b=L83dDWobet/SFSWm0qlGcsfQP5lzQ5JkBg5iG0o068txJX4YsJARyMKnPzjAQzHkWC
         8Qx4erdOTeCYoc/DhbI7n6NNWDzydbV/dgPWhwIiA1SmlIxBPBNMkQ+TnR4nXQoBe/OC
         ePKjmutkGj94Shc2RWkkkXi8hzjCAl5Ndc4BPLifA9pWyWDUSsBcmARseJEfzN0R3vLc
         ZD3ncG1S5r3fVBBjIkgOGLaUfq0uSp4/Iwg0QLF6NtSQY4BX0TOAPHHVo5KC30ixW/3B
         VXqvgzdr2AmmKlT7ONo38FBdWyrHu1hgQfRK/L6dGNJWdXrho5ESJjTT5XzHpCRdonGK
         97Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=+5hi8L1F9J+AB3kSNrrsIz9fKtyA8MCOKYGylokNcc4=;
        b=pPPv9T/q+jLuldWhn7mqlYJrlTIqToB6ysDi7v0jaQ/evuPHwaXkb9sDScbdf2/UQA
         wg71Z3dj/Z15FZzymbXqRzPhRH2Jy1f7ETTQGCGYBbJZO/PoqDVPxSB2sSJQzDVFKJYg
         U4qRARqiJVTw6nmDre9pafy8DBtCmtB1eK/aKbwwY4wAo8b2GE5Eks0gIOuWlrayNSOC
         rLY5x1edmBDTlwVMbeKzSJ0RnUXRdOaoz+1pos8LcBtcUcpFPIYkNTz09sdm5DNCGwns
         F7oCIC3Q9lSkbLBk+FOrbhWenpmj367kzgBgO/3+XPXsGDUDrGUn1rBfNHu6C+x6rS5T
         fkVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=HPvD14C1;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com. [40.107.22.56])
        by gmr-mx.google.com with ESMTPS id 6si409392edx.5.2021.09.24.01.45.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 01:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.56 as permitted sender) client-ip=40.107.22.56;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1utR8MyqoVhNpc9hlwUH4bbziFh1jxwgp02iYIYZjBEuSLrFrq7k7NkuCo//1Pxbeh+m1aZrosvcBhwHmTkarOTG31s88b9lGVTqB6CpzczkmKJMiGaemvqMbNNv5nttXqG4D2nwz48JieVnOFmuTO6FyyioYXAjhSKZAkyauDz5yzFITpO9jZC1WnkaDWg8hTFIg7tG2YI2vPkMRDerIFQaSzBEZlo29hsp3ixXks7P5LmExwpqB03wSmYKIr2ADeST6iqPgk7rwl6PXsQXxrzkeEl+g44Zfxil/hLbevA3PrfRk7ixX5H2RwPp7KN3CSJTHUWcndlEVxq8D/hTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+5hi8L1F9J+AB3kSNrrsIz9fKtyA8MCOKYGylokNcc4=;
 b=hQ7c14j5Cxr8NN9h2pZZNDxLCHak2+oVenKWTBpkVcvj8JFjsk9aD0mQNaW7I8nyMg+IjMsPeNlAJrHzi7GZotWqUIuB6+MYIRdTC4LxdmLlr/tCM6IOY4MSYeplckTaB3aGQKaoz5KwPcenwbWWxA3rhJG1lkQSCdZD6Bn1PtfTPGiPiIGa5cinW1t0EN8mIrtI7BAUEH3NhadbfmVuwYICXpMsXqc7PJjxx2mlx4oEsSb9ppe0yFp9wWD6i68qlj5RDXNuomyvmk6YRTG36qDFF/KW94s/kjptHMnI1DKdiw9/Hbar+WnLHhlu8pr0nB64B1yB2Mqth0HxYK0NWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 08:45:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4523.023; Fri, 24 Sep 2021
 08:45:50 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 2/2] Kbuild: use toolchain stdarg.h
Thread-Topic: [PATCH 2/2] Kbuild: use toolchain stdarg.h
Thread-Index: AQHXq5g/TOqkDX1xEEaIdF6XwV4r4quoEryAgArWtZA=
Date: Fri, 24 Sep 2021 08:45:50 +0000
Message-ID: <DB6PR0402MB2760C093D4F7223290A0189188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
 <20210917074630.2585329-2-peng.fan@oss.nxp.com>
 <65d5f035-decd-c602-4a53-4ce898b22cfc@siemens.com>
In-Reply-To: <65d5f035-decd-c602-4a53-4ce898b22cfc@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0ef54cc-85db-4620-2d87-08d97f37b622
x-ms-traffictypediagnostic: DBAPR04MB7285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7285FD2E16CEC616FB16F40D88A49@DBAPR04MB7285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A2UB2iBNf68TCBUzbHf9HuDTNksx1KjTJ4hgtjvAR/QDe/pH7eMYPGgMJaGDOYRE+XZa//sEJO8Ij1PZV0LgxvMtCranvyAN8bLdQSOBKIv8dM/0at1n6g3MBgiO15MY+6Ml3ASCVI3jJgK378+na2qh9WlF10YFf3SUUPCD5hTtF0FKniD53Q5V1mw0SWyZ2fEJ9wl1tuUYy4EOdjpTrrD1KdUMcmcqrpp3FT9ARHSktnM8xQvicZl/TmLDG2RfkESQWhBI3DNjbRWuxHbkj+XtMzvro43DS8zB0yd2ic4C0iNGsX9xzeUFZckbAqpith7cRsWslEDVJ+fUrksZvAKrZJBi4M3iufCfIxMWXZOV7DPaDC1A27Rnb3z4SY5PlakkZRHEQz8RUYPsW2nZfLIxWoNbknKKke5qDOgnsNC0jmIDik74lwNXWKQsiQKbKKNgGeqB4vKqAIDocGbUpQA3yInUtq37sVrHJLfjv56jMwLNtip7UbttvPlt3Wc34XnHIryQHreKsLWRRkmdXSOX9jNA+3b1oU2FlNyd5aIiVmVOKBE4OL3kke4OLFsvgdmkCIrAvzf9Gcc8g6FHGJcZtNIIjCWq72Q6KQmOvNJVdIGXri5gGe5IRMIypGaqayjexZzvdU9eyPi2UAwbI38dAoSqBPkqzYveYw9IfyDDEjF3b7Snkz29Z+46D4D2GISymPtsLFtaJW/pV+q2MT9N3nu/DjifE6b+vq2FGSuzyOTIyDaLLxn8T3eNXBNMP2k8GSyg9qXP9zT+/j+MQxJFTiV869BTyJQnhhP59ykis0HVrLSYGPeTzWvEp6O/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(44832011)(508600001)(83380400001)(38070700005)(71200400001)(66476007)(66446008)(66556008)(6506007)(52536014)(5660300002)(8676002)(186003)(64756008)(45080400002)(38100700002)(110136005)(316002)(966005)(55016002)(9686003)(2906002)(26005)(7696005)(53546011)(66946007)(122000001)(33656002)(8936002)(76116006)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TaLAPd713aIzBP99zOMDWbtYvkpD5o4+Jj5KOAyjOVmocSrcqudKYXcWRAi/?=
 =?us-ascii?Q?yK1USv/co10Ga+1Oyt6LvXBIwXz+wF7d6Y/2A7pe8nmDFc+bxB4RcDAlNsi3?=
 =?us-ascii?Q?U5ZqyfHO+KuPGxjUAqpCDo3a4CkZm1pB324TbYBFGF/mImnISPoFP5LYwMhr?=
 =?us-ascii?Q?rA56eGHVo6wTOdB2uT58Uy/P4LxpWx1hVHZP4IGsuWg2wAn1UuPUi8YGgRBp?=
 =?us-ascii?Q?70iUlOmQNBSgl8d/DrfDsaN3KGTscSMA8sxEDkEdbvOt1gaDv086UlXKc7AW?=
 =?us-ascii?Q?k+t8Ck7557EsPFpgjgKHNL+6PxEpnLBxFo6+9MXDDS4M7ry7stthi4vBtJLz?=
 =?us-ascii?Q?jgtdBSA2KnxHyEcqACQ/uz60nFMgYTzoA0Ucq7hUvWyDOnUm1D4FsdtMqdzI?=
 =?us-ascii?Q?ZZWJK1a7LH81OIpVpLRS8BIPtNxh5Iz5xBjJMDwyDOKPduAJ3KRWNuB57Dlu?=
 =?us-ascii?Q?cZ23LBXPfOhqSdv841NiF2GvEzBwaOZ1lBWOiHVYQwREZtYNasOGKGJ4DH7r?=
 =?us-ascii?Q?VH/t1bnSqOpcVVLy2Pk1UI0iPRRA1tF1hwlwavHg5600vuGdORFNE2nhKc8O?=
 =?us-ascii?Q?vjS5jA22a43V+WFEykXvWUKaWgcp+UIw0RbTYr5TLm7PRtGKZXoKw3e2prhP?=
 =?us-ascii?Q?71V6i2y8Rx/3jBiED3gnU2S3YsvUYZ2Eq1C9o4RqBUMZLIcQ4Xvqo3/EQ+JV?=
 =?us-ascii?Q?EKFv7+VqR91fACOMfiMBDL3Nm+gcb1vYQpbrP6mW0UVoEt4wn72K/IejlIbj?=
 =?us-ascii?Q?8590bWvVi0sF71ju0XpC2/eVQ/RmOtGLLiYHEDDu5a3yza269/Fq/CIslKcE?=
 =?us-ascii?Q?KeqdXKE5LRC5OwGbxQygNYBPV9VvUYJ20zuDSwa5W17yob2ga6raQI7pqywI?=
 =?us-ascii?Q?LSG/sW88LuvEwA78mTY8b2SPshXfs6JgMKNTYuKK8hT1LUzASEDYgCjeVR4g?=
 =?us-ascii?Q?lipdLBDRNmaZHplltSUXQp2x/ewIlOI2aZPn/eF/S+MMY8/eoeeTvb/lP8tg?=
 =?us-ascii?Q?7Q3d8TA2dFB7/vdsIvlk/TgaTGL6uILhNZRbZw3aU34ThD06CBwF9P9iuI+R?=
 =?us-ascii?Q?fMKTph9J9y5sj5h5/aSU6dBSlrmy/nyULcbA03hZrS8q04AtodlGm4H6YzTf?=
 =?us-ascii?Q?spa00utsSD6P+sHFpUqv/hQ9+hgPA8YR2YXjNcAqnvVgaZuaiQwx8tIuKcsy?=
 =?us-ascii?Q?IsNHFP2xpmgJkInZ6m2ijR1xR+26UH3pQLJA9yA5Mpb3N5p0+lom84dj5T/t?=
 =?us-ascii?Q?7WpBIu5L+ZdrQPZHOsE+gIjrrwYr9D4/+JnLlh2r1iUe7/EvS4J65jcFdb3c?=
 =?us-ascii?Q?Ls4CyW8dxXUCuVgPnWzanEvU?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ef54cc-85db-4620-2d87-08d97f37b622
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 08:45:50.4688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ns5j336XN/2CUDTcvh33rDExZnpiC/y5jYPpMGl7eoJ0GCfY8knDkuZgQl0Blli8HWtM0xWNYlqIds720OYOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=HPvD14C1;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.56 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 2/2] Kbuild: use toolchain stdarg.h
> 
> On 17.09.21 09:46, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Linux Kernel has shipped a in-house stdarg.h under include/linux/ and
> > drop using the header files with -isystem.
> >
> > However jailhouse need to support multiple kernel versions, instead to
> > add Kernel version check in various source files, update to still use
> > toolchain stdarg.h with -isystem option.
> >
> 
> Also here: 5.15+?
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  Kbuild | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Kbuild b/Kbuild
> > index 2863c121..fecf61f7 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -58,6 +58,8 @@ subdir-y := hypervisor configs inmates tools
> >
> >  obj-m := driver/
> >
> > +NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC)
> > +-print-file-name=include)
> > +
> 
> Shouldn't we prepare for phasing this out at some point, i.e. indeed make
> these flags version-dependent? Would be a single point, no?

Kernel put stdarg.h under include/linux/, so if need version check, I suppose
in .h/.c file, need add for all the files include stdarg.h

#if xxx
#include <linux/stdarg.h>
#else
#include <stdarg.h>
#endif

So I choose to use toolchain stdarg.h here.

Regards,
Peng.

> 
> >  # Do not generate files by creating dependencies if we are cleaning
> > up  ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
> >
> >
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F65d5f035-decd-c602-4a53-4
> ce898b22cfc%2540siemens.com&amp;data=04%7C01%7Cpeng.fan%40nxp.c
> om%7C261550c8b03142546bd108d979cc1ba4%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C0%7C637674739818118325%7CUnknown%7CTWFpb
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C1000&amp;sdata=EZRf7CV40nvMYwSyqgMUpTy4Dgl3ZP%2B%
> 2FSFTaAN4%2BlFY%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760C093D4F7223290A0189188A49%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
