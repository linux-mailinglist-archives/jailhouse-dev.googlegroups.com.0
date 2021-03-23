Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZX342BAMGQEERM6FQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id A653C345BA1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 11:07:35 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id s17sf1132284ljs.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 03:07:35 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616494055; cv=pass;
        d=google.com; s=arc-20160816;
        b=q0A0l0OOQHwemRQcG1f5TYngdylvh6/FvQOCwsvXXJlTwtZhGOYlQXGF4YQeRgYYp7
         xKK4Uu0TUxq/N5ZjTOPpwSVcHmHWm7q/FWSWy1BQcG7eChV2IDgD3m84Gg7/hg2Z15Kj
         xYchL55D6luMzcD1W6PBX4xOWmq6rs+TRPTBTrYra5y+Qq3QCsUOt7RU/xZEwL7mBxM9
         6k4HNCRGqGHILpQ7mfp9IWiIFJkOO5HYHo9PYEjDY0QdMca0X8xQofyh6imCzfl0K8Db
         rYBvW/5AwRWKq76iZ92JJ+hhuXeAOKRI+lF1F9ttQI88hPSorIgYKOF0PV1cR0YahKax
         JD0w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=mC4yYu2se40r6PQpJiErBIf93BbkL4pTchB7lvVgalI=;
        b=pMAl5UieYkdjYcryeK6gp2u0Qg93rvdpAU5XAlu/O31NX1zj0N9gRfuqYqr+d6hTzg
         VjmjO6U/NuauJdiw0t+copmLOjRwev/38iCIMApnYJq1VFm2RIkyiLeX0b1+PBKFICBd
         Nr7ttgmJ7Y1lJQHqBuq2nvOQsLZvt3G+wcuZkxD4AjVp/i5ggnCk8YDylzcfjLa33H8+
         OSUgxmh/h9rSVws49lYRTacAz60o7pkDf2m0mXkoTabZG8i0zeU1ETRyZmnyEFl+yDFl
         79Nyz+Jb0ObiIkgELNVPaYdnEEBtsxMfeaJI2E75stpVS+flg16cGp0AuOFQ3DN0to00
         TelA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jaU4kxDW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mC4yYu2se40r6PQpJiErBIf93BbkL4pTchB7lvVgalI=;
        b=jNoX7/VfvSeFh+o2J8HhqEB/lhGse5IeOuj603xhEQ/wkRcfWMdm7VPX7RW/IYzF2p
         tZbMM2jpAPYCpDE28r+H+dIsBWO520ncZiZcCYwGU49IrxX7TnLgEdpwpMA+Bo33sTGb
         u81Bg2i0s/ZKSHfa4W9zAezZHS8JJWqYCnd1/WdMmKKIck4QX6OLMgPCkcaPFynWEB/B
         8+JLqrOpcCMjLE1qeiJkvLjO2almymH8gxNZaYQciy0NvrkmtAsCW5ghPICv0o3QA8YU
         AtHtXDsO1vuZ+6hRXK8BxAGaDodm8OVBb5Mp2MTrNzA5tALKeTYFtKylMX3BxrKrAERI
         LG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mC4yYu2se40r6PQpJiErBIf93BbkL4pTchB7lvVgalI=;
        b=J5TSEDS3uttGj+48b1Z3nTxDrHKoeZXiU2thqjolpRQH/tO1moFzDjkYgET2YRShG4
         fdw3BENb2WHdR0EidVGP+SVX/zdSylBhCX+HLE9aW5jQT1A7YQ/Q9i5/rMleuKB9zXzg
         XVuK2zvHdj0mheWVRiUAJ84thUN2LOvhP0ctTrt14TNo7NeILoOTcjOH0cWMrk1BoIUh
         0V+mVQ3g6dclB5XcrEkbnJdutNf/7FhUspu2E5iatWmA/VcQvaMMrkAzptiUVdBr06iC
         GhV1Bzem48mcbkrAI3VPya+XENqZQGBaiLIYG6qeugoz8lMXKXTaIsvr0jJUcLL2Kfac
         iS8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J2SrirR9bxMnaCuo1A36uPGyKE1/1DSkAZkMlaIZ3Ch53hVwo
	Jl6Crgt0De6cSK4kX82RGzI=
X-Google-Smtp-Source: ABdhPJwtfhQiEjn/YERxrOhbw4977pB7pf9v64yzd0ktpBXn4xRzxJoWB8Zb0+YKEjA1YPZuN63EuQ==
X-Received: by 2002:a19:c217:: with SMTP id l23mr2167446lfc.506.1616494055227;
        Tue, 23 Mar 2021 03:07:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls3031364lji.1.gmail; Tue, 23 Mar
 2021 03:07:34 -0700 (PDT)
