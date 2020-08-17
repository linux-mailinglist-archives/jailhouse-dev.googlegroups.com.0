Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBLM75H4QKGQEA2K7MUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C7246370
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:36:46 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id x12sf6230516eds.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 02:36:46 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597657006; cv=pass;
        d=google.com; s=arc-20160816;
        b=dLCUr3jWVOTbGISdPTRvD9IA9P9ASoH76aAkaLrN26i7aqLvp9Jsmb0S0nzUjhAEVw
         LtCdl3P7VGdGX40taBYPW89Dks/rBpudNExgUUJ/r0vji23YtjYaKYkMLN/BKnHAR7yI
         EQ8EItYqEFqvnoiNysCM/tXOth/ztzyKjlUHyAtuxm9EgQjAAW6Tr1O2cu1Mnr/8L91U
         h3IE56Nk/Jq2W9isdmW9X6SfVbQrvbf7jHQ9lU7cg4HPQ1GKMpVKblxPKhxBT8RKP3N/
         G8RlrbcU72qbnSvMUByPAkwRBVSHaHp/2RY3pkC4iKFnPCeGHSuxaFNeHvuwgVCKj90c
         AImw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=GpZ7LEl5Rz+OAuFH72WQCxosYbFMhezRpC9AAmCgwEo=;
        b=yqjXu9ri53SNoEy049/dTt6UFpYtZaFlT0U4uM4W7AFPk//GzTPj5mMuSvV1QwW+PG
         jDqTkmPMKqmYz+/kOY2xcvBhY6Kp5nlSCcbpmHC8UR2N6S1PAtOme2JcEtLqh5kr1v9H
         527+IjmQt6FCAhYt135so1bpK43MTpuyIXxZWxyDstxeO6Yb+tdfx/GwXc/+ZNTYzL+n
         s5hFD3ISMqM8CLUTYLEzSdWhlBAxRNQ+oW/2fpdorgXjy0GEaXcfCh1rirq1H3FCe3O4
         w/xw8hsIXWEJPATaLbD5d6DoC9c385cAvvqKjr6HCAaf4TLU7HMLNAW9BTKu42SAsaZq
         AaTw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pMixX3ti;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GpZ7LEl5Rz+OAuFH72WQCxosYbFMhezRpC9AAmCgwEo=;
        b=DQkB3mnlOp6xJzYh2gbqM/USMRJ3TL5zm+n8JVoeYh8TyMyzBfImEBTprdvqAMun2i
         eva/jdF0E5qMjd2XlPmXTNtUFsYAgVRUuzEgc1581yZ+iCnUxYOA+uv969tBfmDV1nuL
         RTgNUfPIWlrg1MsYmCacyOyyCR6bfp8IDhQF0q2tjOYvO1o0N0HVFMRGDGeXjFwD0NkV
         FLWd0itqVn1Nf88PYQZW8/kwRT2Ssgfn6cyvPv1RDHvsob+0naTBqzSyaW5xs/Lud3C7
         6FFln4ccogSHeVORQCnOdTdZ7a0HXKZUWmGOJEJ2m/+ooQvHG2xsV3Ic4thJvlUw9xQ6
         JO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GpZ7LEl5Rz+OAuFH72WQCxosYbFMhezRpC9AAmCgwEo=;
        b=ObwOr+Bdilp/4JPpSQulxtjfqIYTGwgn+o9MWVIW1irbL3k+nXNJBqc7oz2L+DYnEf
         hsWRupf5GgWVP0w3Ma0m+ls7B6raTMzbp83Vm2xH95vqgIbMsjQE0ISjdhilLkKeW10D
         qFIOQv93cr+GWEVZfHk3Xva2KCXrmCVx5X3sEXXp8B1maQfK2B70GmfbhCMJQgoe6XUP
         fAJJNW5cy5Wgxtiwf2ccZ+sYlnb0h9TjbJC5nhjVpSx0HCvZw5WPKLBixW1L8cZrgdJY
         pbxcffHMxVkeTgMbeQgdzIIkxeniI7ZNF9V1iClncIenClLclTXjtHDRPMtJFIq6odk9
         Je7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zkKvIJrh6lfANcwgwBEV/IMbdX8so15bCdG+3JlKM6m1P8dC0
	uBCxByGYBqhbgbISRUhHIQ8=
