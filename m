Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB5X7V2SAMGQE5KWJLGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C60F7324DB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Jun 2023 03:50:48 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 5b1f17b1804b1-3f7e7cfcae4sf501725e9.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Jun 2023 18:50:48 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1686880247; cv=pass;
        d=google.com; s=arc-20160816;
        b=gLbrwPXLF8laa7Nw/IAQU0CW/KjsD3CJndzNtYJQinPRwHApq4ozVGENagA2VRZmZ4
         gkwg1k+Lkyt6ZW3eTHqQ6a9NZUd42+4nH168UR0kcvCdt+gieZuZCsC35epbcSiCkZJT
         1IWZvOVN7XA0CX5B20Eh50qeNACaXW1K6tUINwGL0GUhKdX3F+XxkkOLntOYFKkE5suY
         fcch/2g2J0EQdDg6Wqsa/PFh4b2L7Tq3v3p5axXiHCBNWY/Xl/2tIwfj8umYjDmrJ6z1
         PVfo9V49XWsBYx7Y1zKxzeWxs4lFnM/AeWpwqZpZVY4LH8MfSLKv9MOhD1FdyWuPT1NP
         NNhg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=gDdeTVSQll6MNu5dI9PrWLAZVWRyPJqwaREn+8gd/7o=;
        b=VgWVjkqWDrwNp5B/jTvVD+JIfgUHoRRDbvAhikqAlJqyJeOCtyw/tEAY4+PJwGSjX1
         vrhrwq7e9AU/G3z8+cCXCmoDgT3QTyp3pW7xUbnrNc7kwaygZyPobAujMs8qI8K2ScnY
         M2ofMSKd9dJxYl5l3nvw2BC5q69g7UOk05IZBtG7iUCpVn23Jjn88TZNZ4ZzR2rOaWZj
         JcXpB8NeqCoeZXAOsl4JkAQMt4dWjbq2jUQxg1kMg5D62BZiqZcIzSrMBXIsyASaagDS
         f8gsKjhozZU+p6+GYqIEIVfTqa1FziJVfxindaiBfr/ka1Uon0JaSPVMaDVNe6iWFOEx
         lFdw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g2QkQlLb;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1686880247; x=1689472247;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDdeTVSQll6MNu5dI9PrWLAZVWRyPJqwaREn+8gd/7o=;
        b=UC1u4S6HddcqURXjQYfaSb2WVfpjRnldMiFm20QRqXdiv/Q6noUbTZ0hyWNFLTEahr
         ifsuMk8m4srHdq4WYVnp5eygXjof1W3h1+l6CRIq1rqVtmItLnsC60K+YAelqMK95aW9
         Hd2IZ29bcsQjD8ZCEwMGmAr366jyrUjxshHcg84/Dq1JXBpSYwqqeMrxxb1qnB3Jm0jv
         51sLTl8xdgYXhxsMkgAG/J86uOCDGzbJJu8gAFnZ/x7RNoTLAozTZHO2gP1KxBZhbPS0
         VRD71b8hsN/MY0OY2CN3is5x7GIaycLD4H7PKxuVkNYnq8uVB/i3Dgs4uv+k3ll0nvUn
         j8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686880247; x=1689472247;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gDdeTVSQll6MNu5dI9PrWLAZVWRyPJqwaREn+8gd/7o=;
        b=hWEVsLgKyhYeJ4MAESJyzC3jCVZ9dbNBl44krwssLHnP1eqswz4DT5ReDU98yW5/zp
         PCpSA5OBBjsAVyZl8NwEGvSPkfccqMKP36BIrXn1Ou80Pf8/882LJJQ40SAzA3FaR6Or
         PpfSEayeIEznrIayQWogE/ni2CGk2tFfiAzBi3fSe+YemSlGagsjV1BpBIOOeiIRikEm
         ID6KrVYb+zKjxduT9bqPR1Cgr6gW1OXrKvUD6D/Hjh9EHQ4EGK0LB7o6xHEWrnHKX1PN
         x6hIUnrERhfXAh/AZbY2lNHfO3C0vPixjKxU4xKE7vdh8OA3dAPakk8jQT3084qokuI3
         LHcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDx6ucs8nPk7gVL/0xsRNuH2dh6l4PK4y1zf1TiSi+7dfG35p1c5
	sdikNWt9RVnL/hvUkU+0ujA=
