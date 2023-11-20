Return-Path: <jailhouse-dev+bncBCXIRKNM3UERBKOC5WVAMGQEI7QB3VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A307F1483
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 14:37:47 +0100 (CET)
Received: by mail-io1-xd3a.google.com with SMTP id ca18e2360f4ac-7b099b85b53sf238457339f.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 05:37:47 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1700487466; cv=pass;
        d=google.com; s=arc-20160816;
        b=ebPXLumloQFfLyHrm2N5CeXD+1a16ba3Djf7B9a9LK15j/Rv7wD0CRhVO+m3Qh/lq+
         83rW0ukyjjcwDNpPKPFsEK2h/vOmWBSEgSzohgvjiA4/2Hr8zR1zxvkxvhxUEngCuHW2
         ijH5IGeEXZBf3yzHATCw6SY8bgs6T8Q2V+XR4dAUu88+ZTx5Pk7TShfuUlmEOtSYYSP9
         qIwTR9S45iwrmKeFXugEWzl8PWikDdIS0RGMrb7Cjb+7LLuldWuMpeab/UPIIGmO17J/
         HNSfyW6gcweTMSZPRUn5g38O8WNFmB+CjjYAUL/zWQQs17n0EpnIWmpoykT3eckzaMvp
         0APQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=S3p+yr+MWVt1ZlgWsYSmHIgJSsPn7g181Cw0XoCUpl0=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=LXDwa24sdUbyy0eS+fkgATOpVkUUQJ6AB1rk/4FjpwkxfsBY5eUAPUDj7coK0aM/YE
         R2bb7zJGywedeCXyBNG0hBDXNHOBVYLIINN1ULlE/McsT0Vm8/Qa42fnk1tgdlwZQZZS
         dIEb/iTAzq6tnvbJEYZ0/tvfLhplfWTYH7pUdiKPoyEkabK5oe6jmr0vqBRnteGYcNF5
         iowBpzjhkMdMrsH9tmc5LkCu45H/7s0xEjRIGEgJCOBzIiGsdA29pVfxkQYuOXYHBVN/
         sRL0Ses7JyT3zYgHS4G12NW0DtuZLfIIK941KtYDEsfsRZksKpSIDfmIL+VRL2o7dyeQ
         SZnw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@renesas.com header.s=selector1 header.b=lHsAcbOB;
       arc=pass (i=1 spf=pass spfdomain=renesas.com dkim=pass dkdomain=renesas.com dmarc=pass fromdomain=renesas.com);
       spf=pass (google.com: domain of chris.paterson2@renesas.com designates 2a01:111:f403:201a::701 as permitted sender) smtp.mailfrom=Chris.Paterson2@renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700487466; x=1701092266; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3p+yr+MWVt1ZlgWsYSmHIgJSsPn7g181Cw0XoCUpl0=;
        b=bFNDc2Iy6ErvDFwBU7hYTTSbZmipwTpK5+HsZ60turtnxZGyW1xMHBbsFSQYmA001j
         yreXbE4yMfV1BYN8LIWfm34kQnoYkQmcrjfAhOCosa8QGDV1tVb2XGxGFb6EGBc9rzJS
         F2wws+06F9+rY6eemUlK1Eyo7YLQvJLyPk0vbpCR87KNxWXSbQmNQK+ze8x1NFxdoCp7
         zku90eOcJQKvbN5sFtLnICTC6NDuX72ano5mOIUN476F5c3F5L3ANzIG4f34cWOvqFYP
         J2woR83fZ3mQKigmBsWitrAfJzwyQRxwzhbaPwMMMu70RdD9cYs9U45UDkn2O7YiVyRj
         P6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700487466; x=1701092266;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:x-beenthere:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3p+yr+MWVt1ZlgWsYSmHIgJSsPn7g181Cw0XoCUpl0=;
        b=QHs+TM4GRkZ222ARfOgrUxMCvvxq+qIClBgsHXRl99RwC5vLh/tOPIGaMwnJf5Vy0U
         iW9rczhXrbAqZtFX1d3tDQ0lj/KbdVSmsym9Z1K+gnCa6V8kE81v9cUh62fZ00pozhwX
         LiNePFWpnRJxoxDtWpvJJnDD6Coii3HP5BjTW0lInw4B3bC2/aGRdfU6tJ0gqGfPPKFC
         FRBcDwkdm93wvgmvcf9u4onrz5ajr63YNKNvi6HD0ymHfs0BU9NPANmvj5KygpCJcvIe
         SMD7QIXKgadkwMZEM6aGA+ARZ3J//YLGsCetehfkzGwLOle7U4h5N5czPv/cqFpR2X5c
         R+mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzSrUnzJ0+Eg52B7DCr3i2R67aV3zspM/Q/D/VkFGxDU2wjG4nq
	ih9lmDZvRTTqZyBYACcJV3TjJA==