X-Google-Smtp-Source: ABdhPJz0Cso6p4TJizw5SYRAXSz/AcfJXWQ8SHCtYu3ZWy2czrEVDRmZpZbnxsoGY47/1q+56vFAbA==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr14108015ejn.542.1597657006081;
        Mon, 17 Aug 2020 02:36:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3912:: with SMTP id f18ls7573361eje.10.gmail; Mon,
 17 Aug 2020 02:36:45 -0700 (PDT)
X-Received: by 2002:a17:906:f8d5:: with SMTP id lh21mr14820324ejb.360.1597657005284;
        Mon, 17 Aug 2020 02:36:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597657005; cv=pass;
        d=google.com; s=arc-20160816;
        b=VoNRw9+42C0QRhJPaomHFct6jqFr4QhwK57RYIW/BAG+mYv3wt9z210rVLuEUB+xia
         TZ3Tv4nw6tlSI2x1NuNzbQ132/UL6s0qFAqK1FMOELIn8b11IcO//As0rD9uVPdRJ4rv
         gz8qb1tlC3O1mujGje2vGd+JESqcFn0vj8f166TH++zHuMPa64JwlTLI482XJyukjJLk
         CVJJQqL6MoEaA6p8JSotX5QnHUwzviwk3jMHNnWtT5PQupFiB4edWTuHORSi2pDtqIte
         MGWEuH7w9PsBHFmUab76cuntGEzwtlER1uHE0c+bQqcPUKjlMQJ9nIMQnpIm4GqBpFEf
         a+Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=wSdXS5pCCvezwof/zzAW3IcEe1NzXKX2u/0KopaIgLY=;
        b=fscmAzrAEHleM5zFKXoLuPF4N5g9MR/0YmSigW5Sec0mqrR05UiSNoDLwASG8l97TT
         RnE8t/UFnkt82kUPa9zBJ835ehC2ScfvHnl6nqg70dySYE1TOYv6w2y/WcuY3w2gsw/U
         HgSx2ok/IpxhH5PNd6l8/T7An+Es+NfulKTgtC5gUjCx3oP1NgfvnU/RckujqLDI2iPI
         QSB/F5n6b8y7LJ5qEuaG5EjoiGv10l6Z9Rud1IQZOHE3pgX6sICGfMAEHOnhkrsARyeJ
         WWjqwMu2JmIMar2eeZnMh9CAIeXI6QuFSCnOPCJOUk512KntuvTDUgBpz7nGqn8qR0es
         ufCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pMixX3ti;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70057.outbound.protection.outlook.com. [40.107.7.57])
        by gmr-mx.google.com with ESMTPS id o23si512764edq.5.2020.08.17.02.36.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) client-ip=40.107.7.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCZv65XWfeuKNa1xbhI0TDhWKtvP1zfgeQ4GDoDTDvaVmIgK7D1NFxCcSGq6yDHF/i4OESWPUp4PTHcv80IXiRMTskqXP4aT1DidkQuUujB3RxVPNIdbBl/2iZ/CFnJlKJ5YbeKjgLYFfr96xjdsFpKOKJyt7K0GKNJmOco+S3imJvZBxXgbt4w8GRrXiV++mPYGAvPGrmbQLCEp47NU8s9jJCmfICEeXo8cAiWfGywQIFx0Jygnb0J8mTI+aTRh7soH8450lVEnMIV9YvDks+4YCDrgksNZtp3CJRFjTzIZ2bNbbDnTGoqevJS9Qae9oEcdbRlW72U8uPcSlt9NpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSdXS5pCCvezwof/zzAW3IcEe1NzXKX2u/0KopaIgLY=;
 b=T06nCUzstD9DYzx5iP/06r+zUeK7MGyrciUBAw4EtBbMrpCYiZuiDCkU+Hq2Tf/1OazCTCB9sBobORgP9Dg6DMZwGOmBU9zieiikRNv+6P3T5cxRIsmYGRlfMvpCszdQURYZPYgDiBJEDvzDQn/xBSeyf53EUdXyXR3ydQLlD135DI5w+cOXotpDjX9kZwQ5Mf0ykXcRVmaP9Xw6PKo9A3g2ySW7EJ0wQBzxydtNVRgB7DLiJKdguKFJpzP4EzGNp8rRM727S723+IJXcgH+kczaGpKinPn0sAY4VJy1vbbVnMTLANWXAjY9R2ZVgrFneDBrzvMr9gqP/yONJahjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Mon, 17 Aug
 2020 09:36:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Mon, 17 Aug
 2020 09:36:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: RE: [PATCH 06/10] Add libbaremetal
