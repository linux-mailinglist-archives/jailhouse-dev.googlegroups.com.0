Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBU6LQWIQMGQECQOEBVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B14CCB1E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 02:05:24 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id o1-20020adfe801000000b001f023455317sf2718261wrm.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 17:05:24 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646355923; cv=pass;
        d=google.com; s=arc-20160816;
        b=LCpYCbFyrjHM58K3i3Ly8UMUOpj+x6xzzGtaqhmmwiDUxT8PcxRRT6mHx1VW98frai
         3F7tDPUbxyaFcY9eiW9SjoNEVx2JrGxMVyRVqwuq8STLGXdZiArM6o3axPQ+JD+WyiFw
         d1GtSTqoPPkh46No8YJc1aab0WPC3lJcJ5tRgj89AOlJuhnXjysynW/LbhDWaYvn143f
         izEYj1EitRkLLAT076Bul9a3Za1rFs2xUaeD7lVlUVUTXjC/m8HErF1MQvrOlCIPweuL
         UpJWJl9St7cF/O8IY+luaYo34zZl/0pDbM52wp+LJnHNbyIb9nDHmLL4HhAzAwvUKLY2
         nApw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Zz4K3Q5jsrY2g89Rv6g79tyKF9nCopAlv5fUhNfgNhc=;
        b=CCMiHC/zPplhlM5EONmSagXqGoo8HnGLsS0ohd/7YMI27lu0xOMD8GD3uLw7Ll7Z63
         I/rFhVmdNVy0/pZI+0x0BeVpBE4+o0dTIo8GWjk3mL2VaK5SMmY7I3tkkdA2Ixla7ndV
         ZIvkszN8WNE58zfK/aC2JCWUs6RyfSOxUPEJCvu7sQrtYhkqj5Ahp1OwEHLEmGOJ81eC
         u/QlywAoX862krrPMlneW7nZyb5lDZ/9Se+4ssCzLp6iJF/85/+dPGzkgeqSv5OpBdJF
         daIBliu6p5ZcIM3OT3PUThN/7HD0p2Ev10QaF3zXQKQnm3nxQRWTuExO6cj9DxFgQr6o
         RXpw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZLZIT7Yf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Zz4K3Q5jsrY2g89Rv6g79tyKF9nCopAlv5fUhNfgNhc=;
        b=ccM7eRyxc8abe8hkfd9QElTdwyB8S+dOQeaNqs+f6ynvmw26VAjXcVTEtLD6Z8N8VJ
         HJ5rirRFV21tbgqadB6tn5GmAuo6KVln+3qeMr97mkyKGix9RwLAPE8/QLIwPEAbvXEz
         irre72rNZrzKK8VHqmh7LS9nZed22KIcLS4G6dny9JgFohR6qoZlIC/q8Flh6xD0VuQE
         opAIKNwraSd3AWVUZkaopKC4dEen9cHwU+jAO4oMdSjaDUVlJqG4VcUzcGln4vdPIVrm
         VyZzTCgrxxPM4jN5dYKkTSUmxcJm7hTujR3KoHvnnLnTh5Pk4My/mUc0K6YhXZ/Kl5aA
         3MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Zz4K3Q5jsrY2g89Rv6g79tyKF9nCopAlv5fUhNfgNhc=;
        b=MXm6OP/Jh7uHv/Nw49cwdVUgHtYFDRd0B4iSI2qnu7PKNktRcoKYkb0SaZBDqb9R9h
         QxxFegmYD+lft2FqEkhpQofixfpd849UkwAXc4aKJThoGGQxqksdzogby5PexWTIJhcq
         IeJEDsmR3clWYth47PO0Umj6LjDVB7VH9FTgrKVZFV5uYc7hQ6h2lXJUaKDAdWU4aieP
         jt8SOmIvavtHHZ93z49b4zqN1kO0RYHwOM7Hql2d+tfztA/EH+DueHzWFFQZsD+zatFQ
         ioDgnGtlLcoIz1ubkElaM1ZFgFq7S1EIEOkQ/elwSY3iTyJSPYPi0wqILHDaVO9GabmQ
         aIcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312yuk6kty4GRKMOK/i+1S1NjaBJpfYzUIIM7GX9C+0XXP6rjnV
	g5Q1XsALChjo3w5ju5ChD3Y=