X-Google-Smtp-Source: AGHT+IEfVD6VXRUc+/lHdBMeY0Ld9Shop17wSivWTVGF8S7q8zVpdwT2XfmiYRzS/6PVwo3ZUiGeMw==
X-Received: by 2002:a92:cf0d:0:b0:359:cc3e:cad with SMTP id c13-20020a92cf0d000000b00359cc3e0cadmr8464074ilo.5.1700487465861;
        Mon, 20 Nov 2023 05:37:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:1105:b0:35a:e34a:d377 with SMTP id
 u5-20020a056e02110500b0035ae34ad377ls2392170ilk.0.-pod-prod-08-us; Mon, 20
 Nov 2023 05:37:45 -0800 (PST)
X-Received: by 2002:a05:6602:298b:b0:7ac:cb6b:616a with SMTP id o11-20020a056602298b00b007accb6b616amr10640046ior.8.1700487464864;
        Mon, 20 Nov 2023 05:37:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700487464; cv=pass;
        d=google.com; s=arc-20160816;
        b=kRZ38NpDt2Ek2GSpAaXw7eMIOyZmSVyo1eFYaep6HyatKkVOgEhGOvgEvu1BK80b8Q
         C30aC6MBiuqm4tUUaRxR4M+6947YmQuSYk/8tCS1Idp0+TE1VRVD5wAFmdJ+ExDageCx
         yZ+SBzo/zrOCuKCxz2UM6Wlfb+SDzX0+Iw4OCJXxs4yHJ+lrBOboit4msCpbWSqDKxxG
         TIVU/kXmx/nDxEWR5arrgn89wSn3yHkQmwakotvQWN0E0FNfvTDDslMHtZ2hp9sYbUPB
         RYPkRJWF9FF5kXisN0ZQF6dFbFa/9A99XS1JqoriDy9CiR5LgvurQVuO9BFK2/5rBvpo
         RVdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=nssN8E8Drj0HmbpxJat1778JnvoZQkGDEqfLu3O4FV0=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=MEjvUm6Fc7Odd4whUlXydXo2ZpnX7ROhYSUNTZgab2L5ZXOpiLorUoWpfuQK31QZcW
         U4MTpEIbcorXbTp5OfL0H40z5Dx/QO4YMtkHVJFx/WP0Q1/4Br8LsoFx3bkPUj3p6A9G
         LDIwOYugeBEu+wC2xg4wIjxtnL2bTv2ajX9xln8tKh5gOWw9TFl4c82wT3CV/MUG2//P
         U5q2paraR4YwcCmuCYpMSvRZ8nRpZk6m6aIk3AC+ScuVGl5OVGHVimweahhloOPqQOq+
         gf+6ITeoHi0dvk5O/8lm4HPwGaQb01R+IDp1IrGZhKFxw3R2tFNI9Nxuzx8Jupi4jhIc
         UX8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@renesas.com header.s=selector1 header.b=lHsAcbOB;
       arc=pass (i=1 spf=pass spfdomain=renesas.com dkim=pass dkdomain=renesas.com dmarc=pass fromdomain=renesas.com);
       spf=pass (google.com: domain of chris.paterson2@renesas.com designates 2a01:111:f403:201a::701 as permitted sender) smtp.mailfrom=Chris.Paterson2@renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20701.outbound.protection.outlook.com. [2a01:111:f403:201a::701])
        by gmr-mx.google.com with ESMTPS id fw23-20020a0566381d9700b00463fcd15b78si548170jab.0.2023.11.20.05.37.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of chris.paterson2@renesas.com designates 2a01:111:f403:201a::701 as permitted sender) client-ip=2a01:111:f403:201a::701;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGmjLjgZNsKUV/LnNJY7mGJtO2s9CndfUiVBwFO64OItLNWXKST3U+g8u9nppj7tJ5nyr1UtdDSH/KrKA5TVDupy+7xWLo4VCNKWvVVuu1e6RxCLvWyyXfXrNy9BoSpxkmYqj/sDxLIBmI9+agI6BS01FBN+AnsGnJGU2wlcjWp8knK0t9niKRkW+uVygH5gyv/G7ogyWJIKMwtpe+rQ1E3r96Z8wvgvqPA9LwODzGry1hlxMPEA0J2q7D5B/dR5sboyECuodBtYPEQounLxIEkjHSPEXDkU9YfFp94DmWzcJpaX/jjTuFwec1CLQEpu+OainvWZfB63RVPgX1jqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nssN8E8Drj0HmbpxJat1778JnvoZQkGDEqfLu3O4FV0=;
 b=QDGuDhqRmy8s6DhjRiEQ0AuZcsvWeRX1w43VYYc5OqW38Z3kgr10QRtfYfRqAFW3+MBaOu04Ubo5/tnnMnEe2DOrSEQtdauk1Xs9tkiejAmNSmpS/O65tEj/es8qU8gJJ7SDDjzb3u0QwjEigIQHqAJKeSilgE+0vGbjeAdOHFcbsbrAtSCWkIRWK8wwzz8Ft7/BhufWWIEmWoirf5MPWl3MntdHcQ/6GvCDPQm0TkilLtXZ9WgEuY0TGgZS5FaUcjovjJv22fBq8k39gG35LvXLYMsBThU8qXo3g7pK+vD7HH7/2KCvcvhOjAWqLbNYSINhY4CnmLntN6xoxTJbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
