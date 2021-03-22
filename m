Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBF4E4GBAMGQEWLCSKXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BB343A38
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 08:07:04 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id d11sf15606229lfe.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 00:07:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616396824; cv=pass;
        d=google.com; s=arc-20160816;
        b=FSdr5I30eS7dFE9CBuKeyq7Kya605DnU6/70MbWLoCwk4uhO63ypJABP0NgX5QQ2a8
         /49T/JNEP1PPqoJM021hMbczCJHwGOQnRkdrb8GCIu1nYX4VIT8gZVltfQrb0uDPPWbb
         s+ZJ2hM2UpTTXJyhqn75fOy1Zclb6+H4A5KIvxg8yamaX0pMWVm9H/wnoSmEWyvVcpgU
         qKfIW4+jVgfLXZgLQXcH6ZPtxWAXtPdZ3Lyy1U2wZ8BUrmRddKiOmeSHlwqDIH1/AXTB
         /5Q17hB/mht73dvbp1SjAEjMcSW8QV5VqQOERqAzjSAJ7wGBUNBojQf9OaOPXp/nfUcU
         2E1Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=Jq02YCIPHvnmH63vb5GJ4XaEJnvnVuOHLPl0oB11gWI=;
        b=cV5WEY8+6BX3i/tdjeXMmD2abZpkJ/qR3zmyOIUg+sjIV2E9+Ba4o2epEIfdwpxymn
         IknUgTjdgcEKM0rjybvhAmeqZ/ftzFqSlNvkTZ6Zn6n/1BNsGUf96Y79j2iiHSvv2iOU
         jn4uJldJMUuwGGnEjIGcwJ1XDb7zpDYO3YE7ac1llEhPh1hIAy6F1RT1sk46k1nz4DrI
         f3L9JUgascW3cK+SDYR3x+ypHLtDP/OkGsGy6oVOfIDQyWY2FEzNvOfUloJHDfRUqNtM
         EGqpmAm3JNziD835K93PhozN1K1hqSJMQnIuNy7C3QA73uT0RziRhEI9X0Z/Eh2zRsai
         77Pw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g3b9vUXQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jq02YCIPHvnmH63vb5GJ4XaEJnvnVuOHLPl0oB11gWI=;
        b=nuJC83Y+Q6d03RNCaqqPyRhvOtKPHVujT7r4MqoFM+RbaZg8ddMsvzxayUykVoRWfm
         BNz5c+UWDGMTVuOd9fGUTe9cQJZKIVnNIYFncYgkGoJCd9fg1kDDxidNYMy3nblns3jv
         iXWhEigaWDE0yz4TdX1lyzqZTYjZY2HZoQpXQeHt2KJna0E2fyjyV5dSBXNIUtV9rJIi
         NYeCRnarU5QexUDTFlWjo3iCPgCy0V/6Xu5EnnqJtMbOtj09/U2LDEvWo3G5YHpsPIq4
         fePftLzIjMsFv86jhlkbrk6wCwvCKXsFyfsQeFjgzG0Gwvw5GzVyTJZbrC7hKOLHqvwY
         bCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jq02YCIPHvnmH63vb5GJ4XaEJnvnVuOHLPl0oB11gWI=;
        b=VH6ytU7W3ffAXU2R1uKS1SBc+mN5+K6xdpD/zY9OyTOcNVDE2PjQhaVoheN7qajWTa
         XHOjDHjt0L1UijKAtUYlCvUU1jOyIXZnhWWg8D0XKcTgyjEdl0bUP9i/6Xwz/Lt+1WHO
         LgMWRTVjIS/E+sOivubUVra/YqXCtoapgxMTbbV0JMJweSh4RGkDPJv8rHEBgtKrZk+Q
         bpASWdbdXwEgmN7zQ/mCZjgYqSlaJye2fIkILkOgn2dgSBk1G7VOIXbvRbkcapJd/77f
         kjAhlDe/kWvQRo0sA0HsMptZV+euBh9S5GT0109beJAuCCYfUIxSsnqOxhVym2JMn5Zl
         499A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gKn+FlNbFbvYWAysZC5NJaoN852BLY68o/vFzd0PCqIcXZgDD
	Wgd10++koJ+nJCxeLlwkbx4=
