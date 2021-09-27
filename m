Return-Path: <jailhouse-dev+bncBDGILGE54ELBBYPMYWFAMGQE4QYP2AA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A4419027
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 09:44:34 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4sf13579991wrt.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 00:44:34 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632728674; cv=pass;
        d=google.com; s=arc-20160816;
        b=0e8/d+IR9hojNvlBvXItvIHZ3fJ12Hnj2FuIHLaTDpH1wnb9PJCXcE0yYumgSfq5+A
         63hVsc2xuP+QxzhzF7IjR4FDnc+aH2p4S+z2tiifK4ByQPMJDKvpk0oCqpoEw3/foPdZ
         71JG5KyWEFWcRRX6uJyARtXH8VPpDGf2EHKj9MHnxi5ynMz1o2A8c8NEl5141JrKvP05
         OOgbs/6pZ04g87KQmabThwJsbOKX0Q78eh6T7wkjNNo3WzZyd0hEA+JEp6rHUZvJhRr2
         jlvT0fmrxnVrZrtn5OauwCP2rduKbPGXxQh53nJcUKJGS8BWQnsQf4GYO9eVKsF+zboc
         n8zQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=ZY8Eo34vqqfF96S7xVvf60w9vKR3GDr9YNptweioyBo=;
        b=hD8HVsTXGfrr5/fRBXdHBdyQNzzlgdlrnkg/Sq/oSGYwc23RZL8GfTs6QBbRNZj6K2
         nQ4MLFEDpn2bkhV+LyEtVOrNvFusK96KqSoIWhutR4jaNqEXHpKaGQYjBf8ugXlGmKul
         97ktUoGO0jnioh+o5Jp4XiJRN597xN7YDW4rhMsjEOQapFSwGaE2OophLvtXd/i4bN9F
         KMnwxcM8Tw7UOUdnaZkwwnwWzO/fzzN7YmyfCHB1iamW/hoJdKoP0fkiz6flnIuAGTZt
         YFjv0AKBWAa6W/KjxpfZKXIUPPzw3HrHosw2Cgr38SMSyfdybrayh9OKgPXYXIshGKko
         jV3g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=b1WySdET;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.104 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZY8Eo34vqqfF96S7xVvf60w9vKR3GDr9YNptweioyBo=;
        b=LPoIoifclceUsdE9MmNZPWYrCyy1Ve2CP3D1s29UFPAcafh22KveJEKggq2kTFEbNV
         SofATC65/ujV+QkRngZbDlf9IhKz+g3SpB/nQxUqLlH+BVSaKG39TAZupp7NjH6MO9kE
         QOMMY/qilwVqaI3rtShw3INxYP9KARCmJz2b16IeEcJsFHY83WAYmN+9P+3jcLD4arOU
         /dyXKAraAnSxwrEHRhsmQcpSbhcUWoahIVf+BqpJqCn8ie0Rat/GHVW/xIHOApD8z2pl
         iiYOMDEsE5HIDKoxWw0e2iumf1nwGCqZVQ7K/i4T/f81EMFNmIk9V8h1QIe4j2gsO/ph
         v8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZY8Eo34vqqfF96S7xVvf60w9vKR3GDr9YNptweioyBo=;
        b=pJIVTgyLOvQMj7/mkUd7sN4qgVTWmRgNDICHO4drex22pqTX3UfChuv2K9tR6pI3GR
         FJk7HmuL70njthXIqQoWfxbUm7MOudrEsNnXM9fCJfdb6qXSOoTWbZrmnblI1aT0IYDy
         +C3dwc8+C5EoSO6lCeNXeJfRRTqxuGulmNJBmLvUUhHLcwF6bFtgwqn1cGkXI/AR+nD9
         jwBdZAxyOPY6WfxL7PaHFog6/C1gkeJxDK+2RWMr6y5Ch4Skn9tRA9DJG+W4VZhLwMIo
         BmEIBZIPsEeG+UERxT/UgHcliqFBxhnAvzot0RDui75ush8ovxc/8TF5G82utiz2dp74
         RO4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dp7Rysddo5CNJSOMK/90ldpcg4QQDL7EiMMGyaT5pDe4JJ2/Q
	vYo//2w3q2eYyef+wZAWX6I=
X-Google-Smtp-Source: ABdhPJxBDbh2f5sXY63le/LtDNzncmPcNgSLwugL2N/OG9YwJo4stzkbCkYTYbD2oM1WTYdRH2MEag==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr13830297wmq.159.1632728674430;
        Mon, 27 Sep 2021 00:44:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a285:: with SMTP id s5ls4355106wra.1.gmail; Mon, 27 Sep
 2021 00:44:33 -0700 (PDT)
