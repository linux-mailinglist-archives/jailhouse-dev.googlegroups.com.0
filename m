Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBTOATX7AKGQEF3AX6GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 5377C2CB908
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Dec 2020 10:37:18 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id r16sf2275978eds.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 01:37:18 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606901838; cv=pass;
        d=google.com; s=arc-20160816;
        b=y3Xk8JMVmKzzqannLduL7eQmU+3dN+A1ymjT7XmU0MeQS1S33mPPVuulaI/umD2Laj
         sjbtjmtTRLwtoiuyEbbKFhZNM0mZguRLvopAOkmFeDxWDLEozksIYeubp57lvkI9DR0X
         oOlzD631kkmaGoPZaDj4LCLXyCXSQXyDKLzUAY8HGTzdNWVmuQg1xjDp6k2CJud8fpWB
         wxNB8R0uJD6Ivfo9zduEBYlPiCWIx5GB/qBM1xY2Add//qKE7ocgWTfqjrGcbc/4QE5H
         xvkJqSr62ll7P8M/+wEsYHN2ePTSETTgRpyK7e+FhGG3wqOIMCLgCHCOqURYoAUjUmsU
         E8ow==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=iHL8RH2t35xXLoZeYbxV8CUTsK90PTmYerg644/+X0I=;
        b=sI4puANkpGBh9vnXBi9C8Qs1yAFNh0cVPDi9Ty6g5C1gR2D6G2QNnUpYTuM5o5n94c
         yq2PzbYVEut5KsF6gEXFWTDpggIeJ7DotFAQSYTE/xdrSJb/thlIIWkc/ZBnT3CW1goP
         ijl5/LXWwjocFkXZ3Jge06CPipjJZ9BsCMiun1qXdXl8MX23se0/igrMpGWxtjxSDv5+
         bkWsrFHh4NIpRcM7tPky2UqjlZ+LjdmetUDAi4Ykp35mIaLPI0vp5XfKNZL3cKl7wPN4
         nhS5mSw6Iv6bkNX8nxVOoAMk3CtWD3MLmb8LaAS2Lse/2U6Ul4u5+o73i33H+Adzm9R9
         Qgag==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=ykp2HzW0;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.132 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iHL8RH2t35xXLoZeYbxV8CUTsK90PTmYerg644/+X0I=;
        b=d3PyC1RSYjndPS2cs8/u2hTL4okfhsIVEhyjBPdsNvQJcPbUGcuCyBx7qPxaUI1FnH
         bRnq8WwqLXLUGEL8IK0DPklwfA9LyM6uJSVkis3BzVXxVYzAuFySLxOOM9A1SbEKkv0D
         5hXS/vve+0lOUzbetL6bCVTQo0/p+3vAteOyO86RRsgtbv2rgaELTwvKUmmEiHBkIPfY
         nOAA8nnTq2rvSoaT3D+P2juz48EeBUDIhxIzWIwJqemYUUCyBMNuFOI7yT/O+0+BdBJD
         j/jRTl0Amw12r+o3A8liVoQ1NRMxHCfL6nvW4fNHElddRgmHQ0u5ivUZopD/2SgYP8Ea
         RhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iHL8RH2t35xXLoZeYbxV8CUTsK90PTmYerg644/+X0I=;
        b=EvdbX6NbOsKxUgrIvKM2cRZl3k3ZEgLjsgQJzzHPdYIOhYmFy7WA/P5Cnk2/ujTg0s
         jSYDk2MEQXRJ0luTXm3djlEtdhWaNcxdRvhElE5cbnr/8XItTdYljc/ZshF/d2i46BQA
         nHcWerDIxGT1oOi6TObaNRYOPvyRs8NVoFeXSSrT1CT2+9ggPzkr1LHbkl2o73fl28V9
         1Lflz0XdAlz83IJi2+QzXRq/nDDczUpO9rMW+vhXHX/iKLD1W1H2kTCpxzEgqSvSCzbU
         gzRGvrcKtYPaYsmHIQQvpirBnvld7e8sDVf0tknJRWaV1mhF/h7KZnD57Sf1OCOnvItP
         XSmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nKak+G8oliWP03ZUtJarCaVkiQx13TWIjqmQs+aOmePx8GJHy
	qrfPgfXSesfrAu/xKnV+/j8=
X-Google-Smtp-Source: ABdhPJz6j4wI9MnL+mDxBNyCwnzqHLFe2Jqy7k+F+P//kzbM0fmPI1KOkOyB9krTe6T69X/3q/lKbw==
X-Received: by 2002:a17:906:6713:: with SMTP id a19mr1539513ejp.468.1606901838030;
        Wed, 02 Dec 2020 01:37:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fd15:: with SMTP id i21ls1074658eds.1.gmail; Wed, 02 Dec
 2020 01:37:17 -0800 (PST)