X-Google-Smtp-Source: ABdhPJwn1cV4URnt9gCKMTT+LYWPsgf4kui+pskqZa235hHqR4QGNlnIjRIveTLEcTasiou0pXB9Gw==
X-Received: by 2002:adf:e289:0:b0:1e3:14ad:75fe with SMTP id v9-20020adfe289000000b001e314ad75femr29383151wri.685.1646355923664;
        Thu, 03 Mar 2022 17:05:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d0c5:0:b0:1f0:7735:e337 with SMTP id z5-20020adfd0c5000000b001f07735e337ls380453wrh.1.gmail;
 Thu, 03 Mar 2022 17:05:22 -0800 (PST)
X-Received: by 2002:a05:6000:114e:b0:1f0:4b8d:457 with SMTP id d14-20020a056000114e00b001f04b8d0457mr4621823wrx.89.1646355922367;
        Thu, 03 Mar 2022 17:05:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646355922; cv=pass;
        d=google.com; s=arc-20160816;
        b=OL6UlIqFzYWvX3P5vFY4SYNTtI7ddAefW0HgKnoW+DtzN9LkNpZs41DDgFlCuGEFVw
         nqJ0i8JlmJwqBPRwZF6LGKStEPK0ibcxJM+O9WZTTHRSnOyQoWQ7zVWQwhVTBAFIjFti
         YCuB+1AZHNUa4SRR5PYQGwUeny3cjkz0RTMPjcWktHWabW77R9I5v/KChcOp9TEWYz12
         LD6XLllVqYOeIdnwSX9EPwK8XtvGUnXkN/ndYnU20MQD3lKJskU55v4CyTVG9NcI2oF6
         pnu2xBdMoEkrJA3TlqoEFFlAGUHqxOpZqKzO7LrzWnUca+O9MszP4rMfY3pVHJEUft1Z
         4f/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=7L012i4HsLF83UDUCFUNKdl52VVdylco/FaPP9tvrpk=;
        b=q+ZghMkXPCAikgdk47NJnMmoFjFEleypELOBG5aAv3FzJmL201pQOReMrie5jBYyop
         qkfHV8HMlRo0MGH4fnKbiMD4EtYhUDZValq8IUIEBDhpyArOKTdL1NKSZv6NxDUN7Sl/
         BPS+GIFgmWPNruA5PJqq0K6MFKhJ1G+afDEpmtysZr/ZttM5P5lylOVLXLkfxg/cLi3N
         jqd1qKhe0R8nXL7VBwTayyMlvHilE705RT3voVYaxz+LIvVT0mdgF8VVIIpPye6V22dC
         Bu+HVQeOMs0EdVSrYgY6fGODKbVDfzaIHeNBA42dukXkREZwMdS0cI8SuzeGDYV/fHo3
         QJNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZLZIT7Yf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0627.outbound.protection.outlook.com. [2a01:111:f400:fe1f::627])
        by gmr-mx.google.com with ESMTPS id q13-20020a5d61cd000000b001e32a999ccesi219023wrv.2.2022.03.03.17.05.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 17:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::627 as permitted sender) client-ip=2a01:111:f400:fe1f::627;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd2Ab8lCLeJC3qvtBVd8e2FB4b0D5WFq47A0KCuBA0SgN6gN9vb1wHQveaQ1em9svrG3gDdebKJzpr4figsK17EbolgQjEubQCz0nTRyYzXBCYYQlTmxYhp2AMgcSmWBo3TzKb13Be0AegHCwBXN04kCKtHJsg0J3XQCmsMWrf2V7eCvNaovdQHRoa7Ue8f+uewkEuNYhCYIkUlMvxSsITisjrx6b4vWnyTAuVuOvNkqgdS1VNOE0Pe2KTj0bn/ImIdr7j9X8FGv3o1TXSMrlYllKBAancrvh4rNuFeGsUTN/mvIO4anYbK8E5t1unqGDag845NXV9VAMGNeovT/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L012i4HsLF83UDUCFUNKdl52VVdylco/FaPP9tvrpk=;
 b=YQjscqMs/0F5gBgMNU89JaNXZcj1oX8GT/yzrD8cxRYjccuVp18phk34SeAYhCIyCH39rYWQd0tMyolbMPo8n2FdMMwsgqpDsRMkuMrfQSAgUTkJa8ni5i1uBZmmdqMAxh0uZ4I1vS02ERLNHjm7dJqT8Ha5weenyPAKSC3sKQeTmfGWBNnl0d+eR2ui/pFZ0MzZ+xgTcoeWnjdK8HUjGC+ggob7QI0YKK0h0vtn2gOQrvpEbHI7DkAI1j96xe+DrXUWBj6KMvutcpqAnMvuzE2j4alnMSC9ao0THcaDxhB0li/MpABWTDMXIosxqcfTyehsRFd3Ghu71/IV867y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8275.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 01:05:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5538:7e34:6843:2bc7]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5538:7e34:6843:2bc7%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 01:05:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] configs: arm64: qemu zephyr inmate