X-Received: by 2002:a5d:504e:: with SMTP id h14mr26875692wrt.48.1632728673206;
        Mon, 27 Sep 2021 00:44:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632728673; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tx1+DxuTKm+kgh4s3MCNwTQyDIZBFqO4KUWo5hrORr2o7xidePOvoE9VfewhqtMSBT
         QfL4vubYD9BlOsnX6F1U/AH07eFxy5CiLzHTjyv0wLfHXGPW6aHLE3ybRtBgX1Wh0/iq
         I90egA/UiOOQ1fX/YAh4haHn2Ko3Q0OffRfen3fqyyadZTDARTfA9mY0LPXTK0YFJf2H
         E2oS+HvNi0/sqPbDnPSiKrNP6/OIXuPgMsRCpQbG/FTx5U+4hPnWwevAUh5vXfnkKAFy
         2O2D313BU7l7q6ipQxOw+jmkFcfxHX/Gr1+DQ8UuxzGvs3cmH5GaGJ+e6EH2G7kRUwN4
         MIQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=RfWNJFRo/XnGj9dZy+mZougyBKt4t2fAb+Bi8T0+T2o=;
        b=QpejBVLoqDSHbxnKD+v75bW6w9imWqS/9g9MQko7lm2sG44sCJq3qrtR3C56EpJjXu
         suF3yeBMxWom/1zAdPY2KJKx2Hfi5gfMoAZzvIQ2B5r7NKVJGg8hgenTvWSJ3O/UDJgA
         80/Z3KgrlHJJm+rSMOyBvPkC8Xeq5CjEmTyiaKXpmREX4fXNmwcACLtItQa6s3pLJbUN
         T2pF0jUo80ROfqViK75Mao1mDHwTzcDrRRww6FD++9+yH/k3MiS5T/QZpVksuIxp4AE1
         4VD8T+LHsV8AGWUSS40kOJumQ9YebJyyHrCYqR6jthiA619tn6eclcCbL/NiuKyKwTvu
         E+Sg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=b1WySdET;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.104 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150104.outbound.protection.outlook.com. [40.107.15.104])
        by gmr-mx.google.com with ESMTPS id 19si347329wma.1.2021.09.27.00.44.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Sep 2021 00:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.104 as permitted sender) client-ip=40.107.15.104;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhO//K01lpui0CD3TmV7KoFzr9/ygmc2laQ41LPqCTGQyZ8opowZa2mdD5vsIuuyPLv1KXjKu0p1W0TcXY3V3Pkq4fS5cIdf+IcWqdHTTzfZP2FMvw0qpzVPQMC+6A69Z6BCgSKI2/o4HGTM5FVGnb8vPfuJshmqcLNS2WmF7AlGk0x5PykRnG6RUsVDSo49tmSeRrYHSiagGSmGIURzuZYB3497anhL+9fdmnbxkKzEALH2BZfSyIIND1W4oqipnDg4JZIgyX0/z1/vlu3E0Ow7xxFx2FiFLNbPpxxf6QiuR9A9I3BiIWcInBkMPv6EXmosnnyFc7NaK+OeZVzIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RfWNJFRo/XnGj9dZy+mZougyBKt4t2fAb+Bi8T0+T2o=;
 b=GQq/4qh8pi08ibYrl2suEKt7nBkW7AHN/1z5mX6FEwdTfarvz91RcCxUPDr1zShk9RfAg+9iVg1xhdBRJbXnDV2xpVulbu3q3Cv4sodm6bLZs9eA9a42XWNeKJHEDL55f1Zp2fj24+LrdKKjXy/x0/iVUcTqhYaLzuqFL3h5M0FiQDEYWM2gW7GBcqXX+C13fQ50Jvd4A6oG3PBb8RCSLbeCpgViFTIwxmldGB1STJKwxfvWsf6wXMe1RnIHHDM2jxoiYYLRrg1BtcP3ij2LyzoGVfuSfhttFEbSsZ6yke9Td4HkUP06uoKZU9+5/MQ8FvAVZj7Ve9CjQkUA4hu6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB5317.eurprd02.prod.outlook.com (2603:10a6:20b:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 07:44:32 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:44:32 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: =?utf-8?B?6buE5a626am5?= <huangjiajun145041@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: Crash when creating root cell in x86 -----FATAL: Invalid PIO
 read, port: 5658 size: 4
Thread-Topic: Crash when creating root cell in x86 -----FATAL: Invalid PIO
 read, port: 5658 size: 4
Thread-Index: AQHXsob2wEn+XHosI0Kv0I69aqWsbqu3f+dw
Date: Mon, 27 Sep 2021 07:44:32 +0000
Message-ID: <AS8PR02MB66633DD8003EB0A9403A3ED3B6A79@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <2387af87-2391-4dff-b826-831ffac4d536n@googlegroups.com>
In-Reply-To: <2387af87-2391-4dff-b826-831ffac4d536n@googlegroups.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 439343a2-4490-4594-b616-08d9818aa4ef
x-ms-traffictypediagnostic: AM6PR02MB5317:
x-microsoft-antispam-prvs: <AM6PR02MB531710694E7CE37408B46862B6A79@AM6PR02MB5317.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jMp4YxmX4Be3giHyv70c6rkAD3Qx/Mnr7SffzjErZ7qg2Iw0rroQ2+XM/BD8zb7Bvfdlf6m65bp7I2bXoxHjr2MxmLb3IJLRFpzOwqJjWoI+6nOF8g89HSZ13aaI/zoRK8+NUymYS3UBkD0btJEm5F16XnrfF9x/eW7cfHNHJUyDTqKKuOKu6hnEE2k6NX9YTTb0X0a24Pkr+Ue1jBqC4wu3RCVCH+po2+njy7Sya0A112P5JpRMRWUUSumZPSaYlDA7T/jv8IDxwwYUbwLm586zBg0QCbG/BFFk7cWPJlBOuo5puTZvUxb7luW99tkJBmXRjTaHKjRkPVdWQVqJaYdyy2Jp3WmRJCaYS1Y66O4/GfR9N+LTp960z5PXP0yK0aSJbTEnUrazwJeunhHoPKPZrDlTKK9Bbrjfp3d5MdOJ0KpNdYpUXmNuPGJzpa7oveuMiJtFrsE0POrrRd8SOrxDe2/mQLgrxjB8QMQbzpfove9tozKTWjbxa2bX+gNGbm5oat+0lrTeWk+uKY4iS9zFRUn4CDEEV/k3MJYNkZnhVoBr9bUgXOPDcPEEXciI8GWImQ+fFhL6DlMaQAgkDonj8uNudrcIArdjgk9szPGQCz+EyS2B8AHKr0Vw/V1egN/yL4wlrSaxCdaVFo456DDjdcxQl3YzcKZvJhAxS+2Bnv7Q7DtrrAiWWjWG5vzCps1viatbcwzxZ75TxI0RQTua/B+di1/oCgLiPESQP3SsjzjYiNjZt+6z+Lyh5DNwTgy/shzWpbLZIXMJ8k1fiDEeJWRK+7pTNiRPfjMm+VLgoO3OybYMs/4V+IVjN8Y5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(33656002)(7696005)(316002)(2906002)(66446008)(64756008)(44832011)(8676002)(71200400001)(66556008)(66476007)(186003)(83380400001)(26005)(86362001)(9686003)(6506007)(110136005)(66946007)(8936002)(508600001)(122000001)(38070700005)(52536014)(4744005)(5660300002)(76116006)(55016002)(38100700002)(215253001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a014YUNET0oydWFZd0NLdVZiQisrUURPVkRPMUFQeGNMN20rS3lPUWpiMlg1?=
 =?utf-8?B?VFBVQ21rbitSTGZkWHAzWU82RTkyMlczajRmazAwaE94bzZFanR6YkoybzdD?=
 =?utf-8?B?U2RJTzkrcHpadlZXRHM4TklPaXBHaWxPMkJ4MU9WclZDb0JZMGxIallOV2lV?=
 =?utf-8?B?Ri9qOUc0TWloRmZ5NmRXakprdk9nUUV2dnBvYm13MTNvcVRUeDFtSVVtVEw3?=
 =?utf-8?B?LzV3UTVGcUhPYVAvSGcyNURqbERJKzBaZXFpYUdsU29WeVQ2WmlZRnFaZlps?=
 =?utf-8?B?bjVVOGY0ZEF4VGdFU3pIdUM2dVREY21HbnB0aVM5SExwTTBZMDMvblZ3SHNa?=
 =?utf-8?B?bVg3RkFKN05mZlRDZnVWWDRNaUwwZG5NMVZjMTBwUC8yc0U1RDJ2NGRYeUpC?=
 =?utf-8?B?REhna0JnbS9xMjBMUjdOOFhzUUZsSDNBZDRpbVJHQm00bWNhczBnNi80OUV1?=
 =?utf-8?B?QmtnclNXN0tQR25BZ3RmakdPTHR5eTBGNW1jcmpQWVByZE13VHZnZ0ZoMWUr?=
 =?utf-8?B?N3dGVjR5YW9jM1N6L0JMS1E1V1FOVHdFRXc0L1FOTGUyd2JZMFJZdy9ZNEtB?=
 =?utf-8?B?c1lwU0pUd2s5K01sek9vTzBmTWJiTEtpcXBPTGpYNGh6RjZWdW9xT1QxQXVC?=
 =?utf-8?B?RzFqMUNXZHhiK05kK0wxcFpTbTJzaEJZbXdhdWlwV1lMYVY3QlRoMUVwdCtK?=
 =?utf-8?B?L05UOTJZS29FbDRZSUx1amtwS3Z6THJNVVF2ZWtvbks3MEo1bi80dVRXcjY5?=
 =?utf-8?B?NDFkK2wvU29jVk9oZmkvN1NZUmEzaDM5UVlaajFZd1lSTHJKM25YS0xSU0pR?=
 =?utf-8?B?NFlQeGtkWWd6VUZPUmNhUnk2dEZsVkNUeEJ6TW5ubGZZVU5Zb05mbHpXR0gz?=
 =?utf-8?B?QWRHSVVhOTdKY05mQ3J5RzdqZmo4VEo5OUdRYnB2ajdVemNTcEpWRGVnRUNw?=
 =?utf-8?B?ODNBMDFpdGFmbzF0TU5YdkM2SUFrQklLTWJNMk9lcnRlOS9WRkN4SDU3d3g4?=
 =?utf-8?B?QnJoWUVLMDYvVDNCN0ZVWFA2L3pFdS90SjVNUm03VVNLSWxKd3FjUWFTdi95?=
 =?utf-8?B?TEZCZWVwUkVMWDdWNkhZWG5tejdCdGJVbEovaW93RVdaVnYvOHNickkzMG5X?=
 =?utf-8?B?VWtUWi9zbG4walhJVGhFN09sUWM2QkFOTXJZY1o4ZjlGRTFRUFBkZVU1K0RC?=
 =?utf-8?B?VVBFMEhFY1J3N09INndPM3gxaWJXbmh5TTZmY0ZNZG1aQzlGUnBYQmVhRTVx?=
 =?utf-8?B?NGgzVTdsTzhaZGZYRnRaaStESHBDcEVIRlQ2azhUZldQME44THhZdEhuTzVm?=
 =?utf-8?B?ZXZrcldiVEVESnZDdjg0VGtTbUFUV0hkKzNKSzJZMDdGbnJvZnNDRGlnYUVi?=
 =?utf-8?B?R29selppSVFyU0FWUnhoSWtRb1Zmd1d1a2pDazB4SUR2d1N1L3JybXhRWGhB?=
 =?utf-8?B?ZlhiaFV2bnBQd3U1c2JsM3FPQ3ZTRUUrRUhHemhIdnZLQkI2U2hKcVFxU0JB?=
 =?utf-8?B?V0RDNkRhcncrWDE0ME5GNWxjVXdCOThKSnc5Qkd0ZHo3WG5vdGk1M2dwWkxY?=
 =?utf-8?B?Sno0aFBNMHMvY2lpTGNDTDVRRG9nV2JhR05vM21GbER0cXBBRnZtckw2Y0th?=
 =?utf-8?B?OEpVVjhYQXYwdXEzOTFZSWp2M3JmQ1BDdG9va0RqNTJEQVZWQVoyNlNBRFRI?=
 =?utf-8?B?U2NOUGNEWXdaOHFVcCtoc3ZHemMxN1VxSFh3SzE1V3NpRjVZanRpMGY1ZElJ?=
 =?utf-8?Q?NA01Lw3S71NTtXeWPU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439343a2-4490-4594-b616-08d9818aa4ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 07:44:32.1283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5AfTHhA4u7BTIA1KIfiE/o6UYce5PKMBPpcDLaLerLAtv9KLmPrbjGzgZuiSMrUf1QT2jVSoJLeYTROdB6g3Y6v1ZKCtE1UsBcSUbRvbuV7Ya7sMBEvj6k5l4ekdAKaIbvq9F5ozLYkrrbe+Uqlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5317
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=b1WySdET;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.15.104 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

> Hi,=20
> When I tried to execute jailhouse enable sysconfig.cell on x86 platform, =
the machine crashed later. This happens in QEMU as well. So I dumped the lo=
gs in QEMU and found that there was an error when jailhouse accessed port 5=
658 through PIO. Attached is the detailed log information. By the way, my C=
PU is i5-9600K.

Hi,=20

For debugging, please add your sysconfig.c as well. I expect the error can =
be=20
Fixed by enabling access to PIO range in the corresponding array in=20
sysconfig.c.

More on this can be found here,
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf

Jan's talk can be found online as well, if you rather listen to it.=20

Good luck, Bram

>=20
> thanks=EF=BC=8C
>  Jiajun

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AS8PR02MB66633DD8003EB0A9403A3ED3B6A79%40AS8PR02MB6663.eurprd=
02.prod.outlook.com.
