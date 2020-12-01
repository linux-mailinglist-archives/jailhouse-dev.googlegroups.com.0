Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBJM5TD7AKGQELMK24PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F762C9C97
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 10:36:37 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id o197sf729617lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 01:36:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606815397; cv=pass;
        d=google.com; s=arc-20160816;
        b=i5ALL2pC/1ZjeNygXIhPB0N6ABatmdRZcpdaVZ+Kre2t6XArD1lG0bZAYmyyVOxpZa
         /YQcmA+s574+nP4JHrx0HC+N7gu3oswHZruUVgLfvWtNlfoDhnEZGkccvai8s96kERM9
         6hc31yNfzYKOb9rMzSJS4+SNwJFj25uefw9p4NwAu1JPEgTQmN83vEYaHWtd9s4LdY+X
         yXgjQB8i+S93Km0yUhnm5VN1ERTh836iDTphWf+SDtmRXeWc781Gjm9SdzJfsyQRpFEb
         ZwNrF3jl3X/ttqF1Vk6XsJXgIS/tDC+BTRAf2VVW1XigUS/2YqfhkDjrU50Db0j6Scli
         t7+g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=7XXZTr4hQlCLueAg2GAUsYeuQBJ1XBAJvfAoKyVEEk0=;
        b=GRat/R475GFeKFFdjfyzisAz2CweV0c0woaW2Q3Go6bfuAXtX9oggYRRR2eVw2wldf
         /PcMEcQ3K/w1jy8ONwhF1uiah33VviwO/U9nEIv4SwcWaspxXyf99VrhTpMqiJXF+pDx
         +LHzCWXLW1YuVjhka/y0wnPsRIymIa/BiOTx8KXmDyys+36RTjYMRrVedvgy1fhp0zFE
         X2JBQJGzG7RFo+ZnmLRLRkraHQGC619KdM4F0XclYx8B9A3T4YbaifrGYnp2lZ13CKwW
         ZeOzY5PpL93DYAPxpZb5Cvuh5W6IJoZ/fFSWsOalomq+r8AMAlSUgQ+d+wKXcZp2MLDY
         EUPQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=dxKpbp4q;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.130 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7XXZTr4hQlCLueAg2GAUsYeuQBJ1XBAJvfAoKyVEEk0=;
        b=fvyB3uBJ/Zw3O2QOyCuVw67tG9Tvdn6weYFiXa83+pPrBfMNJG/ghXGVMTGqmM8VYB
         93oYRR4F1imIrK9DE9yuNrHHKYCz7seMQjwmTyvNFi9CBDnijMXTf9Ix1DrfYqY6e6gS
         nzVOKyVPgt+WeZR0s5h9RJAEWyQ5aGsfPzzkW8rtcg9ZR21G3f2NpKSpxOewRT0FrWYZ
         n88iCbs0cpfdplwNRESk1YJVycsP7lCkmjowrJBPIx98p21NObz/AClc8LxA05sEbinj
         jelz9ShjXopgG/HSNCFcZMrZ5TyTJV5kYUEnTj+XlCroxudRbn1WhTt3RStJEfJBMGX9
         iZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7XXZTr4hQlCLueAg2GAUsYeuQBJ1XBAJvfAoKyVEEk0=;
        b=ZbSYGJvzpS1MGKeySm48UE6fJGoafku7msmH3GNqITRWE6eJvp7ai1h+1FZPUiWsjO
         KDbCjY66S62bsFgifPJLu67vvpqLCC6rDbP8bIKtgz6WH5h4ZIiq/tFpAiygerJkMmlt
         ICW2oZBtOsSVRHiTqhPf9yi0f8FhUGiYptBoPqJXEV8iqYSE16E36ATStQAPSSQiK3Do
         q9fTV7rhJZskoX1I3peoif9/iGZZu5TKn5R2sOJtfJpIA2exv7UGXFyowZKoD5KIYHvw
         TAOaQkr9YzoCHTynZBlMCzIXwaRcJ+Q2L2PzLf3qttYWThN2ibgaQZ6L8U830bQKAkU0
         6LNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vmQLuOF5gdHnykQHJndk7zmJAei2zXDRN/LZR74FgX2uljle+
	GVePfbroFktRWszuNuvWH28=