Thread-Topic: [PATCH] configs: arm64: qemu zephyr inmate
Thread-Index: AQHYLT4STA/bIRfw6kC5+NyF4+L71qytkeAAgADbIbA=
Date: Fri, 4 Mar 2022 01:05:19 +0000
Message-ID: <DU0PR04MB9417FB18D5606654EE4A51D888059@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220301080926.15295-1-peng.fan@oss.nxp.com>
 <e100f09e-0bcf-3113-5f78-d1dbacc6aa11@siemens.com>
In-Reply-To: <e100f09e-0bcf-3113-5f78-d1dbacc6aa11@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8701b72-f35d-41b1-f8d2-08d9fd7b0d85
x-ms-traffictypediagnostic: AM9PR04MB8275:EE_
x-microsoft-antispam-prvs: <AM9PR04MB82750F64F9A6ED9E4FE00CCF88059@AM9PR04MB8275.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+I4TQFybqlESuvAW2LnIc2hh8ggfYzpIe4QT1xhy1qkdoFZfkOMlBE2uI4ICZMXw4cu5NUu/6dIIVPdKQmAE12PBEHg8wT0JyOC1P8/QLoEToVpEUughFL0JqBFsVeyNErEZTvMzQ3N5VwKUK7RPWs2fmTrdaz8mextPFvwxca0Lci1amy0P6EkIDDek1cciGB2QLqvT40JAThDunAilW9pKbiCRW2uKDyeS5CWscKsrOjJkKqiwhdxBChUWC6X8h5Rz0Ekfd/5pCqaF/UYECguuAFVsWhEs4+bvD/KAAMKhCGFft9fMhwNuFSMs4+dW0GMHo+UHAdwGqcV+SI6gdkOEtkTmTyq+Ke3S5tP5iIVAGuS4hDRut9wpcuLyc3hnRTQZwODs8tpMG5qV3qjjLLLCCzphg+6L/D73sK01xrGDac0QhH1ZK0gLRvooq+z0Fkd4JCs7PJSrPwWZ5MQUz+z0H9eotc8Y5QKgkQqJ4HFShI7PZvRZCzB/j3U6f1BFuW8L+AWxNs9/hqo7n9GQN3dhlcFUV7VDWcIFpRRbttJUp1d/o0NLuLDxA+G4ETkMFqymU3y8ieBQe7jTZXwFoFWrX55DHg9zPG9yygDfPCKM6Pd6HKoFvGp2qdaGDj8P6/5UryapwdCuG9LIFAJyPfJ81mvfd9/gU3YkjXCRnpkrEZ+I/qQOgXKthmZv9de6nGVQ1pvFt9C603haPz9ZSgv/NlCNoXE+KUsgPlTHcbUcL6uws4VHo86pLX3pdYmg6x2JC/CzrMwHUNr1fD4pBxDQMj2aGwYuMATDxvONQ4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(316002)(122000001)(45080400002)(66556008)(66476007)(66446008)(38100700002)(8676002)(66946007)(966005)(76116006)(38070700005)(110136005)(86362001)(33656002)(64756008)(508600001)(53546011)(5660300002)(2906002)(26005)(83380400001)(55016003)(7696005)(9686003)(8936002)(44832011)(6506007)(52536014)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?d1U2WW9GT3BZZEI2NjNkcXFhQnh4cGFKdG1KdHhObjE4bFpRRnZJY2I5MTR1?=
 =?gb2312?B?RzBvc3pucWR6RG1IV3gxVng4K05oamVOUmlHNTRkZkQrUXhJUWN2QjB3ZWR5?=
 =?gb2312?B?L3dkUldVQlVVVHhqZUt1ejZoZy9QcitMMVYwZUdKVE5UbGdZRjMzU29GN3pq?=
 =?gb2312?B?eFdyRnNFeHFRbDdzV1dNV1JKekVYL2NXNTFtL0l0NTlCREg0WEJSeVd4K2Jp?=
 =?gb2312?B?T25HQmRyR2hGMU1QdzhtMHoxVUZkeUM2RTVUWW4xbHAyRDdJMmwzWnZPRElY?=
 =?gb2312?B?RGYrZ1JPeE5JdmcxZXRKS3VTRExkNThNV2J3NlhxU0xOQ25Ibm9QZGg4NStU?=
 =?gb2312?B?T2tQU1FzZ3RPdmRCYlFnbGlESzFZL29EdmRabk9ZSW5DcG8yQm1yN1JpSysr?=
 =?gb2312?B?cTJsM1dhUFRXTC9LNjJJdnphSUc1Q1p5cGJ2aUNUWTY1SW5tdUJWQ2xPdDBS?=
 =?gb2312?B?OXF5MHR2QWU1Wm8yZEE4TVM4OEpGbEVpLzk4Z0laK3FMRXlubVp1ME5zRmZo?=
 =?gb2312?B?OXR5U1ExckJjMkdZa3Fpa3hRTkNJUTdVMmk1RTFqVU9HNDRxYjRSRUVDdVVC?=
 =?gb2312?B?d0M0RTU3N3ppQmlRTXZJeFQ5N1N0OTUxTWZCckZjZjBjakZ4QXd5QmFMTG1P?=
 =?gb2312?B?TUZZTXBMWUFPMHZYU1U3cXBLRytyT0JoVTFyaXlvTGgyWS80YjdPOUliVExv?=
 =?gb2312?B?bjAwcURDaWs4dFdGcDZWdGRSekwzSjhsTjFtcmxMcGE4NkFlazd1QTJMcjFP?=
 =?gb2312?B?eDgyNUZRajdwTUorbW83ZEtEK00xQXB2NnJIOVA2VEJxZG5wZFZoU1hESjhk?=
 =?gb2312?B?bysrRnp5YVNQQllkTDB6V3JxS0xKUm9Rczh5VHdyOWpPVHMwSXJKa0s0dHZz?=
 =?gb2312?B?VVRKWG45YUw1dVhRQzVOU2t6bDZqM294dUFiK01yRTd2RVJIakZlMTliNlFV?=
 =?gb2312?B?ZS9KNldVMFgwUUdCWE1kczF1amd1K045emZnZ01TTk5BOSsyaVhxL0ZXd2E0?=
 =?gb2312?B?SXQwcnI1b015OFYxSEJxOVJzYTduK1RGQ1BWbmk4RU9vMUZMcWtWTmV0MHFC?=
 =?gb2312?B?clAzTHJmQm9aUVZCZzRuZkhCYXUrZE15SmpsSDhGdVRZVU1PazhabWgra09Y?=
 =?gb2312?B?MFU0U1NSNzFnM0tmdHV4Q0hHeVp1OWhtcUFhUVBXbEovcjhvWUIwYm9wME45?=
 =?gb2312?B?cXB6ZU15UGlvU3VOQ3dyL1gzU2J1U3VDUVRodlhnbURKRlBUYnNXeDhkTkpQ?=
 =?gb2312?B?RFg5YWJhTDZGZ21OR3NaejJhQjhsdDJPQi80Y2VTZUVkVk5OZy9mSkdpdHhJ?=
 =?gb2312?B?MzRnR3BkYXVNUGhGSGVFMG1lNGxsM3FpZWFMb21jaFRHcFgrZUJwSHk2T2lU?=
 =?gb2312?B?eHhFMUJsSXhYVkdjU2xqUXFFdFg4V2lMTHo5bDlTRThGZnVhZ2FrWjY3eVZ1?=
 =?gb2312?B?WEVTUEYzMXJ2MXJOa2hBdU1uNXY2dHVkbDJKeVR4eTRHdVNPRGdweHlhcThB?=
 =?gb2312?B?TEFzb1dJWFRhVVlwMnZYZndnWEMrLzhWNkN4VlpUZXQ0Q3lwV0loS1Fpa2hL?=
 =?gb2312?B?VXBYWFkyZlFpcTdDSE85T1hXVEc5SlA2bFNmemJjV1hUaVBWeDU0RXlZeG5i?=
 =?gb2312?B?dDd2MmRqRFRRdXlDNG5IN25WYkoxNlBFR0xTM1UzUnkxSFdpbXpKbHdBUlZC?=
 =?gb2312?B?ZW9jd1Q4VmJlbWNKbTBVb255N2pyVWI5RXNDNENGRm9zWmE2T0JSWUd1QTVJ?=
 =?gb2312?B?V1BqMHBGVjBiQm5jYnlUTEJxcjhadmdpWjI5M1U3aktzZ0t4ci91eWI1RWhh?=
 =?gb2312?B?UFh2QTU3ZzljMDJvWm0ySVowQ1VpWHJySkxlVit0ZDdxTHgvQUM0WXZCSjc0?=
 =?gb2312?B?cmk2YURPSUlOZzNJYVpaNHB0U080eWRvNm5IaXpZTjVaZkRnQlJuTVFFdmZh?=
 =?gb2312?B?RWxoWDBTaXllc0o3bXFubHRDd3RuWDd6UXAzNTZ5QUxjbzJDYzIrUW1tV2FC?=
 =?gb2312?B?OTBLMzZSWlVHeUVqV1RnV3JnaHhxb21EdC8vNDEyMURWTzJGYkVyNnFjQlZ6?=
 =?gb2312?B?YS9qU1l3RWR4aHNnei9uODNZbTh5MysxUitEOUJBOFhGN2I3WjhnRWRvWkFM?=
 =?gb2312?B?YzdQM1hrNFlMR0MwbEp6dDZRQ1Z5aEFobnhPbkNZYWhmUS9IQ3kwNEE0d1JU?=
 =?gb2312?B?RXc9PQ==?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8701b72-f35d-41b1-f8d2-08d9fd7b0d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 01:05:19.8218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSBmLy4ZsPzZn/3rts2hZgq7qY6382VlPveGjl4cwhhHj5wdPZNf+qSCpalHS/fiQtAOHx6PiWRIUVs9BXb+1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ZLZIT7Yf;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: 2022=E5=B9=B43=E6=9C=883=E6=97=A5 20:00
