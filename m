Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBCUNQSAQMGQEGGQKFTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06C312D67
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Feb 2021 10:38:19 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id eb5sf11234993ejc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Feb 2021 01:38:19 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612777099; cv=pass;
        d=google.com; s=arc-20160816;
        b=fA179ZHZw3XnR4j2RJEAlJo9jzFia3AiNs0HYktu+UzZWlqPGLdAO1vqIp602scCpY
         Fe21Y6HEB6WXuyj0lD+cWUn2LinxFfqxny72cARq4nHc7TAu/87dvVw4XGaBdm+0KKE/
         aJJXURvzYwYHU9Ct0x5ACH2vw7iwCnUMfHzw76f3u52PKFNJHbUn4Oa5yxl4FvLYH6KM
         jnhMrSgVYl49DLViWD0fR5unHVRLjtHxvSbQp38G6sym5LvMB4qvoYRUxiTqBt3oRTRL
         Cb2irqrEuQjQAJM3isqTCs241SsE4I2ItWKIpKTHMXaBvOHE6rziCUbawv2FKTkDFZK+
         bQDg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=hZVFAWGPCiq2g+YaifjB7nrdG7OAxy7D4scrSCJdGgQ=;
        b=adKd4edggCvcvW3XpH6Q5vTV14ot3x0/XMsW9zv2VMlvubChcWTteKF+HMNS7g9UDA
         KXtGW367szTxlSSsfRwNstNDqzk7eJqNDc5OuV0GP5hdVB6SuyfFFNwo0XIDwS+GQ1uO
         lwAvKUItK6OcwhKXwQpbVFX1Y4iZZIetLsxmsI7xQT56rAvjbgDaQIQRctaCCwc+T2sb
         aSi45WLqE1rYatpAOEpqKqLQZT3/TRgXWq3SyjJXsx/m/bblaFZ+s+bXvgEwM0BGey6I
         X7mh0nRgB/BCDNJ4IerzOZYLB5Qe18ym+PZqJvzmRpxwd6XnRJnYrpbx8nPtQxsuxfld
         n2OA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=gCKmKjg1;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.102 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hZVFAWGPCiq2g+YaifjB7nrdG7OAxy7D4scrSCJdGgQ=;
        b=JKU0KPewvTQIlZVMdpDN7aT0Elq40M7HyvkQkjDWEFGoLrZ3RXrKaxOh/MBbCbYkrp
         fIk0pyTpfJdSRJclPNC1AcVrLAgUh/yQ+x7XQulkrC/MBVRJPciiyMkYinOGj25QNCoN
         NziJz9LbSlx9T4hqzFOrCAUq8iBNqYbd/61kkQZRpjPia+l5vyA7w6DT2k0slFoqUKAf
         Y+Wz6slnOl3Ds6H7AAMdwnku90+UxJCtVnSNr/HQjIl+I5RgMpyBpp4DCXVlIIWf/uDD
         eAqufnjZr6eDFmvQGuUme4wQErN0KeXJ2Zp34eNTweE7m3QdvBPoi8M5y74VjLIB7d68
         Ff2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hZVFAWGPCiq2g+YaifjB7nrdG7OAxy7D4scrSCJdGgQ=;
        b=BdhtS7ZF8V/C6CZ2WlZiGQJM5jM51FuCw3fcM8/AtBoM20ovMLa5qC+l8CVFZi/QV9
         g80PqMj48S4itxpxIeJMkNSEqnVJgFsS4mcwPDw6u4zFCkNNiSTt4UeGII+nk52fNEuA
         ZLYwGPOnz801VQlqVYCMZTRf7JIhF2qMpQyQSxj/Z64Cz2nj9qBc63dLEMUfWweoH1sN
         JoT4N3RUb08yoJLpyMwfTcpHlDfzr1hgl1rGZB7zv/A0bhB5X/vm3coaM3VEoff9ZdKu
         XuFzE8HGIS4RT16b1UkAtLbd6RUtBQKHeEbgxYDxN+QeXZ4FXFn66hoj3WPD+HYPwF6F
         uU4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5331ytzBImIxeh+z26/r7xBE/CPfDyJqA9+LEALc4OmhcHt+XqQt
	Rv5NvbMniUnk63DVHEn4mqo=