X-Google-Smtp-Source: ABdhPJwnHC6Y98l1pYNmbY5YKyXa2kmLvif4jwgjBFeNIXsePKgloXYtpgB8kE2+kUaVECXV05JiAQ==
X-Received: by 2002:a05:6512:328b:: with SMTP id p11mr772126lfe.446.1606815397351;
        Tue, 01 Dec 2020 01:36:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls983860lfn.0.gmail; Tue, 01 Dec
 2020 01:36:36 -0800 (PST)
X-Received: by 2002:a19:d14:: with SMTP id 20mr800111lfn.87.1606815396264;
        Tue, 01 Dec 2020 01:36:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606815396; cv=pass;
        d=google.com; s=arc-20160816;
        b=URMyMXpti9BjMIY/OcW5BqZTqj/rU4fwdpWK7/kssIdFAxlEM+XNzGT3KRNHKibrzL
         QwzoHU/lxGAXg/cANE0IaT+uxRAnxNKU1AvUERsPzb6rJl7DYVBLuArfPorUU5cI3qri
         NqmoQzbIXE35K0d4KtC9MT+MjBuC88U1N/l8ezPcxZIVklh78A6TUTPNfoK3jFGs4cFZ
         2myZFGSNIah6h7GQb+W6KR5nwNSoDVQPfItxRfNLVKM7QRxqaFNvPxjqzSAbcs21ua0B
         9zIMAwehgKcHCLEpdXC818hnnb147VYsDH6EL6SHEZ8Fgl8dUdNjXi/HzogluZL9Jw07
         D7tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=bpEIz+0W7Dghlo7y7zhnFUj0GoWHXWa6Qxp4aSA47hI=;
        b=csUFxb9CZ0PX4BDyF3fMeKO3C7W0GA9ls/oYFDdt8QuFwtjpwA3aBnLglE3QQC97ZV
         fcbO66e0W3wpbQSOto4c4tkkdA2sV8OxjT79KOcGqN9ZmWmMGuhkHNzlpO8E/ghaZryL
         GU1g9K6PjXbUIqCj8NxTF+7h6OI6dALeH8zWv/FogosrdPKcwQJUe2CdcHzgiHaCrvZU
         1ix+/5zAufhbqQ0mSv4W+fLbT9JYsCx6hb960bw131DDJ1AsP2v+p3CTf3XpR6N2jvJa
         LPumQGNLzkenDvCCpm4APxviL1Srw9zWLtmbrldNk07eXLUFYZMs0hn4+CcIUdAMKHX3
         2UTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=dxKpbp4q;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.130 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90130.outbound.protection.outlook.com. [40.107.9.130])
        by gmr-mx.google.com with ESMTPS id b27si35637ljf.8.2020.12.01.01.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 01:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.9.130 as permitted sender) client-ip=40.107.9.130;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBRFofKyYbNTnyYsq4+X3xc6C3618zufahDM0j09Ym81bDPO1CeVlRvAOXCjAf2eWtLQV0rQgQacFh2h1AtkcUHIgX8XtoCIajXGpg4936lDimIRjbI+KWlBfuan+NeES+nZwaU2uxRazvTsYv+ahviWS2VDwD9fj9c0qNHhS01PNOtEmeqz/RKPU2n1R80wI/811pF4Ll3lDo6qXpS5wPFC5P8BW50UpAm6eRMEu4XxaUyyJnF9BMKI90/BhEiDa0Z2ObIoRDNLiSPfhStGcUco5DaSgLWlyOVWvcuZBIH8JPv/9tBaxoWv4LsfzL5EOjGCl0XnZMptw72ASCg4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpEIz+0W7Dghlo7y7zhnFUj0GoWHXWa6Qxp4aSA47hI=;
 b=KYyxsGl/Z+HIFGRSnsP4qpJnMwmxb466eOgJdcC5g0wv66KBnncPTR30Rya5vmzURmCXUntzNabjoePqVSzsrhEgI4nGApUbrR/CPmsPA9GGcmC5eAEQssAZCK7Ylriypl375Yh2GFfzhV4QyyR6MtLMd1dt2n3MIVTzcDjrgHs15g1L0ch22u7Z5sUFK20/YYGnv9vAyI05fh4qO4l87BaI3tqi6Yaas5ZHqXEY7L+MY3TEdAvgfPoVlw+ql2qrQsrPhVUMnTfTTXoOK97YOrpbM54sLY6r+HnREKhbg3QS6j1jFfuD02KH2ctBo9nq6zgXBe7jmPawUvUD38xrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5450.eurprd03.prod.outlook.com (2603:10a6:101:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 09:36:33 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 09:36:33 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Sainz Markel <Msainz@ikerlan.es>, Jan Kiszka <jan.kiszka@siemens.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlAACrWCAAAAQERAAARHbIA==
Date: Tue, 1 Dec 2020 09:36:33 +0000
Message-ID: <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
In-Reply-To: <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0b3b60c-1490-4d64-d8d8-08d895dc9755
x-ms-traffictypediagnostic: PR2PR03MB5450:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR2PR03MB5450AB009B8163E59661F8C6B6F40@PR2PR03MB5450.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xVy3Ocn7H7KnMdS69k/HD0cu/6VKQkakKxI1o1YPJnycfHcb0HT2/1ePaLL80JCZ5moOH8nYeZliq8kO9wTEz7+yDTKmHgCrjyrajgOtFw/mo9yTlmY1A8tW7e9r8RiuJvi/SmyRGHA+3wCx3fCQ2RMugayEb16qqOE96Nj+Tnboasxr+lnG+HtTmbNvojBCsSike6BibcztFYmfu3YQJ1fwoD8+tnX1J5or2al/jH3X18CMsLvjUIEn8so/fWIj6Kimc0DYfohJdjg7ijkIm0XVejA1ir1Z4AWVb2qh5FKDjE92thItm4jZQ3sHmgPvdKJxwvA/dhyQKG4KXeti9N2FBuune0BOa9nk/Y4JNT+i+tIRHC6pmi0CCCI1V9/x6pYWXaD1Hbb5iULp1fhRIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(478600001)(8676002)(71200400001)(5660300002)(45080400002)(86362001)(76116006)(66446008)(52536014)(83380400001)(64756008)(66476007)(66946007)(66556008)(966005)(2940100002)(33656002)(7696005)(110136005)(2906002)(6506007)(316002)(53546011)(9686003)(55016002)(186003)(8936002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFBCT1Uvamp3YXRnUjN6OVFpK1RKZ041NjgxQ3FDWWNUV1YxZ1hJSWZGUHlU?=
 =?utf-8?B?bGJPdXZ0ejNNT2Z5NGI2U2xNQzlVSE5pdFpocE1BMVBLUDJmNUQrUko4T3Vs?=
 =?utf-8?B?c3J3b1hqeC8zMTVzdXpTdWh1VlVyeVVLVFhKUmhOVFE2cWh1TnVWZ01hVG1F?=
 =?utf-8?B?c3RuWndJWjZ6OHVxNFZIeUgvajg4SmVHV1BORGhzVUhyVXl2ai82Z3dDLzlX?=
 =?utf-8?B?ZlB1akJqUmZuLytvSHhWclpIeUV4ZW4wdGF2eHBHc1dGU0NiUVB2L1Z6UkNS?=
 =?utf-8?B?NjdqdkxZYm4zRHpBaXF4aEFSdEFpVG56ZmlvY1dGVUZ1STNkTUdRQ3hiblQy?=
 =?utf-8?B?WTR2OW1mV1FKcE55QXlpdi8ybXE3eVZpLzVwbTliM3pKSWZFSXV5ZW9Bay8x?=
 =?utf-8?B?eWR2V3VYbUVma2p0Q1dtdTQ1ZlFHV1hiL0NPRVVxZHgvU0diYWtwellQZnBm?=
 =?utf-8?B?Mm1qMTM4bVlSMjdjWFpNQTBFRlc4emY4WkVyUlpXV0hsMVJZWmZQaEFJbkRQ?=
 =?utf-8?B?RUNkcnZVVkJ4QlROMXpKUWNXTGlnVGJKcDNJRGtaYURkYmxBTkN5TUVHWG5J?=
 =?utf-8?B?V2N5QllHTHFYWVRXV1FQSHNhRXFxSUpkcXlyTzZES2lobkR0dlZWWml5SHVE?=
 =?utf-8?B?Y3lGNmdqMXRCN0RJV2FpSjhrTXZoVDZYNU5kYndOZUh4Yi9aVmlEait3c241?=
 =?utf-8?B?eE5aekdzZFpjbkllQUtmM3Y5V3JmQkQ2SnBRZ01RRnFBTERjWmxZbkpKYlhP?=
 =?utf-8?B?ZEMxM29nS1k5eEI4bUxKdHZ3V1YrR1o2L2FxUmsrZitUdE1nVVNoN0lnYkVa?=
 =?utf-8?B?MEdCbnM5V3c0VGtvNEJEbEZZSHNuR3JsRm9LQjRLeDZwb1JqUmxRRThXME1S?=
 =?utf-8?B?TFRnQjZSdWpjWHpacG1HNVRObm5qNEt2WlYzQ0haTWNzOW5VUHRObnNici9k?=
 =?utf-8?B?YTRiUUgwRnJOdjcrL1BBcERPaTlWOVlpdHJ6cy95T3RnbWM0ZHBzK2NUdkEr?=
 =?utf-8?B?dVVORnpGL3NCb1J1aDd4bEx4ZmN5eERDcFlwWldHQ0VyWGVtZlBkRmJQTWpI?=
 =?utf-8?B?VnlTL3Z1dzkzY2Z2RDhvOVFaWU5BSlcrLzFFV2NkR2VPdUtqZ2ozSTduKzZO?=
 =?utf-8?B?R3VzUkMvcGI4RmN6REpGZGFFWWtreWoyc2hucHdnMkt0YlQwM1U1dDAvaURu?=
 =?utf-8?B?K2cyZ1BRR3NLZFkvcXFyM1pBay90UUNjMFhFNkwzZ1RQVGQ0NXhCM3BqdllD?=
 =?utf-8?B?Z2hlTkNwak1qeHhXckhaSjB0R1VCMWlrazlaSExMNWpVbzBZYmFUbUN1K29h?=
 =?utf-8?Q?mmUSclf2tcVT0=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b3b60c-1490-4d64-d8d8-08d895dc9755
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 09:36:33.6637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKQnNEHL0UIw7m6kLDjv3lQgede6KcVI0mbJ56TRiiFfEpgd8P53u/Yy06zQTzt9ovIK/VJXE2EhHzDwy0JtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5450
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=dxKpbp4q;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.9.130 as permitted sender)
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

After compiling with the suggested flag, the output of the enable command a=
dds another line:

~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell=20

Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 1
Code location: 0xfffffffff0000050
Using x2APIC
/home/msainz/Projects/jailhouse/hypervisor/arch/x86/vmx.c:238: returning er=
ror -EIO
JAILHOUSE_ENABLE: Input/output error


-----Mensaje original-----
De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> En nomb=
re de Sainz Markel
Enviado el: martes, 1 de diciembre de 2020 10:07
Para: Jan Kiszka <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com
Asunto: RE: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


I did not. I'm running this on a busybox based Linux. No Python installatio=
n possible. I'm going to check the mentioned docs, any other output I could=
 upload for you, not dependant on Python?

-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com>
Enviado el: martes, 1 de diciembre de 2020 10:04
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 01.12.20 08:48, Sainz Markel wrote:
> Hi there,
>
> After being able to resolve the cmdline issue, the following error=20
> comes up when trying to enable the cell:
>
> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
>
> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5 Code
> location: 0xfffffffff0000050 Using x2APIC
> JAILHOUSE_ENABLE: Input/output error
>

Did your target pass "jailhouse hardware check"? If so, enable CONFIG_TRACE=
_ERROR (see Documentation/hypervisor-configuration.md) to get the origin of=
 this.

Jan

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://eur02.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%2Fjailhouse=
-dev%2FPA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40%2540PA4PR03MB7184.eurprd03.pr=
od.outlook.com&amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Cf7e39f95717f40e72=
10e08d895d87f34%7C910ac815f8554a08bf2990b46552cf11%7C0%7C1%7C63742410507456=
5645%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DuOVN7UEhxwvg6s58IEZex1Yhqy4I%2BLx4M=
wkQ06YBGT8%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB7184E05AA2075FBE9EE0F931B6F40%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