Thread-Topic: [PATCH 06/10] Add libbaremetal
Thread-Index: AQHWbGRD5zCxHBIdykSEGCFUwoysfqkyir8AgATRQiCAAAoEgIAAWiYAgARaAQA=
Date: Mon, 17 Aug 2020 09:36:43 +0000
Message-ID: <DB6PR0402MB2760D40A6D6B336CF1F81803885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
In-Reply-To: <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db5b3bb5-e9df-4f11-d49a-08d842910d5b
x-ms-traffictypediagnostic: DB7PR04MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4235F2F5695D949AEBEEB95F885F0@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s7zAam8Qv0caZ6W8u42Cc0fKfWN9ntDrtlILVeWU/kPr5foWOR6ajHRTJPHDoUS48C7+J2dLsOQ/8tKLabTnergNpfvGR8t8jjzoqB3Gu3g9UkH2uhXrx0UyxqK4MDfjsZx+3yvdIvcJL0EO3W9RJpDWAUhs0Dgf/vZh+5Z0gAA7huOPnWPv/Ia2FJRqpj92+qJqcSmD2PukYg4E+u1y97HkjOpQJxnl4ALYOQrCSJ8iC/M5lIpR3COnp7PEz1Ssuyo1KcH/Tf3Mc9ghtr72wtzv2lnukfknD/u6ftruLELs4+cb+grXilLC7QNLL+xlRLe4iC833szJbYorcg30Xi5OaUBGUAl7LWEcrBhhYUnA6O8JR0/Enl21Cd5Yg5ES8Enx1i6EDio26znzl4ZQjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(110136005)(26005)(86362001)(7696005)(186003)(6506007)(53546011)(54906003)(4326008)(45080400002)(8676002)(478600001)(966005)(316002)(8936002)(83380400001)(55016002)(33656002)(44832011)(5660300002)(9686003)(52536014)(71200400001)(66556008)(64756008)(66446008)(76116006)(66946007)(83080400001)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 6n0NIgrMVDmMvZN0lGctpECFNy/6dDqaYnAwuUFuhC51BP21HVNHm14KOh9caNgPwRJtm0P1O2n3nk45oVCwTG0nWERSAwLqizjqNy4ErSCyPz70DL/ZVqVBNumfXoYkPQIYNt3MhR17aCIq+jvfdFLPxwSYMPAVpL6byo2a1J9cxFBILIQL6e5gajIBHBkzqnx1+6x00GIy7seIruabO3CkLWdavMg9+Mn4DyroR3Y3bSoA+EEiBYMG+VeZYcLeQqryPzyxNNP38nUPIUv7k34ntKkurXpKzE+nGEBGGQI84jonyHI3PBUjBbikYF/ryLUEaXzLngZkXxjEwyaYK/Xv3PoFjeuQeBLjHzB+5HEdPMshYcefdiILy0VCOuOzC6cmcRxwG6jyBn3dSrd0fKA3cd/yHym1xU+wrwaHbrdsU7YuKi9lgdFuBM6x+KawvHfgGugmHkgMV77MBepHNIubQ/Fde6Z8Ex2+FEoMmoLs6qoK/r1OKGSl/gFYZcZETlFhaqK1HKHaJ5jV7tdwCaeOsmKDgBxLrQvrAY1ROlzhj2uoWgyeuIfVt7AM2zFs30dvBO+Ch6nMptPRAhhvaEIj9mVTzwSOWofWd60OhfQOKQnHoyZ8ZMNdtbWOS4iWP+dYi/UYay9NcDPFRpO3WA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5b3bb5-e9df-4f11-d49a-08d842910d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 09:36:43.2079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qA66D6MazFo2fic+pJFOywVhY3Zq9SKMk71uiUNdDgChyX4KTr4AkguEgS1QDIrR0ld/cBS/w49oBdusz/01mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=pMixX3ti;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
>=20
> (+Cc Wolfgang, we recently had discussion on the boot process of Jailhous=
e)
>=20
> On 8/14/20 11:43 AM, Jan Kiszka wrote:
> > On 14.08.20 11:08, Peng Fan wrote:
> >>> Subject: Re: [PATCH 06/10] Add libbaremetal
> >>>
> >>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>
> >>>> Add libbaremetal for sharing code between inmates and jailhouse
> >>>> baremetal loader.
> >>>>
> >>>> The Makefile code is copied from inmates, currently only string.c
> >>>> is moved from inmates to libbaremetal. In future, we might need to
> >>>> share uart/mmu and etc.
> >>>
> >>> Might quickly become confusing to have two libs. What prevents
> >>> renaming inmates/lib completely into libbaremetal? Sure, there are
> >>> some jailhouse specifics in inmates/lib, but those could likely be pu=
t in
> some corner.
> >>
> >> How about rename inmates to baremetal?
> >> And add bootloader stuff under baremetal?
> >
> > We could do
> >
> > baremetal
>=20
> What we provide is a minimalist runtime environment, which is not just
> limited to baremetal applications (depends on the definition of baremetal=
,
> though). But=E2=80=A6
>=20
> > =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
> > =E2=94=9C=E2=94=80=E2=94=80 lib
> > =E2=94=9C=E2=94=80=E2=94=80 tests
> > =E2=94=94=E2=94=80=E2=94=80 tools
> >
> > and put the jailhouse loader under tools. Inmates is a "brand" in
> > Jailhouse context, so it should remain in some form. But it's true,
> > some
>=20
> =E2=80=A6 yep, the branding is the point why we should keep calling them =
'inmates'.
>=20
> > of the existing demo inmates can already run without jailhouse.
>=20
> And that's the second point - we already have some kind of support for th=
is
> kind of use case. However, I agree that I wouldn't expect the preloader i=
nside
> inmates/.
>=20
> >
> > Ralf, what do you think?
>=20
> Peng, I just read the code of the loader and I try to understand what how=
 it's