X-Google-Smtp-Source: ABdhPJwHURtr+dlYHKGCX679BJQyd0VR0HT59w7u7W5P1JbQVV/V52F5PrCzt3MA4gGQMl7qCChXJA==
X-Received: by 2002:a50:fe89:: with SMTP id d9mr5879314edt.57.1612777098979;
        Mon, 08 Feb 2021 01:38:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1cc7:: with SMTP id i7ls6442944ejh.9.gmail; Mon, 08
 Feb 2021 01:38:18 -0800 (PST)
X-Received: by 2002:a17:906:f0c3:: with SMTP id dk3mr15874564ejb.540.1612777098040;
        Mon, 08 Feb 2021 01:38:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612777098; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ou6MjQx3aEqS+dZJdVtB45Ac/x1Fy91KwJGfxFnQajYl9JI9Ah4flF30Lr5nKDxKmZ
         yuIk0G6GNlIyt/OVDky1m8LVSj/76b8GCKSANIybggjtcdYSUIq395z1MVgknIhRTgb7
         BnF4e1BBXr3b7NXM5GeAhtRHbTEqZO2raKl74RdIcbxj838uQLC6LSF89bxAuU43UQZG
         CVg0kt7MnFUsfJ8ezn2LK1IuxTzxH/b2RaqqWXbAKVyjHHlKSbuNs+tRAZORUEAlEVG/
         GTjSDmu+M30OUmRHDTECDrkMc5eal2rEbDq9/3H4dunl3DHvJUw/uNCoeI5RhvbJamuc
         bN9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=Kjp6k4tfzvFGrNL/S90uTRq+qP48JjOQpOhyvQ49HeU=;
        b=ikmI9TxguSEUd8sQmYH4MN+fqyIneTNHHf0iEPC2RYpG8CqF4pYMX0QQ2JC0Q8hYOT
         IWyLuzbj7AKx7rrgjF63Ot7tV4rbI+XlS54EIgGxhG6xui9sa94aYnTZt3WLE6v//ggX
         0EI9j8ldYb6QhpGq1SvhQyTNttnM4G1GunU0gC0DZ/CBFMK2C7ctV91k+HHomWWlktbX
         f9QRP9J02T7nl0YMHOobkTW1uIC0NaeCPBGAdhzVZ9njF/heGFZTIPtK+x8ZKf4WbcQE
         yeRq8/EBu53lUstwlrpz3YNkqCtqHSxkrEXFPzUfoXnKnApYUyvU99Xj9qoipB6qpSbJ
         V+xA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=gCKmKjg1;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.102 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80102.outbound.protection.outlook.com. [40.107.8.102])
        by gmr-mx.google.com with ESMTPS id y20si689077edv.3.2021.02.08.01.38.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 01:38:18 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.102 as permitted sender) client-ip=40.107.8.102;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmoP+9VKEQAbEwbUpwENFmufwsAkMJiQBXwBYx9teibLzOvXESRj7dHr1KF5ZmjdHqoJRAttbF8ubpA3I8J0uWnL4iVO9OtcbcRCCifzb/mCgzIxwBgVMAbEUf21qEsh+oWrPAfSm0hs5tbplQdXdFHc7IaAbi33bhhojtqwjvqeXLvJgeeZZASWMlyIQBrbAD+IFv9qyQ15z1VxgPjBIWLoV324TCsR0GIZrF0PszzLJ/UzvVOXsEEjBUvuu8MB2mnVNyfikDSJ0BT2Ll9xpghMfWWQMg4br5YFCBpw6d3rDofCKxzOLZAwQADvVMFR/u9+CRFjqdnP2Lp7c/BggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjp6k4tfzvFGrNL/S90uTRq+qP48JjOQpOhyvQ49HeU=;
 b=K26kIfXK+JG3Hbc3/ghk/DG+7BiikM9cccUHPaDTqF6sXyy1TObH2Ip+DtrsI57NgXkHnmH3vK/XAotbTPvicXXkqDVH/RFojlxZ72cjGJtiSWfP9MUbScY6xjh1DQo+h2Kod/Ivgd0NSJUvYDJCd8FO+aN/zWk1TP1GCL3Jw2mEENxInVcZq/L6CY/2kZtfVYwXY1G8nxMfaetOf9D0VyPjJ1oZ5zYXfmZ/G3Z4PRD0ZhlYiT85hcer3d2JDreyFlzLX7b/J6InPPrRMFyIKdoB/88Tp1dUigOXjcEbq3hbQ6fEtiIZ3ekRfqKnrFJBrVMoDzRVRqLqvMBnduwYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com (2603:10a6:208:ca::33)
 by AM0PR03MB6260.eurprd03.prod.outlook.com (2603:10a6:20b:154::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 09:38:16 +0000
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1]) by AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:38:16 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Overflow in MMIO registration
Thread-Topic: Overflow in MMIO registration
Thread-Index: Adb9/f7M/lP2EmDISBKFTcmUvnX2Lw==
Date: Mon, 8 Feb 2021 09:38:16 +0000
Message-ID: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ba76bc4-e475-4af8-e8e8-08d8cc154317
x-ms-traffictypediagnostic: AM0PR03MB6260:
x-microsoft-antispam-prvs: <AM0PR03MB6260845B6554297CA9A28F1CB68F9@AM0PR03MB6260.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v4/Re7uVbkSxRCULyciDdPh4EXgv6SFSpMAMNFDdM2/kzUbYNcmsxVBuFyehKl78k32RB2rNKTTBemRT+Qt1lMrDAmt3QMyL980q1v4sktiqov8qa2djPDdkxAwyXspkaww0DhQhZ/+cSAAwYnZkLPeiUY0dWhfnlQqWfjQXqEIqkIUv4+Pl6QJSKqWITfwSyzVUHAijB0UesROK6HcVSefKN1jqeCtKRiiFVvk7VmbMlacPBgET+M29HBkNz+dqS1m3mlaDjyeqh4VtDjGFgPzRnfvZOSoFn1bFcqtJzr6tuycmCslgwSOxqGxypaYlrgbRkL3LZE7WJ+nqlQ6r406OHR0jNLseV5+W4ook/E2QPTMdrc4AE3cPLRv9I49T5rc8jmTMJ3Gxi841WCwxysjB/gPE8aKIw8m5ba4wIfChNpL/P1QXxDkPcYWtVXiToCaB0prp/P98LszLxJlxCocHUm5hVN50ogaKer7EKe1Qs+qbleD8Fqafh/FpW5oXGUAZB+U+Ivhp3CZdNA+uabdhOrmOMRRUPRB5J8s3lxw6uxP3ESADjgOyEpM/A4PyuAzhqhtUCO+JYnHdvqNUJOVJCAlc1jQaCsOMu79hE1pAcSNB8sqiafz9mhzKql9WZxadBuvJKncUqIRGPPWN9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4450.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(186003)(76116006)(19627235002)(26005)(8936002)(478600001)(83380400001)(64756008)(71200400001)(33656002)(6506007)(9686003)(55016002)(66476007)(66946007)(8676002)(5660300002)(66556008)(66446008)(2906002)(19627405001)(86362001)(7696005)(316002)(83080400002)(3480700007)(6916009)(66574015)(52536014)(166002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?8MsZm76TDn4qFPnktdIU4k/RDQPZaAiECOtVjJu2W6xgAIdJb26Rj++DC5?=
 =?iso-8859-1?Q?GSGcpkUFd5qRZrVs4TsNZYf+hMPaYcYL+ASS27mY0dy71HkjhNRUoVPmZ2?=
 =?iso-8859-1?Q?v9Yjn0NryMjy67PiR9pmRNHHqfzmlxxlUm8/+Y1E2xtifCPnrxCcQ5EX5D?=
 =?iso-8859-1?Q?IvrFePKvtiNgz1oHTBT0N+1i9FKHQ6sTMp1lIpesIgTe32ReDujN24FL/3?=
 =?iso-8859-1?Q?ZIZYmKv2fDUi8tQll+iF8A9Ntf5HplImUse/j9hwqS4m/TYDpSCeKic15j?=
 =?iso-8859-1?Q?IyBxZl9FhF19DbcAUe1pDjslTJnLh3vWWm5SOz0iqhAqJA+q6TroVknKVx?=
 =?iso-8859-1?Q?mjR44yJ9XNUEEyyUlRDohLGhLKHGuuv9yKrQuCWnEgkQqUNFURf10yjsGp?=
 =?iso-8859-1?Q?03IXB3HindCLkkptJ+UD3YVcmujm0zJKgIIXvFGP7zolh2hGNBiUWNWzO0?=
 =?iso-8859-1?Q?gfLMr74xD41wj+p087CaIfXmWYAfo1ZVew7Mu/xj4pxqq+ulmj8enTjnyk?=
 =?iso-8859-1?Q?G8jtNE1AY36zIlZyVhfe2AAsOPhXNomT0eo5XF9Efe53Uz+bDw0agEueMj?=
 =?iso-8859-1?Q?OhLAcfBPDtJKO5wWulVgJLzfnOIfsZGumhS7SCVaQ2p2hlUeoVyVLFsaZA?=
 =?iso-8859-1?Q?HTaV8UNQ7yBlru5JeR8C70f924/4IeEwfS3mHxxIVyHhbvomg/9YDhBy+J?=
 =?iso-8859-1?Q?27f4SHGK/SWrv9RQSzrn+NFYaA2ZsBiuobZWNFsAk7uA/Ljiqz3VK2n809?=
 =?iso-8859-1?Q?jb/MV8gi9cgAzlcEZv6Gi+KlRhfHwZ+OotXzw6bxrmFIjNuEKtNQBulea1?=
 =?iso-8859-1?Q?UqswCT4gdA3da0Hf9K0aKbn8zUhS+vupATT8msQyZpOfAse7QKDsFWkAPR?=
 =?iso-8859-1?Q?D/yK/WpNZJAAjA+/Fv6OTLb6q+FQDru9cNjl7cIgqfno5IURpuq/EuY+Pd?=
 =?iso-8859-1?Q?Fxf4ymcbYSy6uEiccl95mq6ZqADt0pfq4hDRICNoB078z5eV4PY82DMQBy?=
 =?iso-8859-1?Q?D4Gdk5Bk4vLJUguAGKoEHJOqdKUrJ7AvOc7ctHTHx9AaJoVa7tUZj7KF+s?=
 =?iso-8859-1?Q?JMH2BKWRjM9W/cAHDK7Hqv0QZNfQSrNQ4WhB+CzW9uMP9+7XHLefR4zyJm?=
 =?iso-8859-1?Q?l2Fu+ergMvq0JpRs5ZxMJyrkyKYAajUVHMAGXMrTZLvzX46Bo7aVZf12Q6?=
 =?iso-8859-1?Q?XuM91wcjGLA/pvFPF6gOi9mcdZ83jx54rgQclcwjLxEvUaBEMszjV2ummh?=
 =?iso-8859-1?Q?R/v/PolvDvP7rpaxvGOYSreUStv9HSUmn3ExPai1e1nRxMg7KxeUYOI1Ts?=
 =?iso-8859-1?Q?eNBfFVJr3qOZFLyuLzIjLk1dGN5T72U6NLpqcsq6WZ/28LyqweRJvuIAP9?=
 =?iso-8859-1?Q?lauy3JRd91?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AM0PR03MB4450A4AD70FFBBA0D726D521B68F9AM0PR03MB4450eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4450.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba76bc4-e475-4af8-e8e8-08d8cc154317
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 09:38:16.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtGcYahIHSNNsQRsyEVTafOFD1kzMZBJxvkZWf0s3gRT8LB9lUd5mep2T5GZPZ8zE99enTzyxFEGKg3NbscxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6260
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=gCKmKjg1;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.8.102 as permitted sender)
 smtp.mailfrom=Msainz@ikerlan.es;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
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