X-Google-Smtp-Source: ACHHUZ6Ng5lL/99BPG4tBWc+Dd3DQN1WlxR8SCjwn5SHGRXPQyVK2RwdYKBJf79ymLfVWoEBNeGMow==
X-Received: by 2002:a7b:c389:0:b0:3f7:f7d5:a07f with SMTP id s9-20020a7bc389000000b003f7f7d5a07fmr575858wmj.17.1686880247043;
        Thu, 15 Jun 2023 18:50:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:38e:b0:30c:2d4b:ad5f with SMTP id
 u14-20020a056000038e00b0030c2d4bad5fls142375wrf.0.-pod-prod-02-eu; Thu, 15
 Jun 2023 18:50:44 -0700 (PDT)
X-Received: by 2002:adf:e4d2:0:b0:30e:4886:425a with SMTP id v18-20020adfe4d2000000b0030e4886425amr290542wrm.40.1686880244852;
        Thu, 15 Jun 2023 18:50:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686880244; cv=pass;
        d=google.com; s=arc-20160816;
        b=yTAj/EwweZ3Ysyx8FNLf/v6/kjWJuMil0z0U6mklaTBSb106k7TpoDEl4T82y18RLM
         5ps89rFXCYNsEOHmYIuGgVd/alYkKfOt4CfvWFSgzw76i/QVJOcNpIVsbS4l2nQptI6T
         SaFM/ZGQCkUv0mW085eXqOv2IBMnkkUpIJ6A4kegIgAdFWIr/VBgT6koCGTMht2ZZ/Xw
         YrBKUejmScdopwPmrOt22yNRzr5YZU1cmKVeHy1ik8Yrj8wSOpexK7gvWUxV1VYW4474
         eMiLj6eoERGzCWoH9s7KnGiKjyIES3WRg79SygPI8QqiwPU7AxbMoYjxJgj/P+sqvBim
         hlQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=31i/KZd/YJCDmkoNukxplauMXOCnWX3FeC1LNllh6U8=;
        b=UwCARdhF1BtNZThBw/UQkKJxZ0DO7uKitfevvuctFcy3/uxGNuDh74C+JQiGol9F4F
         6FCbM9sY5F9PtyvwSqF8lzM8/MjmpGGQxoJvnJJnieWF0kKd/zeFvXID6yTqicHDEFDX
         rns1zOUU1Ep6WMY6jeE6q4eOjrrsjLAbBePAUi0ZwzQtrad5nuqkF/I0hHsceZeR0yc6
         qpzkx+1eQYQ2lV051UzwGa9h6Tu6z90edtIwzCxdo6cw12K15s7aBo3RIGlFPHoimQq9
         o1Yo0nzS4zScGbkGsCaux7KI57aFl+ClwLcLILAF3CuMLE3QU7uGtXVmfr/v3irxvE1d
         IwfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g2QkQlLb;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0617.outbound.protection.outlook.com. [2a01:111:f400:fe1f::617])
        by gmr-mx.google.com with ESMTPS id co14-20020a0560000a0e00b0030fbd4303a5si101234wrb.7.2023.06.15.18.50.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jun 2023 18:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe1f::617 as permitted sender) client-ip=2a01:111:f400:fe1f::617;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkH0lHDts6JyF9zhNIOLtVcNVQUdvtBslpDOeprWHSsITwyrc9qkXpjsfTqIuj2YMEoDdUdl8V/58YdIHyNp9EEvPhzxlAOJa+S/frDo6Yal+p/14XI1eFFuUFzu2+3W5wfj7SHBzSVmDZ9F/Rb4jJaRuWFpNqlZbDgsOo+r4IWLTPNHV20QDUG5n1psuTNrybp8fheFjllRGVUXIevza3PP1pBK1ohsAk88YxZrm1+O9xCqSuKcKnsHPaszjsH5gr37OPAzwjUbOBHXlo9qL6HNVrWdq9KL/shrQxum/L19LGnYVLUbYfDu9ZlDmo74w025tz5dtlaq8An/6iGYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31i/KZd/YJCDmkoNukxplauMXOCnWX3FeC1LNllh6U8=;
 b=lNg3okKMaBh1WvXmM8pZdi7G2jMTFev1whdmGcEN3zj8S+tOOMn5Vd/M17KO5gPQKixUc0gaT3vWVjs6gnsm8BdXIHOB6ohky3ClVJN/qnkZQrt2wOOVbbdyfgZh0Ml6EZFVwxOBrnnnoBOPV0GCfUGEEqAv5Sz5L0GXDXczPGDl0F2fapMpxbaFIB7Eqwvu5I654CbKSzsIgwvl6b3ZQyj6G2KDEqgSbWE15qJvzDcfGUcOaN5CtKOPOhz8apsMx1GNYrMe6BbdWg5mRokaTp8lRy85kaMtFaUlOihznUGNGyQaRkf091QWVZCYOV/9nU073wJtuPflN5wwaOcVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBAPR04MB7464.eurprd04.prod.outlook.com (2603:10a6:10:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 01:50:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea%7]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 01:50:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Subject: NXP adoption of jailhouse hypervisor