X-Received: by 2002:a05:6402:895:: with SMTP id e21mr1748526edy.284.1606901837030;
        Wed, 02 Dec 2020 01:37:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606901837; cv=pass;
        d=google.com; s=arc-20160816;
        b=eQi/yTj/WLZy16ocLBYbwpXmj9rvx5p/31xOo51DkzvxzRE6QwBTiKAakEdHP0qJ1i
         zSWm1joBwIrM2JMmZWu+xE6gDhuUmsiaYnA1/5DDQ+Mu77HbxDQcEUwEmVIjR/NtCVvm
         gtopr9LXTaE2ivyVc8iaZtC9Q3MIezLGC7bUAYWwAc5QDsDKpU7P11U31qJkOd81Rgoa
         LlClyGyq9U877reKhesHOj8EXZ2Ljf7C4pqcUhuvjyQHpyYUvStoV7Hgl4Y5WjSeizp9
         bbHhU4U7vWZsOHOpkDwx/rhng7zNnvjoOEyw1PRjce55dlHua+WNRtl9VVUwInlA17Aa
         o1kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=P5fotShTDF/Knhv9yvh/SqVf5WnaYKU9UnXIoGKFgGA=;
        b=OymJto+rNwBGa/XTD71HmGd2uxx8H774e4auhax8++2gQy7yzUxqFnv+c1aQRFu7YL
         7vnIPPCq5MUJXq9K2pToL4eeA3a1Myu+yE+4CKBgcvZHn9k6XF6eGVyFP7oNUq98F4Og
         cSH5JnM+Y3ngINR8/0SfF9eWL5Nnox2VVgxNhbVidIOtp73D8eZ7Ezy2hAYeLkLxvO0Z
         U1DiaSJ3pHe9LSm02/XSAIOCxrH6u27c8xGYemGodgI+nICA6h6waYRNNwwyjX7Dt+8a
         7q2IVbMFY5/puyeozBzGVy8oaeJ5fOHLjQtwKCWXIAXMUY7pIyZkPNJVmZjf1znxniB5
         ky/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=ykp2HzW0;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.132 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90132.outbound.protection.outlook.com. [40.107.9.132])
        by gmr-mx.google.com with ESMTPS id i3si54157edy.3.2020.12.02.01.37.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 01:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.132 as permitted sender) client-ip=40.107.9.132;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFzV02QUY9rj7CbDHaVtO5v7xiVFdZFPEHaQR9kYgCDYgEqEh+dOgdAMB56g9LIssOldnTU6v1PbXDvR3f1ZoZm8LI/RGX9TdHvwTld69JcM811g1EnxZ1AJGEAqcVFlYrY9jgGmCI5mU/EoFTQ8Oqmb8guwKVCDbRvrNP5UK/Yn+yr3eTZdJQyLCKXq77qE1xYA4m6nZ87kNqBfftovXxf+0nBGzgJY/Kj2PZ+aeE37+hHkZaM1GjX55rFMrv3kW38mc61289CXP2V5tKRLtxHJFRzRwb3ezXpw63wX/2vhdKrMeAno+n+SQx9acsFr75QvRvMLysf5cEQwcl20Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5fotShTDF/Knhv9yvh/SqVf5WnaYKU9UnXIoGKFgGA=;
 b=dQmMLw56lOzkfYUq3UHqS76f1fX1cO1IH/LgwztETU9DWnMKiTxUx3j1Ij4y7CeJpb6F7CqVKGvwYQ6B/mBv1X1m5rrJnc9LQYPguUGqr9CDSAg3qgAzJAht0otM/DnN0nU5GpJU26YAqLO8CCnK5dXUTP1g2C4r+fbROGjiH9Pruuf5aBs/4ABG4UBE16C6LwStdbCD3trWdKSoLWIs/718+dv2XrWFuKYRAwTz3zXvUaXOEoymgSZ96jpByHA8A13iQP5Ed4LZps4w+WhcIW9D924weVFFVEGznIaDimY9lyfh/eu8yEvVYT7u+GyQ+lufTDiSDfOeGppDoFrxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5196.eurprd03.prod.outlook.com (2603:10a6:101:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 09:37:12 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 09:37:12 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlAACrWCAAAAQERAAARHbIAAEC6+AAC2xMaA=
Date: Wed, 2 Dec 2020 09:37:12 +0000
Message-ID: <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
In-Reply-To: <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 301d8090-3503-4894-bf5a-08d896a5d8d5
x-ms-traffictypediagnostic: PR2PR03MB5196:
x-microsoft-antispam-prvs: <PR2PR03MB51961F3E1C612B9761E4EA4EB6F30@PR2PR03MB5196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N3iWE6551e4WbNV0cIOxXWshyashhAfY9Q5WCbRHPV+c6iINpYCsLN0s78gTP3bDQqTIUfiQBg8LZTlMtwX4cWZxHwsT3Ri92/nyEMoH05NHMCwuShScvt9CeXIwiHaomDyxOBvRUJNsOeoDwTrw9VgQDpM+f+nTI/p491XTpGg/94nCnbXm9rK+3eVAJENRhh+qDLeSr1I6Tx6Qzfu4yoctkgHcKZqeBOOdhLvqkWoS975UU8k63SHaUfy0FFvzDP2gVj/uCnBgOenx3M1ClIeEkxViLBvYgLiKoJBbkYvUKrbzc5vUUsjVxt7wU63zqX1sV74gfZBeK+pk+dC0xtKek4ecuk/CdzAeoTNAPXdvqmecJ9BUpCfEqrsbqHNdA1wkcibSge15CAZCMSDPZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(396003)(366004)(376002)(9686003)(966005)(7696005)(66946007)(66446008)(76116006)(66556008)(66476007)(478600001)(52536014)(64756008)(45080400002)(5660300002)(83380400001)(53546011)(6506007)(186003)(26005)(55016002)(33656002)(8936002)(8676002)(110136005)(71200400001)(316002)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TUFpamFEdlRHWTFYR0VTOGloZG5QVFdEOGdwQWZaVWFWWWJ0dkc3eTB3SXpT?=
 =?utf-8?B?V2NoUTNNY1FmOVhRUXc0M0R2N0szNXp3N2svVytWUFFqSldwMlduMko4d0lU?=
 =?utf-8?B?SVdGK0cvT2pFa1FpOG9JcWI1SUVxWDVTU2NYWm0wc3hUbEFKb3Z4eXhkQzYz?=
 =?utf-8?B?ZmJEenZreEFSOXFpbUpCS2lZY0MrNm5mQ242dUJJeW10THpHaWw3cWNZL2NG?=
 =?utf-8?B?eTRtY3B5L3pDYlNHRVZxQ0toamF0WkVhVXAvZ1hXZTdxTmZBQ0o2VFVrRWtW?=
 =?utf-8?B?blE1UmlPcldRUmFNbXhpb01ORHA5dHBsTEtwUzliRFRWOXo2Q2psYlp5d1ZE?=
 =?utf-8?B?bWNSd3ZiUzdWM2VwQ2YxT08zTXBZaVVGS2c0cU5uaWhObzdxWjh2ek5mYWto?=
 =?utf-8?B?c05HMnRYZ0pSS2RiZUZMeTU5Z0xjN0lVMUsvNkd5bFFmdkE3MFVaNy9NNEFq?=
 =?utf-8?B?UU5tL1FoV28zbUUwUVB1K0diNVp5TC9nOFJlYXF5bmVtdmVCOE83ZUdHTFJr?=
 =?utf-8?B?cGsvUWVZU1pXcjZkVVFHMURWZnpLS1doeXpBYndGbnZFZmJ6ZVYxcGN4RTNR?=
 =?utf-8?B?bGdib1huY3RUVVVsMFBrKy9rT29VcktaOTlsVyswMWx3TUtUS3JoM0N0Z01k?=
 =?utf-8?B?RFQxZUZIL3cvZENudjhuTFNvckZBSmpQZTNLY2lXa1IwRFNOQzg2ekMvdVRR?=
 =?utf-8?B?Ly9mMFVmSDAxY0NPUi9HV1gzc0NjOUVsWjBzZm5mWFFyU2R5ZURSNVZ6dHYw?=
 =?utf-8?B?UDdscDJvUmpOTGkra1RmWkU5SGFQSnR5MWZzK3NLUkE1N0R5NkYzU3JIOXc5?=
 =?utf-8?B?RzlyK0t4VmFPZzR1Q3hodWNXNG1naWllenpmS0pqRnRYVDlyNDdJWEVWajBP?=
 =?utf-8?B?QTI3SlJwbkZBSjJtbHJFL0hzeUN2and1dk9EZ0h0M1JwWWMyejlkelo3dGYv?=
 =?utf-8?B?aGNhRzJJUHMvVnRFN2RUTDZyMVZJQ0tKMCtsMkNuY2J3eEtic0oxWi9BNVB5?=
 =?utf-8?B?OUluOTBzZEJWVS9yUTJVUG9Zc1Q2dU9nVlI2THVmQ3lRdHEyN2tTWk9mNHd0?=
 =?utf-8?B?TFM5YmhORWNUT2ZTQmZNSEN6ODFuUFBMbHZTcHpIbWw5SVdIZ1hFL2RNSFp6?=
 =?utf-8?B?cy80YVhpZmZ5MmVqSFI5TlJpUk9HZUl3UFZBNTVHRlR2WFBPL0p6Z2krdWYv?=
 =?utf-8?B?WHQrYmI2QzA3TnkyV1AzZFArUk53cEFpakxPOE42L1VSS2xETHNrNzBIUEx3?=
 =?utf-8?B?WCt3dDBORHRBbnpreDdVZ1ZvTnN5bFMwQVNxY1BiZ3lSSXlhWnViQTRTY3pC?=
 =?utf-8?Q?uLFZTfQY+6k6s=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301d8090-3503-4894-bf5a-08d896a5d8d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 09:37:12.3098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jAtz1j4FSX2w5GcSLivzveej6tPvDZzhjcas12a7rzxl6jRUUatAb24smFtCXvCZMbK7n93Zpv4jcbxECtZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5196
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=ykp2HzW0;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.9.132 as permitted sender)
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