--_000_AM0PR03MB4450A4AD70FFBBA0D726D521B68F9AM0PR03MB4450eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to create a setup in which every core is isolated (6 isolated co=
res). To this end, I've created 6 .cell files based on the apic-demo exampl=
e. Each .cell file reserves a single core and a memory region. The RAM memo=
ry region has been assigned by dividing the biggest memory region available=
 in sysconfig.cell into 6 same size parts. Each of the parts is assigned to=
 a .cell file. The PIO regions have been left unaltered as in apic-demo. I =
am struggling with two problems when trying to start Jailhouse with our req=
s.

The initialization of Jailhouse env is done correctly with
jailhouse enable sysconfig.cell

The first issue comes when trying to reserve core 0, which seems to be rese=
rved for the Rootcell
jailhouse cell create core0-cell.cell
This command throws a JAILHOUSE_CELL_CREATE: Invalid argument error

Same thing happens if I try to load an app into the Rootcell by
jailhouse cell load Rootcell /path/to/inmates/apic-demo.bin
In this case the error is JAILHOUSE_CELL_LOAD: Invalid argument

The other issue happens when trying to assign a .bin file to any cell (for =
example in cell1)
The creation of the other cells (cores 1-5) works correctly:
jailhouse cell create core1-cell.cell
jailhouse cell create core2-cell.cell
jailhouse cell create core3-cell.cell
jailhouse cell create core4-cell.cell
jailhouse cell create core5-cell.cell