> exactly working. Nice work! Do I see that correctly: You basically "imita=
te"
> Linux in a way that you manually do the early setup (some register setup,=
 GIC
> init, kick off all CPUs, hv stubs, ...).
>=20
> IOW, you bring the system to the same state, where the Linux driver would
> hand over Jailhouse. You activate Jailhouse, we then return to the loader
> which got lifted to the first cell, the root cell. Now you use the loader=
 to
> partition the system, i.e., to create cells. Therefore, you use the hyper=
call
> interface, just like Linux would typically do it for us. Finally, there's=
 the hand
> over to Linux.
>=20
> But do we really need a separate loader? Can't we just place the
> loader-related stuff at, say, the end of jailhouse.bin?
>=20
> To be more concrete, i think it should be possible to have the full
> preloader-thing located under hypervisor/arch/arm64/. It should also be
> possible to link everything that is required into jailhouse.bin - so we w=
ould get
> one universal binary instead of a chain of dependent binaries. [1]
>=20
> Pro: You can make early use of the UART in your preloader without having =
the
> need to, for example, duplicate drivers. That's quite useful for debuggin=
g if
> something goes wrong very early. Secondly, you can also piggyback on exis=
ting
> gic routines, no need to reimplement phys_processor_id, =E2=80=A6
>=20
> The next thing after early boot would be the handover to jailhouse.
> Before the handover, we set a flag that indicates that we do an early boo=
t of
> Jailhouse. We can use this flag to do the full partitioning of the system=
 before
> we return to the guests in one single step. IOW, we never return to the
> preloader once the handover happened. We can do that, as u-boot already
> placed our guests and we just need to start them (as we would start regul=
ar
> cells).
>=20
> The amount of additional logic in the actual hypervisor core should be
> reasonably low.
>=20
> Did you already consider that strategy?=20

No in my mind when I did this patchset. My idea was to minimize changes to
hypervisor/*
.
Thanks,
Peng.

Jan, what do you think?
>=20
> Thanks
>   Ralf
>=20
> >
> > Jan
> >
> [1] E.g., we could group early preloader bootup code to an own section th=
at
> we drop once it's not needed any longer.
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F9e8f00b4-2a2d-8bb8-e92c-
> 8e23e5910af0%2540oth-regensburg.de&amp;data=3D02%7C01%7Cpeng.fan%4
> 0nxp.com%7Cba17f1e9b4e54ebd409f08d840639eaf%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C637330143892122750&amp;sdata=3DcP24P
> MwWOKEDB8qefgoxm37hwFuEY4j27YM3IeDYAHg%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760D40A6D6B336CF1F81803885F0%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