Well, I've been checking the related components. My env is being deployed into Qemu, using the same commands exposed on the Jailhouse Github docs:

qemu-system-x86_64 -machine q35,kernel_irqchip=split -m 2G -enable-kvm \
    -smp 6 -device intel-iommu,intremap=on,x-buggy-eim=on \
    -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
    -serial stdio -serial vc \
    -netdev user,id=net0,hostfwd=tcp::5555-:22 -device e1000,netdev=net0 \
    -device intel-hda,addr=1b.0 -device hda-duplex \
    -kernel vmlinuz -append "root=/dev/sda intel_iommu=off memmap=0x5200000\$0x3a000000 vga=0x305 console=ttyS0" \
    -initrd initrd.cpio.gz \
    -display none \
    -parallel none \
    -serial tcp:127.0.0.1:1234,server,nowait

The Qemu env is inside a Docker container which is being run in --privileged mode to share the kernel with the host:

docker run -it --privileged --net=host --volume ~/docker_tmp:/tmp selene-qemu:1.0

The mentioned host is a VMWare Ubuntu VM which has KVM enabled with nesting=1 parameter:

$ sudo modprobe kvm_intel nested=1

 and all the virtualization configs are active in the VMWare config panel:

Virtualize Intel VT -x/EPT or AMD-V/RVI yes
Virtualize CPU performance counters yes
Virtualize IOMMU yes