X-Received: by 2002:a2e:a591:: with SMTP id m17mr2545932ljp.397.1616494054150;
        Tue, 23 Mar 2021 03:07:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616494054; cv=pass;
        d=google.com; s=arc-20160816;
        b=i0HDWrd7MVNxZqSD9yMP5Yw87V7KB7AMR9r31oEdl46sXM48oxg9KCaj6hhnITNyaO
         B5HGCwNoaxjhqQVg3ohFA8Y9GIrLE832Nmul7NCykbpa4sKpsg2PtlzTUo3LsT958TfS
         bYjAPvyt1yIUN+WhAM+pDb/RPb4dZzTtJ7Zz4RZKm2tPWFqiKttbtNtjy8Q6eCetJvmV
         45dicFozzm+0lt0r8xjbgOyiYyM71Bb/IMaClefPaKllanTsN5Y9rAHiMppCAo79ICNH
         NT0QvynllJCc5OD0CDrnpHYbMdxsiEumV1g+2lbwx2wVdF0rGsRt5VuKAkztc1W48DXr
         9ztg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=1YKO3wXDZjFsZd1CQGrmPVq0EKtb7sfaRg7wS3EtcMM=;
        b=h65WyCgMLngbiwRk4+TNJfkpEyD7UsIQhV/FP1FUng1rfqr7J8WC6akzdUNla5tr6C
         jKA1Bn7h7zMTmJiS83TCGNUWI9f98lIET2magGUXIDMLwQYKLiheFh6AvHmNBl4aHyJN
         9zwHskvCTMPW0kOcLPa6diM3pwjpFXQYibQjgWDJl0zS1iy0dZCZWYyuhlDYqIgMTx5E
         rMGSN+eMbogeS23RmEaWlRnxznYevHEztmRKYYsasWpt7MZh95uQGQyvvOP2Z+NcWxTb
         DnQRfpoBZYbgsZXJg51Wgs+4HSKRGf62kLywrz7uZ7alpyPSVW8CQFNWMuVT11ePrtwq
         YQ1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jaU4kxDW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com. [40.107.20.47])
        by gmr-mx.google.com with ESMTPS id f21si651498ljg.6.2021.03.23.03.07.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 03:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.47 as permitted sender) client-ip=40.107.20.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUBBWA+f9jqdrj9w6/bGFkDH6ghbWi2AP4n08NSBEbAPhRKpUoDW9ZQAggIB57EtrKYCNUK3HR8JBKWjqK60ZD7BRw9MUqNx+dUthrA2NV08sCsKIs4b5P50hgFq1rlkfnT8S4LMm5/Wty2POwbA1kZGL/Lb5l4HdWGVhC96R0VQMNdmFQ/QbVYsxMP/xDyCb2NQMvEhWNLf1000fx5bop19fcF9tOhK/puslU6LgOdsZrNyKuvHl/sLcuIktozbc1Y40Ycm0b/rEViHnf/QAwkJJPBAyKB/pKhQSvb2Np9xyQr1/VJHJHVOEdgr0JCFLZbDqVuw1mbbHBbRVbXssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKO3wXDZjFsZd1CQGrmPVq0EKtb7sfaRg7wS3EtcMM=;
 b=MMmXEFn6xsFQFuEvSWxJWo+CpwAOl/Mmk0UYqFFAzxcBEUJBi6SwWYEloVl4MwYT/3kTr7hbP+5G+kLXqsJVj13DCwaEgSSgSk6WGxhJ2SAu/8pVQzulz1nnqztDoy4c4MpME3GgoE7pGqrZlIx+WXwpz/x3Od64ehsrlxSRA4dEjRgVQC8Ukmvy2A9vPqYVwQ903Na6ECEGp4hDqFk/LOcgaXXl9j01hx8RSlRHOKWoOjjaAH1JphVY+c51P+qoV3a/0hgEO4GjHAwDPXpW8uBZnqG1N2j2Jv3UtRN8/agc6hLRMeMgtnPCHvkF4MsT2TtTtuF4XaccvBgEUuzhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7787.eurprd04.prod.outlook.com (2603:10a6:10:1e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 10:07:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 10:07:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 5/5] arm64: imx8m: correct pci domain