I've created a file (core1-app.c) which is a clone of apic-demo.c and compi=
led it with the Makefile in inmates. When trying to load it
jailhouse cell load core1-cell /path/to/inmates/core1-app.bin
the result is
WARNING: Overflow during MMIO region registration!
Cell "core1-cell" can be loaded
When starting the cell the following output is generated:
Started cell "core1-cell"
CPU 1 received SIPI, vector 100
FATAL: unable to get MMIO instruction
FATAL: Invalid MMIO/RAM read, addr: 0x0000000000000000 size: 0
RIP: 0x0000000000000000 RSP: 0x0000000000000000 FLAGS: 10002
RAX: 0x0000000000000000 RBX: 0x0000000000000000 RCX: 0x0000000000000000
RDX: 0x0000000000000000 RSI: 0x0000000000000000 RDI: 0x0000000000000000
CS: 0 BASE: 0x0000000000000000 AR-BYTES: 9b EFER.LMA 0
CR0: 0x0000000000000030 CR3: 0x0000000000000000 CR4: 0x0000000000002000
EFER: 0x0000000000000000
Parking CPU 1 (Cell: "core1-cell")

Essentially, the only difference in this scenario compared to apic-demo is =
the allocated RAM memory region and the core used (core 3 in apic-demo and =
core 1 in ours). Any clue of what is wrong with this?