> To: Peng Fan (OSS) <peng.fan@oss.nxp.com>;
> jailhouse-dev@googlegroups.com
> Cc: Peng Fan <peng.fan@nxp.com>
> Subject: Re: [PATCH] configs: arm64: qemu zephyr inmate
>=20
> On 01.03.22 09:09, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > After root cell start up, use following steps to start zephyr inmate:
> > jailhouse cell create qemu-arm64-zephyr-demo.cell jailhouse cell load
> > zephyr.bin -a 0x70000000 jailhouse cell start
> >
> > Currently ivshmem not supported.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V1:
> >  Just a copy of linux inmate cell with minor update for zephyr usage.
> >  zephyr ivshmem-v2 is not supported for now, but I not remove that
> > from  cell file.
> >  Zephyr PR:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> >
> ub.com%2Fzephyrproject-rtos%2Fzephyr%2Fpull%2F43301&amp;data=3D04%7
> C01%7
> >
> Cpeng.fan%40nxp.com%7Ce66ac20ef6444d239fab08d9fd0d5e35%7C686ea1
> d3bc2b4
> >
> c6fa92cd99c5c301635%7C0%7C0%7C637819056122949007%7CUnknown%
> 7CTWFpbGZsb
> >
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%
> >
> 7C3000&amp;sdata=3D5W%2FeJXaP4LCVWAvrUePKG%2FlKb93oQuo%2FtT0rsv
> sQTrs%3D&
> > amp;reserved=3D0
> >
>=20
> What is the delta, and why do we need it (asking while being too lazy to =
diff
> myself - but you should also try to make my life easy here ;) ).
> Can we possibly enhance linux-inmate to cater both cases?