Thread-Topic: NXP adoption of jailhouse hypervisor
Thread-Index: Admf9N6VzJthxFS9Q++rDSmHMA7Vyg==
Date: Fri, 16 Jun 2023 01:50:42 +0000
Message-ID: <DU0PR04MB94173DED6C08CED6A986E3338858A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DBAPR04MB7464:EE_
x-ms-office365-filtering-correlation-id: af8accec-6e92-464d-ceb8-08db6e0c1858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vByj47oorxd/jKUozkr3W9+XVABdoxBdphJq//N7c/D663lkUKsLAOK7s9vnf4HDpz+OJOXQxL36xN+IreLlEhT7bfXhTZ20IeCwyqFswVbq8FVKIFGM8UceSPP63oU9C/rzeoy6MlYYveIql15SZ6cTDLSR9FqE+Zm/4/vxI8gZv3o87/AyW6MzCP9VczSqSRsFribcQxc9yTKUcajw2ZX9kMrezmxh59XhnglEJgiGFjFHop8qa2yxwCByiqAia8TuHMbaMrJhGsvlZWsuROPt60ZepIItzKlcMjH5zEdZmTeLqJg++3IMRetAULXgZDqSyIc46niix+BLpBYgwj3kvy1UK+YAP7l7G8sPwf9WFqnnM5hLfL5Ye4vwlcPPzLip+97kvC4KLEuDrZepkXAiWo9RGBXpiJbJ53Q5fB82hxefxQQ95aUFxu39ua32KzhJ8wglxMDfCILWq+MkbPXUmoekHQWxTxSaeh7WPpG8WyThGHpA5FfG95+JFUmxIgFPb/qVvpLNKDsJPvf/DQnC5XTnyZ9IbRwKxPKWyQR2DHsrfsVnOL9GehfukKRbOwxAes6gjYNehQY/GKmCNqf6M//ARsKatymgyUnEs6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(52536014)(5660300002)(33656002)(558084003)(8936002)(76116006)(41300700001)(8676002)(316002)(966005)(7696005)(71200400001)(186003)(6506007)(9686003)(26005)(478600001)(4326008)(64756008)(66946007)(6916009)(66446008)(66556008)(66476007)(86362001)(44832011)(122000001)(38100700002)(38070700005)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4AspfrHOCgSt/ntKQfoRgFyBoeisn9JtzF5cpPXPArao2dM0ZuzBGyh655U?=
 =?us-ascii?Q?/zZu11VdiUX/qtxqLUxnFP1UXLZ0XKUfGFRweLWokjcUzq25P0GJClP7oibQ?=
 =?us-ascii?Q?3urhwFLK7pBtdfbL0ww9K5KOdhx+poSs6Aerj+MeCq5CtpWqhcrpW6yKzxZ8?=
 =?us-ascii?Q?WCYVAMHVMjv3Is/us7enCuWiV0VFoYGibDkUejm3Vcx1kKVCOF5Zg4RsAVB/?=
 =?us-ascii?Q?sNRWyAeq+EMh1wNj7+kHItZWmpKnH5AS/ay3uvYJICHuJfzeMa8pliyuycNv?=
 =?us-ascii?Q?O1Pt+1L5IkpIfQTPLoBhkIdyh05173gkoIaacZEDY2WW+9/iWsn1dZi9QalT?=
 =?us-ascii?Q?gYp2Z47NpyF6xUO2GrohDk4t1tSn9BucjxO2HtFPvyyVWR5h3TRUmJrpADm9?=
 =?us-ascii?Q?mZefgYWpTU00aRisNGkHuo9rn/h1EPLizkNbNAezRwf6BzrMCPAIhvzs1Qat?=
 =?us-ascii?Q?WWVgNKBha81yF45/0ALhX/8MnEn7wBai4vO8vNI6WZpYCzLx/mP5xC10RvYt?=
 =?us-ascii?Q?5IHPinfkqXRTqkKjbM3++H+eKDLg6/H4V/NTYeAhbSVDQycQg5DZ4TyyzQIJ?=
 =?us-ascii?Q?gC4v5Gq+KEORlLLZAdgizwqEjEd7+N+C87Xooj3lQIrFRxG2VhuJrIIB/kYo?=
 =?us-ascii?Q?kVvE1wxAn4MEq6SaAJba9oPiSp4PrTnqrIJYYv6vJTgybgg+XLFSHLm36Jo6?=
 =?us-ascii?Q?Z3JLfOVvZnKv8rqAqeLJosbeOjZo5jr5ojs5AmLO3VMsGVlf1RV1rQYQKtXg?=
 =?us-ascii?Q?e+1alQQIRFfQQtVQmCc2L15EztPyEyZ6IYk+rFHEhu3/JGA0GqO4mK7Id5tD?=
 =?us-ascii?Q?xDie/sL7+26KJ/FMKWNWFvomj+IgCThxXfjtm0GQZ1RigKJmEqfRPw7bVr4v?=
 =?us-ascii?Q?CbJnTs5DHo9m/udHhzWFM1wjFSdJp8wlNneTHJ9Dc/vXcGjDUXFpGZ9lFDyQ?=
 =?us-ascii?Q?ViMRvI4PvtbG8BuO4BgjtEFsDqcyVyV5Fh7wUmPW8/fX/PZ5o6Q+I5YG024k?=
 =?us-ascii?Q?x8luoev/NduxqRiaP6YV1mbrbB79uLTEoeX49i3lOqbOm5s7+gu9RYDONCMk?=
 =?us-ascii?Q?4IYcqgrUKmikhVRy8dRvIsQXhCdobKlQKK4JKLciCNoxMllNXL42Up0xUZac?=
 =?us-ascii?Q?k+erUue7TqAzVRRvlEIKNU7VGA9ptEpRjb/Bo988UPjLrxxGjN0YoYgO3Ocl?=
 =?us-ascii?Q?zXj1ClYpcnOg8OUdHZ97n9yCFnBKbktLVuau49nY8JsoXiMaL0g+R6usWSS1?=
 =?us-ascii?Q?3F2g/ShPoCz4G0OFqvOrQo/sC0D5pps/jA+bkW0ViVn/tR/OsaUvzaA9t+H8?=
 =?us-ascii?Q?pJXiFWecRHYMuaZ3HyF8jBvt5Q1Bm9KZFc9Ldx3viIZGiwTKwPLDnTmmi9wY?=
 =?us-ascii?Q?R5MLpyYH6Mv8cHGieHQRYGoV9rTHQzTb48MmT2BISNuLDwjAo/T0y+NOk3wP?=
 =?us-ascii?Q?8jfrGUktQeygyadO4R1IyffratzjPY4Dm7k4G0ozpUvxiTnJqKEHwYw4UHM6?=
 =?us-ascii?Q?DyY1jD5w54UI7gilaiWEGUuZ3SOi8cmk2P7C5NY2Q4mEzcNmnRsQ4MpoUy6U?=
 =?us-ascii?Q?v9hOm/lwkCOEADoh1KE=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8accec-6e92-464d-ceb8-08db6e0c1858
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 01:50:42.9683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /K/5YLx6hHkzDo+0mANKm32meXpElDuhVzYULln6UXS6kcb2ZK0Vt5aQov7aPSz21xtbF3W2+67oHdZVvm/krg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7464
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=g2QkQlLb;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe1f::617 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

NXP adoption of jailhouse hypervisor

https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/harpoon-rtos-on-cortex-a:HARPOON

Regards,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB94173DED6C08CED6A986E3338858A%40DU0PR04MB9417.eurprd04.prod.outlook.com.