Thanks in advance for the attention,

Markel Sainz Oruna
HW eta Komunikazio Sistemak
Sistemas HW y de Comunicaci=C3=B3n
HW and communication systems


msainz@ikerlan.es <mailto:msainz@ikerlan.es>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_twitter.gif]<https://=
twitter.com/IKERLANofficial>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_linkedin.gif]<https:/=
/es.linkedin.com/company/ikerlan>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_youtube.gif]<https://=
www.youtube.com/c/IKERLANofficial>
Tel.: +34 943 71 24 00
P=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa=
)
www.ikerlan.es<http://www.ikerlan.es>
[https://www.ikerlan.es/upload/actualidad_noticias/ikerlan_separador.gif]
[https://www.ikerlan.es/resize/branding/Ikerlan_BRTA.jpg]
[https://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIA=
K.jpg]
* Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen legedi=
ak babesten du. Hutsegite baten ondorioz jaso baduzu, bidal iezaiozu berrir=
o bidaltzaileari eta ezaba ezazu. Milesker zure laguntzagatik. Behar beharr=
ezkoa baino ez inprimatu, gogoratu zure INGURUMENarekiko konpromisoa.
* La informaci=C3=B3n de este correo puede ser confidencial y est=C3=A1 pro=
tegida por la legislaci=C3=B3n vigente. Si ha recibido este correo por erro=
r, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda. Impri=
me s=C3=B3lo lo imprescindible, recuerda tu compromiso con el MEDIO AMBIENT=
E.
* This e-mail may contain confidential information that is protected by our=
 laws. If you have received this e-mail by mistake, please, notify the send=
er and delete it. Thank you for your help. Before printing think about the =
ENVIRONMENT.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR03MB4450A4AD70FFBBA0D726D521B68F9%40AM0PR03MB4450.eurprd=
03.prod.outlook.com.

--_000_AM0PR03MB4450A4AD70FFBBA0D726D521B68F9AM0PR03MB4450eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m trying to create a setup in which every co=
re is isolated (6 isolated cores). To this end, I&#8217;ve created 6 .cell =
files based on the apic-demo example. Each .cell file reserves a single cor=
e and a memory region. The RAM memory region has
 been assigned by dividing the biggest memory region available in sysconfig=
.cell into 6 same size parts. Each of the parts is assigned to a .cell file=
. The PIO regions have been left unaltered as in apic-demo. I am struggling=
 with two problems when trying to
 start Jailhouse with our reqs.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>The initialization of Jailhouse env is done corre=
ctly with<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>jailhouse enable sysconfig.cell<o:p></o:p></i></p=
>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal"><b>The first issue comes when trying to reserve core=
 0, which seems to be reserved for the Rootcell<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core0-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><b>This command throws a </b><i>JAILHOUSE_CELL_CREAT=
E: Invalid argument</i><b> error<o:p></o:p></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Same thing happens if I try to load an app into t=
he Rootcell by<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>jailhouse cell load Rootcell /path/to/inmates/api=
c-demo.bin<o:p></o:p></i></p>
<p class=3D"MsoNormal"><b>In this case the error is </b><i>JAILHOUSE_CELL_L=
OAD: Invalid argument<b><o:p></o:p></b></i></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal"><b>The other issue happens when trying to assign a .=
bin file to any cell (for example in cell1)<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>The creation of the other cells (cores 1-5) works=
 correctly:<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core1-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core2-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core3-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core4-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i>jailhouse cell create core5-cell.cell<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal"><b>I&#8217;ve created a file (core1-app.c) which is =
a clone of apic-demo.c and compiled it with the Makefile in inmates. When t=
rying to load it<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>jailhouse cell load core1-cell /path/to/inmates/c=
ore1-app.bin<o:p></o:p></i></p>
<p class=3D"MsoNormal"><b>the result is<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>WARNING: Overflow during MMIO region registration=
!<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>Cell &quot;core1-cell&quot; can be loaded<o:p></o=
:p></i></p>
<p class=3D"MsoNormal"><b>When starting the cell the following output is ge=
nerated:<o:p></o:p></b></p>
<p class=3D"MsoNormal"><i>Started cell &quot;core1-cell&quot;<o:p></o:p></i=
></p>
<p class=3D"MsoNormal"><i>CPU 1 received SIPI, vector 100<o:p></o:p></i></p=
>
<p class=3D"MsoNormal"><i>FATAL: unable to get MMIO instruction<o:p></o:p><=
/i></p>
<p class=3D"MsoNormal"><i>FATAL: Invalid MMIO/RAM read, addr: 0x00000000000=
00000 size: 0<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>RIP: 0x0000000000000000 RSP: 0x0000000000000000 F=
LAGS: 10002<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>RAX: 0x0000000000000000 RBX: 0x0000000000000000 R=
CX: 0x0000000000000000<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>RDX: 0x0000000000000000 RSI: 0x0000000000000000 R=
DI: 0x0000000000000000<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>CS: 0 BASE: 0x0000000000000000 AR-BYTES: 9b EFER.=
LMA 0<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>CR0: 0x0000000000000030 CR3: 0x0000000000000000 C=
R4: 0x0000000000002000<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>EFER: 0x0000000000000000<o:p></o:p></i></p>
<p class=3D"MsoNormal"><i>Parking CPU 1 (Cell: &quot;core1-cell&quot;)<o:p>=
</o:p></i></p>
<p class=3D"MsoNormal"><i><o:p>&nbsp;</o:p></i></p>
<p class=3D"MsoNormal">Essentially, the only difference in this scenario co=
mpared to apic-demo is the allocated RAM memory region and the core used (c=
ore 3 in apic-demo and core 1 in ours). Any clue of what is wrong with this=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance for the attention,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"370" style=3D"width:277.5pt">
<tbody>
<tr style=3D"height:30.0pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:30.0pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black;text-transform:uppercase;mso-fareast-la=
nguage:EN-GB">Markel Sainz Oruna</span></b><span style=3D"mso-fareast-langu=
age:EN-GB">
<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td width=3D"200" style=3D"width:150.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW eta Kom=
unikazio Sistemak</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">S=
istemas HW y de Comunicaci=C3=B3n</span><span lang=3D"ES" style=3D"mso-fare=
ast-language:EN-GB"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW and com=
munication systems</span></b><span style=3D"mso-fareast-language:EN-GB"><o:=
p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB">&nbsp;<o:=
p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"display:none;mso-fareast-language:EN-=
GB"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><a href=
=3D"mailto:msainz@ikerlan.es"><b><span style=3D"font-size:9.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:#333333;text-decoration:none">msainz@ik=
erlan.es
</span></b></a><o:p></o:p></span></p>
</td>
<td width=3D"100" rowspan=3D"2" valign=3D"top" style=3D"width:75.0pt;paddin=
g:0cm 0cm 0cm 0cm">
<div align=3D"right">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"75" style=3D"width:56.25pt">
<tbody>
<tr>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://twitter.com/IKERLANofficial" target=3D"_blank"><span style=3D"c=
olor:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=3D"0=
" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"_=
x0000_i1030" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_icono_tw=
itter.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p=
></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://es.linkedin.com/company/ikerlan" target=3D"_blank"><span style=
=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=
=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=
=3D"_x0000_i1029" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ico=
no_linkedin.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://www.youtube.com/c/IKERLANofficial" target=3D"_blank"><span styl=
e=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img borde=
r=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" i=
d=3D"_x0000_i1028" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ic=
ono_youtube.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">Tel.: +34 =
943 71 24 00</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p></o:=
p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">P=
=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa)=
</span><span lang=3D"ES" style=3D"mso-fareast-language:EN-GB"><o:p></o:p></=
span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><a href=3D"http://www.ikerlan.es"><b><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#=
24ED31;text-decoration:none">www.ikerlan.es</span></b></a><o:p></o:p></span=
></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:10.8pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:10.8pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"800" height=3D"44" style=3D"width:8.3333in;height:.4583in=
" id=3D"_x0000_i1027" src=3D"https://www.ikerlan.es/upload/actualidad_notic=
ias/ikerlan_separador.gif"></span><span style=3D"mso-fareast-language:EN-GB=
"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"366" style=3D"width:274.5pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"200" height=3D"96" style=3D"width:2.0833in;height:1.0in" =
id=3D"_x0000_i1026" src=3D"https://www.ikerlan.es/resize/branding/Ikerlan_B=
RTA.jpg"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></spa=
n></p>
</td>
<td width=3D"400" style=3D"width:300.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><img border=3D"0" width=3D"357" height=3D=
"75" style=3D"width:3.7166in;height:.7833in" id=3D"_x0000_i1025" src=3D"htt=
ps://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIAK.jp=
g"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr style=3D"height:8.4pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:8.4pt"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:7.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">&=
#8226; Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen l=
egediak babesten du. Hutsegite baten ondorioz jaso baduzu,
 bidal iezaiozu berriro bidaltzaileari eta ezaba ezazu. Milesker zure lagun=
tzagatik. Behar beharrezkoa baino ez inprimatu, gogoratu zure INGURUMENarek=
iko konpromisoa.
<br>
&#8226; La informaci=C3=B3n de este correo puede ser confidencial y est=C3=
=A1 protegida por la legislaci=C3=B3n vigente. Si ha recibido este correo p=
or error, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda=
. Imprime s=C3=B3lo lo imprescindible, recuerda tu compromiso con el
 MEDIO AMBIENTE.<br>
</span><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#333333;mso-fareast-language:EN-GB">&#8226; This e-mail may conta=
in confidential information that is protected by our laws. If you have rece=
ived this e-mail by mistake, please, notify the sender
 and delete it. Thank you for your help. Before printing think about the EN=
VIRONMENT.</span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></sp=
an></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR03MB4450A4AD70FFBBA0D726D521B68F9%40AM0PR03MB=
4450.eurprd03.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR03MB4450A4AD70FFBBA0D726D5=
21B68F9%40AM0PR03MB4450.eurprd03.prod.outlook.com</a>.<br />

--_000_AM0PR03MB4450A4AD70FFBBA0D726D521B68F9AM0PR03MB4450eurp_--