X-Google-Smtp-Source: ABdhPJzws6S/VhSBJ67mYGC/xLEc9IDeF4/0hyhj2HLHMtrMmGuhsyByWuCEHq9Z7U2GUP968Z0eBA==
X-Received: by 2002:a05:6512:3e20:: with SMTP id i32mr8295071lfv.257.1616396824011;
        Mon, 22 Mar 2021 00:07:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls1812754lfo.0.gmail; Mon, 22 Mar
 2021 00:07:02 -0700 (PDT)
X-Received: by 2002:a05:6512:324d:: with SMTP id c13mr8309212lfr.165.1616396822876;
        Mon, 22 Mar 2021 00:07:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616396822; cv=pass;
        d=google.com; s=arc-20160816;
        b=t2RhFFZVlqUzRGWCgnG5xrE3GSwUxHjcjUgJz+TD9VCcURxyvS0+B/y0d44lRJzw+q
         +NV0oQbW8tPbd0su6lzimiWTFmOUU/w0K4E/QQdLHRDd1Ianl1aTDY+7OF7xRTSLZmot
         AbvdL+3MG1sCpuBWFe3UjR947oeMRvrgF4bwe09EEKbx+o1REP/60DjKfdxyi8NpiiTg
         okrHJsez/YfGkDqyWvBBeZhjjm4KELSBzfA9AqbFHjrDRcfhIJ9U4YCGUdvsehNK7ev9
         hmDjfe7DVF0Wz4WrahKpfweeBg56528zvMQny8fXHdsIVrjP61SpQhKLOI8stki6lXT7
         5NWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=UrulZpJ4bSEyvYusu8zjJuK0NDRNpMe5e6Xh/mJSAbA=;
        b=eLuSgWbmvwtdBPhUzN5LFX1PaPd409FE6ziwa9/y3ViqLTQKa0bWzkW0GHzcej5ILl
         EETrWhDK96X9IsTJVAiXhtlxOvR9iZL4FJdy1a/QW3HOm5+A/DOeHZaZxpYwjWZKdD35
         /9n90H4r5aAPwVqdMz244GiPMzSmkMO7GyRpgu/ZsR+zmGr/Q8295KSpEyQaQFNPiTbM
         oEZXhqaF2/XEOya1yVQfYUJRZ6y98tJ3SeaNMTromMDFTcUtXNOLMNa35C0i3U1uXH8A
         jjUY0vpI7X0kMFYpDtiBYyk3WEWq909k4Q7vQQmpCXsHCYKoO1ULOrsk0lntpoQkS++p
         FrMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g3b9vUXQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10088.outbound.protection.outlook.com. [40.107.1.88])
        by gmr-mx.google.com with ESMTPS id 63si418035lfd.1.2021.03.22.00.07.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 00:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.88 as permitted sender) client-ip=40.107.1.88;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apARYSQ6CeLtrFQjCgutSUXpxX6K8QWIFIAjlgHWiZJQqUZgEqzfHcQQuV2lMvANk8/NxJoc0B4SA3NE3U8jN8gcv7DUJSjmTWArL217hIRayvoU4FpDM0o5zxznfN1FPYKWvgoG2GDZwtDfCyWKDpa6KPbtt7WhCJlQviHX6AmVkE0zyD3hxc98k7+zpLf98qz30FpXNJmsxbMsRcxK6wogrXfQr338Ei2GykKXnrtm0YHPzbqpFmqAtKaP+TmT8SEq0FOqF17Ca6rIWaLoWaclODvaM64+uKIPSpC6ZfXdb3/hOa2YWmCgce1QDv81OMLaURp+/TYYeIEh0YJiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrulZpJ4bSEyvYusu8zjJuK0NDRNpMe5e6Xh/mJSAbA=;
 b=IYOy0hKJLg/Tm2xf4l+AxPsGKu3mKl8Q5KzXfV6oyynv+9PfM2FHLstylqrzPDKyMlFGVVpcYdN4LCDkE3FDIteE364R87bKEd0yPHNN6ApfPSZclq5o9xAO5abMNdYGkHrDzAJ09qZOG5cCnGTRvCKeSHwFljpStC6dx8T/JtBzUSaa0O9fzd33E1kGx+bFw0lkfYBuVd3fCFrEnxSP3EYTo+d1ToTucFtS2QN9Pj4qRvAXk0Oqp1EAK2u2sUGl2zN6oeCK4kTA6oVY7kSMn2y0mv2epsInXeYPif6UAEyfOoA03X9ItlH/bvblScL7yxgxw+u3kLqxf4WVjFFUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4940.eurprd04.prod.outlook.com (2603:10a6:10:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 07:07:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 07:07:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Alice Guo (OSS)"
	<alice.guo@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH v1] arm64: dts: imx8m: add pmu node