Zephyr inmate has cpu_reset_address and use cpu 0,1.
Zephyr arm64 not only support boots from cpu 0 now, but this could be
addressed in future.

Regards,
Peng.

>=20
> Jan
>=20
> >  configs/arm64/qemu-arm64-zephyr-demo.c | 155
> > +++++++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644 configs/arm64/qemu-arm64-zephyr-demo.c
> >
> > diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c
> > b/configs/arm64/qemu-arm64-zephyr-demo.c
> > new file mode 100644
> > index 00000000..e5e36237
> > --- /dev/null
> > +++ b/configs/arm64/qemu-arm64-zephyr-demo.c
> > @@ -0,0 +1,155 @@
> > +/*
> > + * Jailhouse, a Linux-based partitioning hypervisor
> > + *
> > + * Configuration for zephyr-demo inmate on QEMU arm64:
> > + * 2 CPUs, 128M RAM, serial port
> > + *
> > + * Copyright (c) Siemens AG, 2014-2017
> > + * Copyright 2022 NXP
> > + *
> > + * Authors:
> > + *  Jan Kiszka <jan.kiszka@siemens.com>
> > + *  Peng Fan <peng.fan@nxp.com>
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
> > +	struct jailhouse_cell_desc cell;
> > +	__u64 cpus[1];
> > +	struct jailhouse_memory mem_regions[13];
> > +	struct jailhouse_irqchip irqchips[1];
> > +	struct jailhouse_pci_device pci_devices[2]; }
> > +__attribute__((packed)) config =3D {
> > +	.cell =3D {
> > +		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> > +		.revision =3D JAILHOUSE_CONFIG_REVISION,
> > +		.name =3D "qemu-arm64-zephyr-demo",
> > +		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
> > +			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
> > +
> > +		.cpu_set_size =3D sizeof(config.cpus),
> > +		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> > +		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
> > +		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
> > +
> > +		.vpci_irq_base =3D 140-32,
> > +		.cpu_reset_address =3D 0x70000000,
> > +
> > +		.console =3D {
> > +			.address =3D 0x09000000,
> > +			.type =3D JAILHOUSE_CON_TYPE_PL011,
> > +			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> > +				 JAILHOUSE_CON_REGDIST_4,
> > +		},
> > +	},
> > +
> > +	.cpus =3D {
> > +		0x3,
> > +	},
> > +
> > +	.mem_regions =3D {
> > +		/* IVSHMEM shared memory regions (demo) */
> > +		{
> > +			.phys_start =3D 0x7faf0000,
> > +			.virt_start =3D 0x7faf0000,
> > +			.size =3D 0x1000,
> > +			.flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start =3D 0x7faf1000,
> > +			.virt_start =3D 0x7faf1000,
> > +			.size =3D 0x9000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start =3D 0x7fafa000,
> > +			.virt_start =3D 0x7fafa000,
> > +			.size =3D 0x2000,
> > +			.flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start =3D 0x7fafc000,
> > +			.virt_start =3D 0x7fafc000,
> > +			.size =3D 0x2000,
> > +			.flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		{
> > +			.phys_start =3D 0x7fafe000,
> > +			.virt_start =3D 0x7fafe000,
> > +			.size =3D 0x2000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* IVSHMEM shared memory region */
> > +		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
> > +		/* UART */ {
> > +			.phys_start =3D 0x09000000,
> > +			.virt_start =3D 0x09000000,
> > +			.size =3D 0x1000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> > +		},
> > +		/* RAM */ {
> > +			.phys_start =3D 0x7f900000,
> > +			.virt_start =3D 0,
> > +			.size =3D 0x10000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> > +		},
> > +		/* RAM */ {
> > +			.phys_start =3D 0x70000000,
> > +			.virt_start =3D 0x70000000,
> > +			.size =3D 0x8000000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> > +				JAILHOUSE_MEM_LOADABLE,
> > +		},
> > +		/* communication region */ {
> > +			.virt_start =3D 0x80000000,
> > +			.size =3D 0x00001000,
> > +			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_COMM_REGION,
> > +		},
> > +	},
> > +
> > +	.irqchips =3D {
> > +		/* GIC */ {
> > +			.address =3D 0x08000000,
> > +			.pin_base =3D 32,
> > +			.pin_bitmap =3D {
> > +				1 << (33 - 32),
> > +				0,
> > +				0,
> > +				(1 << (140 - 128)) | (1 << (141 - 128))
> > +			},
> > +		},
> > +	},
> > +
> > +	.pci_devices =3D {
> > +		{ /* IVSHMEM 00:00.0 (demo) */
> > +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.domain =3D 1,
> > +			.bdf =3D 0 << 3,
> > +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start =3D 0,
> > +			.shmem_dev_id =3D 2,
> > +			.shmem_peers =3D 3,
> > +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> > +		},
> > +		{ /* IVSHMEM 00:01.0 (networking) */
> > +			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +			.bdf =3D 1 << 3,
> > +			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> > +			.shmem_regions_start =3D 5,
> > +			.shmem_dev_id =3D 1,
> > +			.shmem_peers =3D 2,
> > +			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> > +		},
> > +	},
> > +};
>=20
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB9417FB18D5606654EE4A51D888059%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.
