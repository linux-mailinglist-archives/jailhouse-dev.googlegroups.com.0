Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBU7OYL7AKGQES67P35Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABF2D413B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Dec 2020 12:39:00 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id n10sf2091366ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 03:39:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607513939; cv=pass;
        d=google.com; s=arc-20160816;
        b=B80KT+MQ0ldUcsgZP+tOGC+JbrvVgs7CM9H54Ap6IGsduHvRaz28r/0/4kO7iFxx2+
         mkMdUWeFwUohEN574o+PrSg3/Ef+Bhb/Q66XSFAnZZcakJYVRNVdOInQymDdZvwYeC+M
         gtR/hsF6sNDmR9KPU0FkU47Vh+LASMlvQHrRwMbvWgSZO478zIQc75mD/eNdAd2573BJ
         ty2tHxo/vt8Hc+o/QRy+mpKlXKufowgMSY8KB7Trya+4NtpsmwO6jMvLoiluCKiB+/1I
         pfBX3Z5pMLCrEigatekjpDIIdgzgKqO6cIi9FoGqAS2FMPlX9pKyq9Uz5nDarGyL+LNG
         GwTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Z22pGqeudVJtMxmoVC7ILTOI2PUKzEByBCasNK/V8oQ=;
        b=Z+IKWRTsQbSjwFmATuEeCVCtzTSljnsGXrzuaBTLA5xhVZgwF5AblWP015/KNfBFV2
         NU0JpP9kEzSf9zFhqsLNRCyPbCWf9s3OUjhlIZKWJmB2croMV1IsN9mzTRwQ4vZ1Emcl
         VjMc1D/qd/rGrMHnwRBVasfeuRE12eU/FfHPcaYRPLKPxOOj6yaaPSOFoEaEONgv0DFc
         czAfh4x0CrfwgFIkTiERMZzM/r/UDhKIncoyGHqP73pmU5FaxFvcMxoW7XWTudWJLkLW
         NWoUiF7TxtEZQbHDb7S68uD9BGhwqpVqp8ECCKSmRG9VVuVNPub/jCq3Rbqoui+jwQ4B
         3/qA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=byC7ogUD;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.117 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z22pGqeudVJtMxmoVC7ILTOI2PUKzEByBCasNK/V8oQ=;
        b=csIGJkJh7zjPzSf5bK6a5q/hljtGUJZIW9zpY7IyVPlqK74j1KYpFtZ6lEdDZCpqaP
         inuGvRUVoD5iE70vXlC/rBCAMwVirHSiZVj3HRpQhvn9Z6+4oZhOvx1K4B4nhIOmg8U6
         vsvVop+ly55D5t2I343rh8VfF0ppN+L4Ncf2WcY2CnTJ/HDPKDEXtpaApQ/E+JPR2Wf1
         X+ebaEbJeZhBh3KInXJOZHPJ420tXgRLkZsEadw0ZHOxCHyeZj6RPvMVIT19gJ9M4231
         plXaXLLrfQMZFQ5thdgwFK2kiJMt4gxMPf1Bb1RB7Lp3W27SYTOWuqjLv9rSMQ+8uxbk
         Uc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z22pGqeudVJtMxmoVC7ILTOI2PUKzEByBCasNK/V8oQ=;
        b=brjuk63PCsXQAW6dxy7s8jgWnHtDerRzgQ2Svty9xdkbVLxOoO8l2zxnJPFgh89LEf
         XbTM3kvJ41B3mDoN9xFYYHKJnGLbUAiVUwpd961Nh8+QGh3bT9/e/E/8ZPGN3BrhcRL8
         sTYWnn4bDdWQwGipClMJPNpb+YaRPtD/eZMRKjbIwOyu4d4dntT9CWGprXPEHmVydgjo
         eM35sRHfGGBfbEKItUwIJz48dsf5iQLuQRpBihyXCmO/emLnhgyUOHOyP/idnGIg/SAT
         Acgt09OZ+E56g40ONb5jZIIJ/+qUvRMURUZ9BLK+1PEGqqdPTDTuE/5Uew4rnf7BRnVC
         pdzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nR6YEISOiLMuT02XSWPKup2Wov87r/xP+I/+RMWBpP8nW5QD1
	mRQjWewFp84Y8IENecjdB84=