Thread-Topic: [PATCH v1] arm64: dts: imx8m: add pmu node
Thread-Index: AQHXFyoOtSwmHPKZ0E+uduPE9uTyMKqK992AgASslBA=
Date: Mon, 22 Mar 2021 07:07:01 +0000
Message-ID: <DB6PR0402MB2760CC86ADB97D6C2A60507588659@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210312102609.20392-1-alice.guo@oss.nxp.com>
 <f430c0cb-52a7-7f36-a960-66840ad12110@siemens.com>
In-Reply-To: <f430c0cb-52a7-7f36-a960-66840ad12110@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc700e50-c185-46b0-3a8d-08d8ed011732
x-ms-traffictypediagnostic: DB7PR04MB4940:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4940AEE67B87FFB81F5528C988659@DB7PR04MB4940.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kTGPwTl6Qryvzn3gEiJ78UPS3bDhIEx7rI5f3P8Zqsv1aNQmUKt/uS8Jr1XcRArOuCiHdEhuSo+ssupzIgINKT0oyLQlLE8eSMYwrHEiGkzp2tXJGJS9ILuWDclJtSyvr/qrQ7eKuIwOUdVNUKaRQk4TG+nImxqyBU7a8BB9/L5vN9jlrhYmTkGFpYNwUW4n2cino1hDUHFbMzZdbPW2ntToFlBwE9sHp9viP/4LcpgzJx+glz2MS2JunHXpwUP2R0ivrs3misJ1tYtVKQvYeLq3H0IENI2ddjdNTte4DHisOUwszdV14eGoptaF/zm+roINxn9p5lsdhp4Tv2ZMC1X8bYFpZkVihJIItVQEELZ641QI30JS1WAQs0dr8IrdUnDDaj6wvYdjoneJ3vRZCYb1Jkw92VJrAH+2a1bmnl05Al1ZG3ewnyH9yE8JDoVlgKLmDxiKAFUnFTEpXuaDM2bWhr0VCEQCWNDpWQRBhVDp8PMWSpdRbGFiTv21Be1f1ccdxNnvNttCP/chMSZCOjx8l+jI5zp1areBjxnwmL2WzfkGJaQKYAuKCxZUS86YGyXwuCiUp1uxBHlquCLZp5w5hvQV4Vwr491HOQqLpwmuiF2wmoJhucQ3wR6bGoqd42hd5Jb/4RkIANrV2FGRC/5TLtPv64RT2eTeaVh61VBqcdmORnuRsnVVB7DW1FnN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39850400004)(376002)(396003)(7696005)(44832011)(38100700001)(66946007)(186003)(8676002)(66446008)(9686003)(83380400001)(86362001)(76116006)(52536014)(8936002)(55016002)(64756008)(33656002)(26005)(53546011)(6506007)(4326008)(66476007)(316002)(66556008)(2906002)(71200400001)(110136005)(478600001)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VjRTZVRhSFFXWkRUN2pXaHdYM1QxVUhHUklDK1dKdXJtTVp6WHJmcDVPSTNp?=
 =?utf-8?B?ZlJDSzkzaW9xSDJHcWFOd01HRkVFaW9Ga0dkQVlmaFI2YW43RDlpSXNhU0tM?=
 =?utf-8?B?M3RBRzlxSVdzK0pDKytKNWpzK3YybU45V0crVGY4SjBveWtMMGZYQnZUeDBl?=
 =?utf-8?B?QjlYNjlxSUlPRmRMaXVVaGg3NHRKQWZjMkZNQUdIOTluZTFLa285UlBqWUhw?=
 =?utf-8?B?cHMrOHU3aCtwSC8vMVQxc0dkVi9rSUlHYW9TMGwvRURsaWl1ejAxS1V1Njh2?=
 =?utf-8?B?TGVvNElUM0hveUhSQXBhVHZHaHF6VlR4TTlWLytkenBsbVZuWDBOcFZmRGJE?=
 =?utf-8?B?MWpGUVN3ejQ1dFVSdEhSLzllQVhUMUJyVTVYeXNoaWl2TFJIdmxzQ0EwY1U0?=
 =?utf-8?B?aFVkeVdoWlhhYW9NMGRZb3BiUDNoV1JZWnVoU0dwUnpsY2Z0U0pQc2k0QTJU?=
 =?utf-8?B?UUE4MklnMUR6cDM0WGtpSFVla2VjcElvOG44OVVkcmI3UmE4NDVhbXF2QW9w?=
 =?utf-8?B?K2NCVlNqVmdUSU9aUzlVeDN1V0REdmQzd3N2T1gxalNnSTNlR1VPdWRDRThl?=
 =?utf-8?B?QmJ3bnVISUdCRk5qYW16eGh0SmhOMnVoWk1rVnh1bUYwL1Uvc2lBV0hXbGxw?=
 =?utf-8?B?STV6T0JVbWY3REtXYzVVbTIrUjZYcnA3QlFPV2R2ZkEvejFOWEE4QUE0UThD?=
 =?utf-8?B?T3lLUUhNNEJwWFlmY29zMXk5cVhDMjdnbXFhcXplT3YrdlhUM1pTOFpaUEcr?=
 =?utf-8?B?bkx5bGdSejdjMnl4K0ZwaTUvK2Jsd3lHUHN1YWtMSDBERXlLaGtBbHQzRGN1?=
 =?utf-8?B?T2lOUlVXekZoU0JJemxDSTlaRzlDTmNRTUNSRFdkeGd0bXdzS3YwMlpiOFNW?=
 =?utf-8?B?Q3pNRklEYlFxQWlkMEZhWktjWUE4c24yaVg2VDJRSDF0Q21pRzhmM2ZCazlm?=
 =?utf-8?B?OERFd2daRk5RS0QzanRxeUw2TjRCemVDU1JlU0dXcmVLY1RUMXFrQjVTdjRz?=
 =?utf-8?B?TTIrWXljTUpsKzJaSnBTQXB4NWlsQmhQZ085RHhsSE83VHlZS2pRcXZiY0xS?=
 =?utf-8?B?KzZ4QXZlT3UxdUdtV0w2NFN3YkRJSnVDL21wdHF5d2g2aHl6V1VTY2pzb0Vs?=
 =?utf-8?B?Q0tQbmpCMzU3Y1NqVEcwV1hKNGRsa2hlU2NiSlIwek5vV1pGZTdaOTBrS1lK?=
 =?utf-8?B?SFRuK3BqWmc2RmlMSlhkK3RTYUR5cUI3TkdkWTFzVkZRRG04SkdDTjYrRkRq?=
 =?utf-8?B?bkdqMHBlcEdsK2c1RHlWazdxS2o5WTY0YVlOUE9kRlV4Z3ZBNVFGMTdKNVZm?=
 =?utf-8?B?Vlk4OEtraWoxYy9TNEV5OE5sRWxKVFZCWFVOeFNxMThFVld1YWlNMHNjYnN1?=
 =?utf-8?B?Zm5ER29qZWtkak9Mc1R4N3BwbDZiOHlZaG9MVGh4R1NZQ1cxL2kyczAxK3Rm?=
 =?utf-8?B?UjhFalc3YUwvUDU3SmsvS2pRTjlvT3Bxd0Z1eHVUT25ocERYeGM3blB2NlRz?=
 =?utf-8?B?NTVURk1CTDhSZnNYcXc1Ylo0QVRWcW1wTTIwazk3b1B4aWdCMjJNakdPbWtq?=
 =?utf-8?B?TkhUdTRmeG5oY3RTd1RFcDg5RmVkTGNHTytqQS90SFh1cnpxeDM5dVZYMVg3?=
 =?utf-8?B?dGlQK1hyWXhudjVlNys1elRUZkMxS2tKL05ZTnQwRmRaTFkzY001VVQwcVJ5?=
 =?utf-8?B?U3VtSkhJVTdLVHNlZnlKUlp0WXE5YldBejdvNlIzcndCcnI0Vmd4RnBUeWlr?=
 =?utf-8?Q?KPs8c90SS7QkNLauiJcNMALF9HL6jwHEteEbtSz?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc700e50-c185-46b0-3a8d-08d8ed011732
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 07:07:01.0953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkQn9EMo1XsA68olP1kvbZdG+ZBulgHConZArIHiwakgQkeeH2Tas09itXrC0AzaCiQ3OdovhnKqn/m829z4eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4940
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=g3b9vUXQ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.1.88 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH v1] arm64: dts: imx8m: add pmu node
> 
> On 12.03.21 11:26, Alice Guo (OSS) wrote:
> > From: Alice Guo <alice.guo@nxp.com>
> >
> > Adding pmu node supports to use perf tool to monitor the CPU
> > performance of the inmate cell when enabling Jailhouse and running dual
> Linux OS.
> >
> 
> Is the PMU truly per core, i.e. exposing no information about other cores or
> central resources and also not permitting any influence on other cores?