Any other thing I should check? Any change that must be done in the outermost Windows host?

Thx for the help,

-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com> 
Enviado el: martes, 1 de diciembre de 2020 12:32
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.


On 01.12.20 10:36, Sainz Markel wrote:
> After compiling with the suggested flag, the output of the enable command adds another line:
>
> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
>
> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 1 Code 
> location: 0xfffffffff0000050 Using x2APIC
> /home/msainz/Projects/jailhouse/hypervisor/arch/x86/vmx.c:238: 
> returning error -EIO
> JAILHOUSE_ENABLE: Input/output error

That means your host is missing some essential VMX (VT-x) features. Then it's either a 10 years old machine, or you are running in a VM, and nesting does not provide sufficient emulation (KVM would).

Jan

>
>
> -----Mensaje original-----
> De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> En 
> nombre de Sainz Markel Enviado el: martes, 1 de diciembre de 2020 
> 10:07
> Para: Jan Kiszka <jan.kiszka@siemens.com>; 
> jailhouse-dev@googlegroups.com
> Asunto: RE: JAILHOUSE_ENABLE: Input/output error
>
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> I did not. I'm running this on a busybox based Linux. No Python installation possible. I'm going to check the mentioned docs, any other output I could upload for you, not dependant on Python?
>
> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: martes, 1 de 
> diciembre de 2020 10:04
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: JAILHOUSE_ENABLE: Input/output error
>
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On 01.12.20 08:48, Sainz Markel wrote:
>> Hi there,
>>
>> After being able to resolve the cmdline issue, the following error 
>> comes up when trying to enable the cell:
>>
>> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
>>
>> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5 Code
>> location: 0xfffffffff0000050 Using x2APIC
>> JAILHOUSE_ENABLE: Input/output error
>>
>
> Did your target pass "jailhouse hardware check"? If so, enable CONFIG_TRACE_ERROR (see Documentation/hypervisor-configuration.md) to get the origin of this.
>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit 
> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgrou
> ps.google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FPA4PR03MB718436DFE4DECCCDA
> 1A7DEBAB6F40%2540PA4PR03MB7184.eurprd03.prod.outlook.com&amp;data=04%7
> C01%7CMsainz%40ikerlan.es%7Cdb91af85d2bf409dd8f508d895ecb1a7%7C910ac81
> 5f8554a08bf2990b46552cf11%7C0%7C0%7C637424191133061092%7CUnknown%7CTWF
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M
> n0%3D%7C1000&amp;sdata=uYKKJ79wPc0OuxH2Q8KpmCvguFYDDyoLPOYbx5kuqg8%3D&
> amp;reserved=0
>


--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB71849EE161653DBBA71FA26AB6F30%40PA4PR03MB7184.eurprd03.prod.outlook.com.