Received: from TY2PR01MB3788.jpnprd01.prod.outlook.com (2603:1096:404:dd::14)
 by OS3PR01MB9577.jpnprd01.prod.outlook.com (2603:1096:604:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 13:37:41 +0000
Received: from TY2PR01MB3788.jpnprd01.prod.outlook.com
 ([fe80::6779:9c53:db73:8052]) by TY2PR01MB3788.jpnprd01.prod.outlook.com
 ([fe80::6779:9c53:db73:8052%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 13:37:41 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Development status
Thread-Topic: Development status
Thread-Index: AdobtkWeMSqDiOPgQqe/VyWdaj7RRg==
Date: Mon, 20 Nov 2023 13:37:41 +0000
Message-ID: <TY2PR01MB3788FD2A0D643FD2E3930CAAB7B4A@TY2PR01MB3788.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB3788:EE_|OS3PR01MB9577:EE_
x-ms-office365-filtering-correlation-id: 84bd679f-868f-4b55-0844-08dbe9cdde89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9IxSnsbPkE52Cy/ymi4+NcRN4Mhg7DIulhRRPDJmqUBEvM0v7ZpDkUWKC3QFtw07E32YoyQUWcpfvwkLp8GwIVzHmFq7oPLOED8dh1T6EXMXczCdSlmBSQpVntkX+NlKABDWOjX4N5XYexTOqO7641Ex8THJShCOOOLip2AEGdqiY9BsdBX1IFbozff+TxpMqnltVG2mCdaZHLDopINWiaXGoTmB8Pv+AuWWH+Ib0xsFF9DnAhTaADgdUuBu57attUCkd1GMbA2xdwEWMR8TO06plpWRjEEROemhychErDClLK/e1o4VinEzhSDcII59vsCPm7okpeGuhon7boC4LyengcnF7txOJYxt3D1bpzxjyLDNWo+mKT/juQQRj6Let+sx/CVPbSJAEmdW32jBfVSnpKpbope6CvnXmhWWM9ja2H3dcoAJlqZEhOMrUf8mF6Yi19uktHPFGi4ABmorDddBMOjr9VMssH2kyl/tQVVZH0+4ekdRJ1CxnvoxwT3R78g9Go7kUDNXacLxznpjJvZyUFTICtwb41pWb6KNiUz5A8f+51QrWR2Hqlf34GpONM81VJ7zkGeIM/B4WRLR0+LjaTJybDEN4Al8Q6iLgHf6ebRdHd+NP79wsQJlFz5Hh0fnik0SciH2mwbdv/P++g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3788.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(33656002)(86362001)(5660300002)(4744005)(7116003)(52536014)(2906002)(38070700009)(966005)(55016003)(26005)(122000001)(83380400001)(55236004)(71200400001)(478600001)(6506007)(7696005)(9686003)(3480700007)(38100700002)(8676002)(8936002)(316002)(6916009)(76116006)(64756008)(66946007)(66446008)(66476007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?w630RDJqkUNB6/wdd1OqZAjB0isGCft6RvteEMWn2Dw/rkKe+79iAKWatd?=
 =?iso-8859-1?Q?g7redzGD7EfREOMktzXZyQRk1LktLClUu78PTGOMGGc7RyLBtFKR3EV1aJ?=
 =?iso-8859-1?Q?BoGxuYaWmndxHB8RlW3V1PvcMnTfuGxCO+W+ZzL29iKLF4ofvtN5tMSws0?=
 =?iso-8859-1?Q?BzDPhrFvo4vPVF9SUvgkA54Z+FOzXLT4S0Hhuh21eLo+puSg2d6cZBoNVb?=
 =?iso-8859-1?Q?vqzs7gb2GXUUzu40cZT5XhzlwrapGiiVUqfwkkDrC5xoZE888WgRIOECol?=
 =?iso-8859-1?Q?3bxRp4lhuOdLKvf8OnSLxQUN3xSIZT3Lk4A7dXHWBe977D0V3GuCSYbeZm?=
 =?iso-8859-1?Q?TsG5qKncdsFFUyF85zxjHbSAtjjSZ0nIjfSoJENocNVRafFTDGhIJ76kCB?=
 =?iso-8859-1?Q?8INQOn5ohWsNyOP/89ErzFQiahKJL6T7RjedXeHBLSNzKrYGFxyj2TsoYp?=
 =?iso-8859-1?Q?Nai+B9njg7k+/hthzhAykDOXL74f8bC9ZUPpkkLc1hYFAR9Fr+y9Sv+5en?=
 =?iso-8859-1?Q?la2ZwTkiHawVhWtuWgiI76OYvl53xaogpcveRmL5lIBZ1Nti4q9HuF/jGZ?=
 =?iso-8859-1?Q?wrFNCq4heB9oyvBSDOqCGb5xagewIlsPNh9y3aYrogQEN6Eq20h5We3Hz0?=
 =?iso-8859-1?Q?tngV6DZVEOy8iZfJnD9sCXsUlXT5nTpCN4pC38fl4yWU/hvkbMJCCZ3euc?=
 =?iso-8859-1?Q?rHmcQho3jxSvCx6oYLQTdGEQpYwv/JcV3VVbnvVvDZFhZ/lB6zsTsuOeVk?=
 =?iso-8859-1?Q?Cigh8sQg6bX0RFrxl+DFWDFNicvhVTQfeC/fr92x73z4WXz21XnhJb8PGz?=
 =?iso-8859-1?Q?ENyNR9/SbGU8IEnCm1Q/AKGn5F2WFW3rT6+zwnzFH2DVZcUY12z3IW2Lhm?=
 =?iso-8859-1?Q?QHcOSJLvYDvmB3S//SJnoqcZvKRFC4EB793M989+9lF6JszMcMzb21UYlv?=
 =?iso-8859-1?Q?a4SRHc5Zm0Uvyg04q9nJOV4xt5VFGgL0UaPSyXcqSDPqaGGR9ognRnoHtS?=
 =?iso-8859-1?Q?h8JT8KOIRibG6OBptGU/vBATunuXvMVUdgi7pn5zQdIp8BQOadtLRdm2Xz?=
 =?iso-8859-1?Q?/2WT+FzehtMPfQAaBTcAnn8l8yQGAJSkyGDsxIE/S6OcoOcCFXVpd0cC/9?=
 =?iso-8859-1?Q?GJ1CcIqKb9qOCU7vh+rduuoz/e3jU/YdUddehYNVWBgmAz3+BEVDn5gNLd?=
 =?iso-8859-1?Q?EMSVpYQv5DTVHA/a4lIjgLvgPr8XzdxlhtDFZJh1yOFQsBLo4f/FoXGxZ2?=
 =?iso-8859-1?Q?rrxvv8U9x/60JF/yPF2cz1+c+SyB/uJ/OWFu1fWWR+u7l97HTGl7EXoODl?=
 =?iso-8859-1?Q?aW70h0JO6ZBmXrWIgtAXm4QLfcgc2Kr2H6jrCHHjryO3Zztu9PPglQ3+Yw?=
 =?iso-8859-1?Q?vCEkLjw61Lsjlu6VtnwjcTwD2PbJdw3YnWXmeUPi2xBVVyIZBcw6wwqH+N?=
 =?iso-8859-1?Q?OfglpIm8gDRg0hBVAoq62u3NKKlob0Q40cL5EV3TauBNpD/zYXWmbJ+jn5?=
 =?iso-8859-1?Q?jE/B/WuwxTHC7tH2IHU/Vtm71a9/Tk1aYb2e04IQCQqS/xQaTd7PFgctMQ?=
 =?iso-8859-1?Q?Fuxmsab9vtDMrnyhopsNG0zcKWyWZsJ5cQwbhY4/v8nvuh8qCJCGSU2trD?=
 =?iso-8859-1?Q?PJpZx0BR7gmIIS72yRM/g0R6tT5H1XTPpgEQXAh89tR6TMO9bn2V2WGw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3788.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bd679f-868f-4b55-0844-08dbe9cdde89
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 13:37:41.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMU8wb2E8EJu9PsxKvwW3vMvUtGgDo3+h7xRQZKoUPoGrmIMMvmnMXyYw8EIai/70P2YGDFUwmo1ow2DJ8wYYiG+fbzfwkNGtThELyZvgC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9577
X-Original-Sender: chris.paterson2@renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@renesas.com header.s=selector1 header.b=lHsAcbOB;       arc=pass
 (i=1 spf=pass spfdomain=renesas.com dkim=pass dkdomain=renesas.com dmarc=pass
 fromdomain=renesas.com);       spf=pass (google.com: domain of
 chris.paterson2@renesas.com designates 2a01:111:f403:201a::701 as permitted
 sender) smtp.mailfrom=Chris.Paterson2@renesas.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=renesas.com
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

Hello Jailhouse maintainers,

I was just looking at Jailhouse GitHub repo [0] and it looks like the master branch hasn't been updated for a while (10 months).
Is this project still active?

On a side note, are there any plans to merge the latest patches from the next branch [1] into master?

[0] https://github.com/siemens/jailhouse
[1] https://github.com/siemens/jailhouse/compare/master...next

Kind regards, Chris

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/TY2PR01MB3788FD2A0D643FD2E3930CAAB7B4A%40TY2PR01MB3788.jpnprd01.prod.outlook.com.