To ARM64, each cpu core has a PMU which is per cpu, and its registers
are system registers that could only accessed by per cpu.

I not see it will expose information about other cores or central resources and etc.

Thanks,
Peng.

> 
> Jan
> 
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >  configs/arm64/dts/inmate-imx8mm-evk.dts      | 7 +++++++
> >  configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts | 8 ++++++++
> >  configs/arm64/dts/inmate-imx8mp-evk.dts      | 8 ++++++++
> >  configs/arm64/dts/inmate-imx8mq-evk.dts      | 7 +++++++
> >  4 files changed, 30 insertions(+)
> >
> > diff --git a/configs/arm64/dts/inmate-imx8mm-evk.dts
> > b/configs/arm64/dts/inmate-imx8mm-evk.dts
> > index f7c21b10..591c3543 100644
> > --- a/configs/arm64/dts/inmate-imx8mm-evk.dts
> > +++ b/configs/arm64/dts/inmate-imx8mm-evk.dts
> > @@ -48,6 +48,13 @@
> >  		};
> >  	};
> >
> > +	pmu {
> > +		compatible = "arm,armv8-pmuv3";
> > +		interrupts = <GIC_PPI 7
> > +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> > +		interrupt-affinity = <&A53_2>, <&A53_3>;
> > +	};
> > +
> >  	gic: interrupt-controller@38800000 {
> >  		compatible = "arm,gic-v3";
> >  		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */ diff --git
> > a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> > b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> > index 74fe9d7c..e5a87d03 100644
> > --- a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> > +++ b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
> > @@ -48,6 +48,14 @@
> >  		};
> >  	};
> >
> > +	pmu {
> > +		compatible = "arm,armv8-pmuv3";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 7
> > +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> > +		interrupt-affinity = <&A53_2>, <&A53_3>;
> > +	};
> > +
> >  	osc_24m: clock-osc-24m {
> >  		compatible = "fixed-clock";
> >  		#clock-cells = <0>;
> > diff --git a/configs/arm64/dts/inmate-imx8mp-evk.dts
> > b/configs/arm64/dts/inmate-imx8mp-evk.dts
> > index 2fb4bc74..b4068771 100644
> > --- a/configs/arm64/dts/inmate-imx8mp-evk.dts
> > +++ b/configs/arm64/dts/inmate-imx8mp-evk.dts
> > @@ -48,6 +48,14 @@
> >  		};
> >  	};
> >
> > +	pmu {
> > +		compatible = "arm,armv8-pmuv3";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 7
> > +				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> > +		interrupt-affinity = <&A53_2>, <&A53_3>;
> > +	};
> > +
> >  	gic: interrupt-controller@38800000 {
> >  		compatible = "arm,gic-v3";
> >  		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */ diff --git
> > a/configs/arm64/dts/inmate-imx8mq-evk.dts
> > b/configs/arm64/dts/inmate-imx8mq-evk.dts
> > index 8d620522..45b42c94 100644
> > --- a/configs/arm64/dts/inmate-imx8mq-evk.dts
> > +++ b/configs/arm64/dts/inmate-imx8mq-evk.dts
> > @@ -48,6 +48,13 @@
> >  		};
> >  	};
> >
> > +	pmu {
> > +		compatible = "arm,cortex-a53-pmu";
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-parent = <&gic>;
> > +		interrupt-affinity = <&A53_2>, <&A53_3>;
> > +	};
> > +
> >  	osc_25m: clock-osc-25m {
> >  		compatible = "fixed-clock";
> >  		#clock-cells = <0>;
> >
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760CC86ADB97D6C2A60507588659%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