Thread-Topic: [PATCH 5/5] arm64: imx8m: correct pci domain
Thread-Index: AQHXH6j8EYGL2FNb10+8Y6KJESY5A6qROdIAgAAfPOA=
Date: Tue, 23 Mar 2021 10:07:32 +0000
Message-ID: <DB6PR0402MB2760099F337772369A00C89788649@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-5-peng.fan@nxp.com>
 <569f4ca2-ddf0-89cf-85d1-da3dfa75d99a@siemens.com>
In-Reply-To: <569f4ca2-ddf0-89cf-85d1-da3dfa75d99a@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9607d269-9aa7-4bd2-0a4c-08d8ede379db
x-ms-traffictypediagnostic: DBBPR04MB7787:
x-microsoft-antispam-prvs: <DBBPR04MB7787C08664E009E50037329588649@DBBPR04MB7787.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ujW8RrSJkuGaFQWh7q9/YBYWnYpEzeYXsABse3cqDAB/ovnlqYUgZdMyAdaCWKzKJh/U09ktLZAPL4Nu5l33Y59NKiG1V267s3wxdRjlaXY3DGy1wABpV14gMdvY4Rz1BFCt93GGgxAYGpkkoBNDH/nFXwmFnIGE2hDB6lVMOTEzLi786NhqaRiLHqnYV/pn60EOdJez7qDspAUmyMWTeoNKCV4axL3gb8LKToXeZnXwVrKwFHlofhwXIn5+5ETa5KOK6y3lTisV3ckFrrp3/XYgTNXhMt4uFPecfLhXWym6xC8RmrdbGCC3k9AWKfpECxDdPjKnynrOk/EyoUNCa0TKRLKBGg90qKg0N+OobCi1XeAkzfQlgL1DltmDpZWSjL0TjUUQD4+qyOMTABmQLL9hX3r4l0Vfjm1whOHg3GbjxWCVUs8u6t/gbTCEoCIcGBDpeAU1pkSk+k/KYhU899Ef67LPrhKt0y2HIzrlmrzeityNW88RDLWT0JCIK5WbQ4fb4inGpAfl7uRtRuC4VJonTfFEH+YNSFtcZTAUeHDD/hUFBlTzCJLZTtV78Mx/FVa+hbiWx10oFqau4sAiqrj7g9qY5HHC+Ge+2JPr7OF6hQW+RfZCKF16MWi28V7TB8tFS82B8f+A+8ZLnJJnoHljhk6HbuCXIpz/ugX5kHGYLh3upzC+j+vsCYag1PPT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66946007)(66556008)(498600001)(83380400001)(76116006)(38100700001)(64756008)(8936002)(71200400001)(66446008)(66476007)(8676002)(52536014)(110136005)(26005)(7696005)(55016002)(5660300002)(4744005)(53546011)(44832011)(9686003)(6506007)(186003)(86362001)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aEpuUXQ4M3JKbWxwcDZtVEZXbGJudllWeDZEUCsxODdXSVFIb0VDTldnemo4?=
 =?utf-8?B?Z2Y5QlpMN3BSZ3VoMk9wMWNNa00vUTFCNHlMcDJCby9KYTdsWEtxY2hVMHNr?=
 =?utf-8?B?aUdWRU5SNGsxNDM2WjY1VjIrdDdMeDhMKzZZd1h6MFJZNEozYWFWSW92S25J?=
 =?utf-8?B?K1dPZDNpdTFmcTVqWnowUWdLQ1NrMHpaSTltQkdrQXdNYXp3cm9WZkdqUUFY?=
 =?utf-8?B?V2ZjQytKRVRlTnAyZ0UrbGtlYWVCT1FZVzBIV09JWWsvNG1aWDJXR1FULzNt?=
 =?utf-8?B?L2ZoRkZiQ3g3WmhSQzczRjZMcmJtNjcxbmh1NUdpUHVxakUzZk9iM2pRUjNu?=
 =?utf-8?B?WUQ4RlY1RW5jNUNzV0tvZjRQMWRINlRjalE2UzlHcWJXSnV3Qk01MnN5TENH?=
 =?utf-8?B?T3JoSlAycW5OZUFHd2Vpd2l0dWVxMzcvSTlKcXVhS092aW9tVHdHZHpnTFlI?=
 =?utf-8?B?Z2ErU2cvUmtTTnYyUm42eC9vbUkxeWVnQnRkYnhpdWg2M2tMS3c1QnFpbHBr?=
 =?utf-8?B?TG0yZDY5S3dWZDJoNjF3QmhldDZSbXM2T3dKS09pallQNUpzdmtVcGh4VGlz?=
 =?utf-8?B?V2pCSU9XUjhsOE15RXk3U3Zoa3F3VGZKei9RTDRKMWs3Vmx5TlllUEhuV2tJ?=
 =?utf-8?B?N1FYWUF3UWFXVFZQbEp2TEpvSnNqVjZ5SkZuckRtelJOMk9jWDBPL1g4TDky?=
 =?utf-8?B?OVltQnpMZnNpODE3V0xORW9GVzVzQjNEUkMzOHZCSU9LRTYzM2d0WmV1REZ1?=
 =?utf-8?B?c1JaWkR0eDA3RTI4WWMyVkhqUnpwWXR5WGZyZUg0SGtjYzdNWk9iT1haVXJ3?=
 =?utf-8?B?a1Jjd25BeTNsM3VkaEhMWktPMU1Xd2NHck9qS1Bqd0dnMENLYWxoeXBmTWFk?=
 =?utf-8?B?U3MzUFRiUGN4SnRGUURxdjZBYzRER0hUSnBwRDJScjBEVjFINHAxY2xIRUFB?=
 =?utf-8?B?QTFrWVRRUEZaNnkvU0tsb1ZJdTNtQ0p1R3lpV0dzbDNVTVhEM1hJcVlUczFZ?=
 =?utf-8?B?K3RtS0M1bUE0N3B2TmsySVRXbEVyY3VXL0dRK0d4NWMzaFFNMnRvR2JhSHlw?=
 =?utf-8?B?cE9FYTl2YzdGaitnL1FtWXh6ajY3UTdqWEQyRU5HL3BYTkVTT0txNllEVlRs?=
 =?utf-8?B?OXh0dG96R2VXOWROcWZtek5HU21QVmNCTElnbmRsODZ4L1NMRGp5ZE0rRjZF?=
 =?utf-8?B?N1M4bDNodE9oRjg5d1BQdGtUR2NHMEhObHBuaGdDZlZsZlo0TzVLUjBGTUp0?=
 =?utf-8?B?OUgxQ29zWUEvdzN0WXlYTWlVV0dGNlcrbnc5ZGdWalk4ZitnU1d4cjVCaGJG?=
 =?utf-8?B?VjZ0TVZieE8wbGRYZnh6L3QyUENndHU2SksyNitpVEJVZmRpdE5IZzdZZkI3?=
 =?utf-8?B?ZUh6eHMyc0FNTVlETlduTEx4RmpwcHNUTkFNdUVMazl0MGNnTk1yZGM4MXpZ?=
 =?utf-8?B?VE5kUzlHbHowYXljN2dUbHVMdFVBUk5palR6T2hncThmRzFvaFpRNkE0am5l?=
 =?utf-8?B?dzQ0aDR5V29EMFNkYWd0MHV4Q0hOMXNteGNzd2xGWi9tNEh5WUJiSGJzWEJs?=
 =?utf-8?B?Wi84Z1Z2UFhJSHAvTWdRM1VyTlpoQTdDbTN4dDIwTnBYWEQzLzRKejNaNVE0?=
 =?utf-8?B?bHRZdlhiZ01PUlVpZ2NhanR5YVFtcys4eDVaVStuMCtLNUhxWXBDaFhvajcr?=
 =?utf-8?B?V0NXOXZlWElqdjRlRU0wbVhMeTluMVNnV3hhNjJCeDF5MVc5NkEzRGxzQmZZ?=
 =?utf-8?Q?FctbaKkV4ucRG9RJEduDL1SladxEypge78ABdfS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9607d269-9aa7-4bd2-0a4c-08d8ede379db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 10:07:32.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYkXv5IvNNy20DKHZswlIVUAUTl4Ad6nNyLECXRYWfJdnMXB0Xce7w1GTnc8D1o5FlIiAv8Stg2N7d6Aee+N9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7787
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=jaU4kxDW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 5/5] arm64: imx8m: correct pci domain
> 
> On 23.03.21 07:25, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > After linux moved to use linux,pci-domain, we update to correct pci
> > domain here to use a domain not used by pci hardware.
> >
> > i.MX8MQ: 2
> > i.MX8MM: 1
> > i.MX8MN: 0
> > i.MX8MP: 2
> 
> Which kernel versions are needed for that?

NXP vendor tree is 5.10. Upstream tree only has i.MX8MQ pcie, 5.11.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760099F337772369A00C89788649%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