X-Google-Smtp-Source: ABdhPJxl2rnGkHaEfShhQKSU6k3c9XfYcApZsbV50eM2huK/K6FJZLBTSMtkBsivaLx0KR3EUbLoSQ==
X-Received: by 2002:a19:c001:: with SMTP id q1mr277210lff.55.1607513939573;
        Wed, 09 Dec 2020 03:38:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5816:: with SMTP id m22ls263094ljb.4.gmail; Wed, 09 Dec
 2020 03:38:58 -0800 (PST)
X-Received: by 2002:a2e:961a:: with SMTP id v26mr964167ljh.314.1607513938450;
        Wed, 09 Dec 2020 03:38:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607513938; cv=pass;
        d=google.com; s=arc-20160816;
        b=YYR4bsVYODXQYjvRHXvxjaic9CYS6OcEsOtkoxioAB+AmGFt6hY4hJbuW56GemSkX/
         Aut55G/9SLeY8Bhfe1sbdtqZWYYYPTGIhZNFVNr3F/7/dqwA7Cw5rtePH7n462NNuuqK
         u/0Y3K/wa1uDhBJYoYgcjPeb9Pd0eZ+Z6w8Y/TBG1T623RlSF/MriDkFVJdHf31O5Wc9
         fiMALRN+18b2JEG37kO7yWwChL2u2hD8MrggXKHFYHi+apBrc+5TJbLUR8Yy3alFOPmO
         NCMW1Pzxfs1M88Fnvnc3a9GtN3P2jLfWB0nsUXWFouG9GTpxk0W1RznQ9ZM0x24opF9Y
         ZffA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=I+hkZw/Ax99mGVXVIZAN3MNQ+idDbtAzghwwd2cnEYg=;
        b=LEnoEnrg0+FX0fDh9K+WqNQCz0V0voH9XJinSVtE+ONgmBnRJT32m1/Luo8WpqeAPp
         6164x2n+hYDh/+Wqg5rI9ckiQJXoBqhXZQJkk1rrT5sRPl2L0AXnnT4lFHDbG7m6RxNa
         fse+lcB4aVOF+lEPbmvJC1x8/KnpoJMquLTivyXiPtPpuMo1bfUviiqaWLFYCB0NfDl0
         lusFpt/fm4UMmFCv7BMovTCrWIwZAze+JtxSHFYuWJ6InM3B2S3lUDsOn38Ozeg40uZz
         Yca7yoSfjrdjZF06vqE3n3Alf0FE+fBACCzf3ex6zKWPczYYnPx0KRBArvrMbwdnZpmm
         ECMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=byC7ogUD;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.117 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120117.outbound.protection.outlook.com. [40.107.12.117])
        by gmr-mx.google.com with ESMTPS id h21si63066ljj.6.2020.12.09.03.38.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 03:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.117 as permitted sender) client-ip=40.107.12.117;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RneR2zPFCLuG4LwLoX5cqwkO6n9S+j8kFV0FOeruzN3JtkdI9fWb4is+lYRBCosy8lPSe6cYMutDgh7Z5p+BuNM/g5pEOUzzDbOKRx0LNVFIGZlvHAPjgERbRLGBjQQVGDmG/yx3X2HhtT5mbA+GUACD1lJDkCad0JkZhOmJ8Yxv4TmQgvld7Thsol6HHaJ5frYWjBTQQ5XY6ceXRm6zGPzignECrJezjCC9kv1ghLnw0NrXGUPVgYVU/uukxkkgrzSfhpNx/GKgXPJy8GuMimTvsELCi1aQL/jAHRIHr1ci7CDeLtLgEEe7+GzbqjL5fCWyVcz6bMVbF4HmhKJsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+hkZw/Ax99mGVXVIZAN3MNQ+idDbtAzghwwd2cnEYg=;
 b=a8PhTSGBzynnefZ9/cPEpxMPClV4vCtCOQQ5vEpZ9pcgk2qAy6DopIEV1phXf1+edrgAycL/1kEon0WJnSskTfuABZtrEU+oD2CsFmdfoMBuXjm1lPHse4aJw5XltsY1zfD/Gwv3mAkbYlsptns5VLk96LLJsxwEUk91HcFZqriPzM3MfnoCGB69vkKUajPli1IJOY6wKdAzl2qekEnXiYe/RYhOeClgG/m17f9xncuKQ0Hkl1zJ4Biy3pHgDKjniB5tC/I59V+6wQwW3qVnOb1kT8eRpGGozHb7FMzwVyxd7TuOj6wp/YHlerNQVqHoGPt+S1mb7x/eGMC2WjqDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5417.eurprd03.prod.outlook.com (2603:10a6:101:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Wed, 9 Dec
 2020 11:38:56 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:38:54 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse hardware check error
Thread-Topic: jailhouse hardware check error
Thread-Index: AdbOEISuarlPAbS2SqyLZ0yti5cZUwADoIHAAAAoQEA=
Date: Wed, 9 Dec 2020 11:38:54 +0000
Message-ID: <PA4PR03MB7184376461BFBC6C144BC5AEB6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <AS8PR02MB6663FA4A6DB7D661F5AB68A2B6CC0@AS8PR02MB6663.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB6663FA4A6DB7D661F5AB68A2B6CC0@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b69628c0-5955-45b2-b856-08d89c370248
x-ms-traffictypediagnostic: PR2PR03MB5417:
x-microsoft-antispam-prvs: <PR2PR03MB541759545FAF8D4148AD32FBB6CC0@PR2PR03MB5417.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yy9dEoA60LtYmQiL8hCg7cS5PCbvNV2ay8kXaeQ76joQR1EJA452+rddIZDQLHG/UqLLg5jdO6zyAYYHPnzHqYyM51PMoEy7B7Iq2VGtzETwJiolb0OKG1rb79SjX6xk3wNv9u+t6kWuf0UscjDCrIUF/wyfSShJe7uVUm4f+eFoJTlJ4XRCum4PFvRZhnU+JMVPeztP3whnDRpR+odgaPUi5JrVQHunLL3FjUwQbucUBbRiMJA0pab6eFDy0NSbpqJXZ1jHZ61jZO7s81mtW91YUKY54xu9TB0RtexUKrXg6qBDyENXPThpo+dmwiu6jyDDIDu2xrHeQezN77Ubbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(66556008)(71200400001)(6506007)(186003)(66946007)(66476007)(66446008)(110136005)(76116006)(64756008)(5660300002)(9686003)(7696005)(55016002)(33656002)(3480700007)(26005)(508600001)(2906002)(52536014)(8936002)(8676002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?akQ4b1hIWnlaeWJnelVaWDVOYmQ2VmE1eFY2THl4b0NuSUprMmZsUmdaMFU4?=
 =?utf-8?B?dmlsMHluSTZmNEI1UmNURjVkRTE2aEdDZG5ZUFI0Sjc0QVJTOXJUWnlNMnlJ?=
 =?utf-8?B?eUlKaWtud0JoUmdsNzFDOWJydE5lZElUeHUzTFNFdXR6cVYweWhaWWhPOUIw?=
 =?utf-8?B?SWxUeEVuem0wdnhnQko0bmd1RmlQMTNXUzV0dzFOUUxkYWZXK2FTVXYwdUJL?=
 =?utf-8?B?V3NwdmtDaGNZQ1BTUUgzNG1uY0dpTVo0S2JJYzhRTk9TaDVjM0p6bkJiVnFr?=
 =?utf-8?B?TmpDMTZOOC9TQkIzWGxrUkdNQ1o3L3BiT3lKU0VPK3ViRnVIQzRJR2U1YjRR?=
 =?utf-8?B?V256c1dxREFlSTV0b01KRnRaeW5PM0xqdWpRaENhWUlCUkRSc0UrQ3pGTm8r?=
 =?utf-8?B?VXJSTzEreXJ0QVpKamxGdTJEK0w0L2lVRFVWaXQrakhFVkJZWU9QOGVTOUh0?=
 =?utf-8?B?c2ZCR1lFS3dKNVRwaFd4K3ZCWG9abmZjMGlQeUY5eDlKUURrbEt3NldGeFdj?=
 =?utf-8?B?ZUw4UHhVZmlyak5oQ2FNajhMSU1DWkZVN3g1S1A4U1pLeElEZlliQ2lGK1F3?=
 =?utf-8?B?ZUFETjIxSkYvaGpUcFRqVzF0YzRFdXBoVUg2YzEzUGU0ako4MHFOQVNWR1FX?=
 =?utf-8?B?eHFINS9CbytxTGIxT1Nzbll4eFNMUjFJZXkyaEFYVjd5N0tISStDMzNYVFBn?=
 =?utf-8?B?dGY1MXZmVnMxYW1Kbmk2SDJNMWh5eWF0YWZDaVBheUsxVFQ5MGdNSzI2RElk?=
 =?utf-8?B?eW4yR3I4ZVcvdUk5c05QazFZMEhOMEljNmhxeWtPdS9CZzVSbkxQZmUxMVlB?=
 =?utf-8?B?MktwTUdKdXQxVFBkSTVBUzllbkRDOWVuMGdrRW9MQUJoQW5pSklFQTlGUndR?=
 =?utf-8?B?bGd0WW9JK25JM3BHSjBZS0phUzZJY1djb2xKc0prdzVUY2c5a2FiN1BOT04w?=
 =?utf-8?B?ektyMWw4MTFhbkhzRjUvaXpEaVRkbGwwSngrU2hVRzdma29zc2JUWlhxRjBW?=
 =?utf-8?B?UWJnU2xCNGRBeTNrODZoNEtTOWQ4YTBTbjJhRzFCaTlraENoYmpqNjFMT29P?=
 =?utf-8?B?ZU1UamlUcUc0aUYxV2VmYWZEZldHMkRPUS9zaytsWkRHYUIxb3l6R0h2ODdE?=
 =?utf-8?B?T3loWnFKYjd2M2R4V01ycUlSVjlyMDQxRXpvQ3IvSGRFcFVMN25YSGhkUGxV?=
 =?utf-8?B?SEJtaW1lRFBMekZNVm9ocXpqSnpjL2hOUDBXclM5WGtlaXdpOWxGS1hKY0pn?=
 =?utf-8?B?RGVwbmVDaXpadjZCRDAveWpjbzRwMi9kOUViWUJIdFQyeCt3YVIwQzQyVnZy?=
 =?utf-8?Q?PrxXVP3LAVphA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69628c0-5955-45b2-b856-08d89c370248
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 11:38:54.7135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eO62wgI8Wb58UxlnqpYlSNCew5KGtpIspxUMfU7vHdcR4TZXFYuybaqsiNtOfdoP4wMnQ448cSouXH4Jlg5buQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5417
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=byC7ogUD;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.12.117 as permitted sender)
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

> After realizing the inconsistency on VT-x emulation in VMware and switchi=
ng to VBox, I get the following error in hardware check command:
>
> mjonian@mjonian-VirtualBox:~/Projects/jailhouse/tools$ sudo jailhouse har=
dware check
> Feature                         Availability
> ------------------------------  ------------------
> Number of CPUs > 1              ok
> Long mode                       ok
> Traceback (most recent call last):
>=C2=A0 File "./jailhouse-hardware-check", line 147, in <module>
>=C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioapi=
cs, dmar_regions)
>=C2=A0 File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_p=
arser.py", line 338, in parse_dmar
>=C2=A0=C2=A0=C2=A0 f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb'=
)
>=C2=A0 File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_p=
arser.py", line 90, in input_open
>=C2=A0=C2=A0=C2=A0 raise e
> IOError: [Errno 2] No such file or directory: '//sys/firmware/acpi/tables=
/DMAR'
>
> I=E2=80=99ve checked that VT-x is enabled in bios and I=E2=80=99ve run th=
e VM with the intel_iommu=3Doff kernel parameter. To get you out of doubt, =
I=E2=80=99ve installed Ubuntu v20.04 with kernel 5.4.77 natively in a machi=
ne and checked all the previous. The same result when trying to check the h=
ardware=E2=80=A6 Any ideas?
>
> Markel.

>>Does your CPU support VT-d?

>>Bram

They do in both cases. In the mentioned natively Ubuntu running laptop and =
in the one running VBox. And it is active in Bios.

Markel.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB7184376461BFBC6C144BC5AEB6CC0%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
