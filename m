Return-Path: <jailhouse-dev+bncBAABBRGOZD2QKGQEZ2O25QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE91C6617
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 04:56:06 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id s20sf339400pgn.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 May 2020 19:56:06 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1588733765; cv=pass;
        d=google.com; s=arc-20160816;
        b=OGIuquEUSSuaC6FVT2EpwpTT3k1CYH6jHViSNGnnVmVhxZSYbmnevQstXWUq+wBMhl
         6H5IJaxI3KrCVTpWqu4IlvtQp4K6ZNmxIVqPnnH9QtHWeXSRpH7fSupAleP0Upa1dOTi
         XpmghPzr0Z0lKTCEXtmQWORYZYnJu0Pwpb8VjXpVRyuMDCZeZppHy0uPzbzH3LrWEEv5
         xIjRBK/hoKmjb7JXjVK6fDmPj7c9FDiXAhjMgdhp/USC+sWAWcTRMOio8MK8HXQYSSPi
         hyHrevB+TYDGYr6WNnVDdEEI2W7E1g6edNd4sxSDPJM3ft2oMLHzPJT3crlOah6WdWo8
         78Lw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=P8bX9Jbp6rA1WJE6yWtwux6BF7/O+2hhV3XFJcZSwpw=;
        b=Im+S80QTlvjlHkz+9g6cNMWNHRvCZ+PnW+yRUqzDv2qpgwIJXT6hBpcqY6hXXnAdDZ
         jwzr4SuB5e9YKbYaTpgUfhOSrfNPl2YxfyuO43ogMURLA32gf8i7qZUnzKTdLuIq4TtM
         K85FGjFzOrJkeCFMKewVGU+AuYo2Oweth1F4ipMBLdx1S4N1OJtuYlLLRRl14X3pVgG2
         KPzETF4/8d1h5NeD8SKBk29xD3DWQk4EfuI6mnhSE7itVp82EvQYO2AyysXJIS72dEtp
         vLQitnP99gLuqXiy2y40Hr5ko4p5Bq8sPxxKs7NHKMNdmRlHdPv15O5WaxIDeay67PxN
         oqMA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=mQ14c1nK;
       arc=pass (i=1);
       spf=pass (google.com: domain of toasmethoashknv@outlook.com designates 40.92.253.75 as permitted sender) smtp.mailfrom=toasmethoashknv@outlook.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=P8bX9Jbp6rA1WJE6yWtwux6BF7/O+2hhV3XFJcZSwpw=;
        b=gjeRqqahKPdbCdwzzY40IU2rHWq/63tVeRURkFL3hVrME2eg8P8LeU9OFEKEzz7P1C
         ETnAxHIHF7rssWSob5SvCCzQLUuiUAyq/0+BNmaJWHY2FhkdQqdnRfZQYqGGQNgRU054
         e8GA4JZDUx5Qfdy2TTfzt13gYZy9CVDu+kboZNFbQL9DluR34K4+Au3nJxHLmDYHzudh
         xUV5jDwWR5Jhej4jCsqWQG9sKaIieOmGWuCkMm2/+mD0BEJrmZgu704IxroxaSSQm3uS
         lcvm4dDo5g/CCXADUBnRc7BgzSLkzx0q4R9bKNso1Zp63oU3DnkFjhOYlEwjy1ibjruJ
         7g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=P8bX9Jbp6rA1WJE6yWtwux6BF7/O+2hhV3XFJcZSwpw=;
        b=nkmBSVrrB+KCCan9y8af+1tKzxWDcmFnlX/JOb7+7f4A132u5QhbD5ZjOqg5mclZy2
         ZLcZKaQCMz0/9bdENEepozcPhmafi4pdwxYqXprlWuKXvqLNKlgp6MEUdzBwvl0333lF
         ulZocsXxKkKhpMISrflduxJOa4StORdOU+aktnVkCE+UA/ZNap/6Qjb5LE2KzmqXi7Fq
         9/1ZQ5bvCFuyhYD0jXSgqogUzmb/UITesCjZajhBKjGF1CVr72/I8Ehj8/srXlazAzdH
         9LsyZ2cx5wbR5HQaoKZ0t+AQJbMTTwzVXn4+SPo7W+z1zjj+CEfRUKekckrSY1fj3j5w
         AajQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZvqL3HGHRZjq+LvEoZ0ZId8/ofcmX5ya4CQhIJaT2GIMU4YPCx
	GslANZOpdsTOPLQGg+W4bRI=
X-Google-Smtp-Source: APiQypITrx9OFaVne1BU9hjPOQCr1qARuyjiRBIH2KOqSYRUotbFWpuMnWdVv+QmHq93TipsDqcRPw==
X-Received: by 2002:aa7:943c:: with SMTP id y28mr6071950pfo.171.1588733764775;
        Tue, 05 May 2020 19:56:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:c31a:: with SMTP id v26ls145594pfg.2.gmail; Tue, 05 May
 2020 19:56:04 -0700 (PDT)
X-Received: by 2002:a62:be0c:: with SMTP id l12mr6011198pff.95.1588733764178;
        Tue, 05 May 2020 19:56:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588733764; cv=pass;
        d=google.com; s=arc-20160816;
        b=ybaF6GKHnE/QY0wgdail/OPAfuVy9FPWo6wFxMGZ2OgZw5IAO/w5J1LI0AqR9Riudz
         uj/RqnoD2MiX4IAXa+1WG54KkQ1F1GIXdPUDuqE+cgxFQ2JH1wGYFWkZXbq61NzHAqpK
         QN2DmzrUaZbHMjrUOQqNU/JWDlB5O7v1XLGWCUCckpCAtDJty1EmH6lCv7/aUdTJ6QNG
         Xy6yIfZgTa/9fGDtSEOYG3SJE5nSFY+zP7+QW/OezgNcbs2LLj0FgpCujzNoSeEX0als
         LAT/6huABaNIPEZXbc/JYRoJqJ6ccJaTGdQ8s8LgUEteBcXQlsFewDCCA9A4yAH2HC9c
         W9Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=XWYgApADo8WDu6X5hwja3KndwgmG7WszgwYfP541Tcc=;
        b=vaX9uydnX1tL8lR7C4cx8OqVqeln5VqIBTmV+NHvtF4aMn8apRqoR0Vm7Ee6TDixr2
         PDgvwihj96WH0E7u7ZLuIP23nLMLs6VDOaXqEvhFFpQE0COQp7hwWElBR2GmuTIt8e/c
         MUVq0KFkz8Cugx5G6zX+l9xLj56m1Urbxzio7HH2dwj76et2O0IVEfMGEG7AeD8iYjqW
         jbsxgvbmo2EC3zYkLIJRbl9xeYDGSdtNuaACk9bG+fs3vZvBeoOG7a6iemK85XGcoFtX
         jyCQtC9ItlSOjF4wnMHOH6sP1IVzF3S3iIx8teChkp4zXUPYLgXQXoELiGZ/kiz+6jDB
         qg2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=mQ14c1nK;
       arc=pass (i=1);
       spf=pass (google.com: domain of toasmethoashknv@outlook.com designates 40.92.253.75 as permitted sender) smtp.mailfrom=toasmethoashknv@outlook.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-oln040092253075.outbound.protection.outlook.com. [40.92.253.75])
        by gmr-mx.google.com with ESMTPS id a1si54057plp.2.2020.05.05.19.56.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 19:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of toasmethoashknv@outlook.com designates 40.92.253.75 as permitted sender) client-ip=40.92.253.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSRWaGGskD+REX/UDSvQBPavWB45JqTUqVYw76gRQfAcmhGgwrzRWINerYRQqsHL249OIsZ4jHiLjz2n2fRs37gsrQuI83BInSv/T0QQLpFieqri3B9Qyy8Kqvd0oco6dDBRNIx9TveB8dkMIc9ANJmmJx/J8gXezqkzDkk1tM6jOJ2j8DWBow5LuGQ72OSb2Vrj8mVXMZvKbTV1NElIdTd303v4BuemvmZShFrMCHXR3h/H0S1ExW0DVjrWUU/NLda/mZr+LMDM7zDmB68rkhPmRvFM3HlxJJ5rlS2MJ62qbjA8yHIlBdXTCgFcPJMjCC0iJumbt8Md5Mq2FIsHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWYgApADo8WDu6X5hwja3KndwgmG7WszgwYfP541Tcc=;
 b=ev5FiF37OO/4xhxVCXquWVmo293BToKwyxdydYXp5fohuEYbUJLzFdIGPH9ZENhqHZa3FWnHzoXbzGUzfsx69i4aXutNocwpAmO8IW/ESA2rUYv5IfCqeRD2yGL4Ma2dZD5FjGJOeeONxpFrHav5IGl4Q3ar3fHXcfi/wkyo4FCECiqjrddYKZTUSvtSGDzTNa5kquAgw0mducO1NkQ4GeD9MDo+qHcx+eFlnounWJoF0yE1cxLRJVGHySsjXeiJ/TWws+8Bw/R0LhqWnKjqy7EEcWEPJoJHrh9tYLLPnSAPeFH/0gAFHJpx1Rc2ISbMgp2P3PQMmc/7k2q/g/7KHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4a) by
 SG2APC01HT065.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::386)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.24; Wed, 6 May
 2020 02:54:32 +0000
Received: from PS2P216MB0228.KORP216.PROD.OUTLOOK.COM (10.152.250.59) by
 SG2APC01FT025.mail.protection.outlook.com (10.152.250.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Wed, 6 May 2020 02:54:31 +0000
Received: from PS2P216MB0228.KORP216.PROD.OUTLOOK.COM
 ([fe80::d067:f40d:292e:8ba1]) by PS2P216MB0228.KORP216.PROD.OUTLOOK.COM
 ([fe80::d067:f40d:292e:8ba1%5]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 02:54:31 +0000
From: Shoasmetis Hoothootava <toasmethoashknv@outlook.com>
To: yolanda.cy.yu <yolanda.cy.yu@pccw.com>
Subject: =?gb2312?B?y73EvL270tfUsbXEwLTQxSEgYW5udWFsIGZlYXN0IFRoZSBwdXBwZXQtYm9v?=
 =?gb2312?Q?thof_fun_Our_powers?=
Thread-Topic: =?gb2312?B?y73EvL270tfUsbXEwLTQxSEgYW5udWFsIGZlYXN0IFRoZSBwdXBwZXQtYm9v?=
 =?gb2312?Q?thof_fun_Our_powers?=
Thread-Index: AQHWI1Go5qu9YO2/IUC33VdhB7zNpA==
Date: Wed, 6 May 2020 02:54:31 +0000
Message-ID: <PS2P216MB0228B8BCF638B0490142EC3CA7A40@PS2P216MB0228.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FFB304543A3E436FB7F0FED13B1DD6DBF2AB54E89D11ACEA0AA619FC5EBA2CFE;UpperCasedChecksum:071E8E7B0E48E6931CBAC6D9D89C814F6194376D8C26592D491DC07D84B16486;SizeAsReceived:21221;Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [cY1XKUPp0HO3rgvjlESRuYvNkpUTz4OY]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 8227e6f3-8f4a-4e02-d244-08d7f168cd2e
x-ms-traffictypediagnostic: SG2APC01HT065:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VLRxRGluMAAyt2ijMEU2StXBs+WCIa68NA1DjuKrGqOgkwA9wVofpnpJQwQkyt5zHKxjMTbnbFgOE2NcR/hsWRFKhbZ6MX7QR3RSvWlRb6DKjx4HWKuJ0M46dAfdye8DQPlMcS3YLF0nbqqiUyx33KapkPXded7Ca7WYadYC3IkBL0L7qeNd7HzCPLhcoH5BV2X4+8wuU1KEuqTn2LK/3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB0228.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
x-ms-exchange-antispam-messagedata: L46ENzxesxpkA9FyDph7c/ZxohmAQG0O9GxMz1nnDZfxOt7B0Rg60d8o6C//N9ROMsKkbYla+4ZrRnDqQhN+3AtCC5vVefGCPFFYPS0CHpl9SueD931FJlv8rROEgf5cnp2gRWy5fB7kiFy4XCJ0hA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PS2P216MB0228B8BCF638B0490142EC3CA7A40PS2P216MB0228KORP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8227e6f3-8f4a-4e02-d244-08d7f168cd2e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 02:54:31.5206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT065
X-Original-Sender: toasmethoashknv@outlook.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@outlook.com header.s=selector1 header.b=mQ14c1nK;       arc=pass
 (i=1);       spf=pass (google.com: domain of toasmethoashknv@outlook.com
 designates 40.92.253.75 as permitted sender) smtp.mailfrom=toasmethoashknv@outlook.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
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

--_000_PS2P216MB0228B8BCF638B0490142EC3CA7A40PS2P216MB0228KORP_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E3=80=90=E9=82=80=E8=AF=B7=E5=87=BD=E3=80=91

=E4=BD=A0=E5=A5=BD=E8=82=A1=E5=8F=8B=EF=BC=9A

     =E6=88=91=E6=98=AF=E6=B9=96=E5=8C=97=E6=AD=A6=E6=B1=89=E8=AF=81=E5=88=
=B8=E4=BA=A4=E6=98=93=E5=91=98=E8=AE=B8=E6=9F=90=EF=BC=88=E4=B8=BA=E5=AE=89=
=E5=85=A8=E4=B8=8D=E6=96=B9=E4=BE=BF=E9=80=8F=E9=9C=B2=E5=85=A8=E5=90=8D=EF=
=BC=89=EF=BC=8C=E8=AF=B7=E8=AE=A4=E7=9C=9F=E7=9C=8B=E5=AE=8C=E6=88=91=E7=9A=
=84=E9=82=80=E8=AF=B7=E5=87=BD=EF=BC=8C=E8=83=BD=E7=BB=99=E6=82=A8=E5=B8=A6=
=E6=9D=A5=E5=B7=A8=E5=A4=A7=E6=94=B6=E7=9B=8A=E7=9A=84=E9=82=80=E8=AF=B7=E5=
=87=BD=E3=80=82=E6=88=91=E4=BB=8E=E4=BA=8B=E4=BA=A4=E6=98=93=E5=91=98=E5=B7=
=A5=E4=BD=9C=E5=B7=B2=E7=BB=8F8=E5=B9=B4=EF=BC=8C=E7=8E=B0=E5=B7=B2=E6=88=
=90=E4=B8=BA=E7=A7=81=E5=8B=9F=E4=BA=A4=E6=98=93=E5=91=98=E7=9A=84=E4=B8=BB=
=E7=AE=A1=E3=80=82=E6=AF=8F=E6=AC=A1=E6=88=91=E4=BB=AC=E7=A7=81=E5=8B=9F=E8=
=A6=81=E5=BB=BA=E4=BB=93=E5=89=8D5=E5=88=86=E9=92=9F=E6=88=91=E4=BC=9A=E6=
=94=B6=E5=88=B0=E4=B8=8A=E7=BA=A7=E9=80=9A=E7=9F=A5=E3=80=82=E6=8F=90=E5=89=
=8D=E7=9F=A5=E9=81=93=E8=82=A1=E7=A5=A8=E4=BB=A3=E7=A0=81=E3=80=82=E7=8E=B0=
=E5=9C=A8=E5=8F=88=E5=88=B0=E4=BA=86=E4=B8=8A=E5=B8=82=E5=85=AC=E5=8F=B8=E5=
=85=AC=E5=B8=83=E5=B9=B4=E6=8A=A5=E5=AD=A3=E6=8A=A5=E9=98=B6=E6=AE=B5=EF=BC=
=8C=E5=86=8D=E5=8A=A0=E4=B8=8A=E6=AF=8F=E4=B8=AA=E4=B8=8A=E5=B8=82=E5=85=AC=
=E5=8F=B8=E4=BC=9A=E5=9C=A8=E6=AD=A4=E6=9C=9F=E9=97=B4=E6=98=8E=E7=A1=AE=E6=
=96=B0=E7=9A=84=E4=B8=80=E5=B9=B4=E5=85=AC=E5=8F=B8=E7=9A=84=E7=9B=AE=E6=A0=
=87=E8=A7=84=E5=88=92=E5=8F=8A=E5=AD=A3=E5=BA=A6=E5=AE=9E=E6=96=BD=E6=96=B9=
=E6=A1=88=EF=BC=8C
     =E6=AD=A4=E6=AC=A1=E5=BB=BA=E4=BB=93=E5=B0=86=E4=BC=9A=E6=98=AF=E6=8E=
=A5=E4=B8=8B=E6=9D=A5=E7=9A=84=E6=BD=9C=E5=8A=9B=E8=82=A1=EF=BC=8C=E5=BB=BA=
=E4=BB=93=E6=97=B6=E6=88=91=E4=BC=9A=E5=9C=A8qq=E7=BE=A4=E9=87=8C=E5=85=AC=
=E5=B8=83=E8=82=A1=E7=A5=A8=EF=BC=8C=E6=AF=8F=E6=AC=A1=E8=82=A1=E7=A5=A8=E7=
=9B=88=E5=88=A9=E5=87=BA=E5=B1=80=E5=90=8E=E5=90=84=E4=BD=8D=E8=82=A1=E5=8F=
=8B=E9=80=9A=E8=BF=87qq=E5=8F=91=E4=B8=AA=E5=BF=83=E6=84=8F=E7=BA=A2=E5=8C=
=85=EF=BC=8C=E4=B8=8D=E5=BC=BA=E5=88=B6=E6=80=A7=E3=80=82 =E6=88=91=E7=9B=
=B8=E4=BF=A1=E5=A4=A7=E5=AE=B6=E7=9B=88=E5=88=A9=E5=90=8E=E4=BC=9A=E8=A1=A8=
=E5=BF=83=E6=84=8F=EF=BC=8C=E6=9C=AC=E4=BA=BA=E5=B0=86=E5=BB=BA=E7=AC=AC6=
=E7=BE=A4300=E4=BA=BA=E6=88=AA=E6=AD=A2=EF=BC=8C=E5=85=88=E5=88=B0=E5=85=88=
=E8=BF=9B=E7=BE=A4=EF=BC=8C=E7=9D=80=E6=89=8B=E5=BC=80=E5=A7=8B=E5=A4=96=E5=
=BF=AB=E5=BB=BA=E4=BB=93=E4=BA=8B=E5=AE=9C=EF=BC=8C=E7=9B=88=E5=88=A9=E4=B9=
=8B=E5=90=8E=E7=A7=81=E8=81=8A=E5=8F=91=E4=B8=AA=E7=BA=A2=E5=8C=85 =E4=B8=
=8D=E9=99=90=E5=88=B6=E7=BA=A2=E5=8C=85=E5=A4=A7=E5=B0=8F=EF=BC=8C=E8=8B=A5=
=E4=BB=A5=E5=B9=B3=E5=9D=87=E6=AF=8F=E4=B8=AA=E4=BA=BA=E6=AF=8F=E6=AC=A1=E8=
=B7=9F=E4=B8=8A=E5=BB=BA=E4=BB=93=E7=9B=88=E5=88=A9=E4=B9=8B=E5=90=8E=E7=BB=
=99=E6=88=91200=E5=85=83=E7=BA=A2=E5=8C=85=E8=AE=A1=E7=AE=97=E5=B0=B1=E6=98=
=AF6=E4=B8=87=E5=85=83=E3=80=82=E4=B9=9F=E8=83=BD=E8=AE=A9=E5=AE=B6=E4=BA=
=BA=E7=9A=84=E7=94=9F=E6=B4=BB=E8=B4=A8=E9=87=8F=E5=9C=A8=E7=8E=B0=E6=9C=89=
=E7=9A=84=E6=B0=B4=E5=B9=B3=E4=B8=8A=E6=9C=89=E6=89=80=E6=8F=90=E9=AB=98=EF=
=BC=81=E4=BB=A5=E5=90=8E=E5=86=8D=E7=BE=A4=E9=87=8C=E7=9A=84=E6=9C=8B=E5=8F=
=8B=EF=BC=8C=E9=95=BF=E6=9C=9F=E5=90=88=E4=BD=9C=EF=BC=8C=E6=AD=A4=E7=BE=A4=
=E9=95=BF=E6=9C=9F=E5=AD=98=E5=9C=A8=EF=BC=81=EF=BC=81

=E5=8A=A0=E6=88=91=E5=8A=A9=E7=90=86QQ=E5=8F=B7=EF=BC=9A 779449052  =E9=AA=
=8C=E8=AF=81 159 =E5=BF=85=E5=A1=AB=EF=BC=88=E4=B8=8D=E5=A1=AB=E5=9D=87=E4=
=BB=A5=E6=9C=AA=E8=83=BD=E6=94=B6=E5=88=B0=E9=82=80=E8=AF=B7=E7=A0=81=EF=BC=
=89

=E4=BB=A5=E4=B8=8A=E6=98=AF=E6=88=91=E7=9A=84=E8=82=BA=E8=85=91=E4=B9=8B=E8=
=A8=80=EF=BC=8C=E6=B2=A1=E6=9C=89=E4=BB=BB=E4=BD=95=E7=9B=AE=E7=9A=84=E5=8F=
=AA=E4=B8=BA=E8=B5=9A=E7=82=B9=E5=A4=96=E5=BF=AB=E4=BD=A0=E8=BF=9B=E7=9A=84=
=E8=BF=99=E4=B8=AA=E7=BE=A4=E6=98=AF=E7=AC=AC6=E4=B8=AA=E7=BE=A4=EF=BC=8C=
=E5=85=B6=E4=BD=99=E7=BE=A4=E5=B7=B2=E7=BB=8F=E6=88=90=E7=AB=8B=E4=B8=80=E4=
=B8=A4=E5=B9=B4=E4=B9=8B=E4=B9=85=EF=BC=81



































The Mother Superior had replied. Sydney trembled as she opened the letter. =
It began kindly.



Just as Mr. Forster=E2=80=99s visit to Dilston is by some pretended to have=
 had a political meaning, so Lord Derwentwater=E2=80=99s visit to Bamboroug=
h in the following June is also wrongly so described, as will immediately b=
ecome apparent. In truth, there was in neither any political or rebellious =
intentions whatever; but as at Dilston the Radcliffe cousins assembled to k=
eep their Christmas and New Year with the Earl, so at Bamborough the Protes=
tant gentlemen, including those who then and afterwards remained well affec=
ted to the Hanover usurpation, gathered together to meet Lord Derwentwater.=
 People in the south cannot understand how Protestants and Catholics can me=
et in Northumberland without immediately falling to loggerheads and quarrel=
ling about the Pope. And it seems the belief of the common sort in London t=
hat the appearance of a Catholic should be the signal for the throwing of b=
rickbats, dead cats, and stones at his head. This kind of piety we do not u=
nderstand. Alas! it was my unhappiness during this time of company, when ev=
eryone expected smiles and a face of joy, to feel that such a reply would h=
ave to be given to my lord as would fill two hearts with unhappiness. I car=
ried Lady Crewe=E2=80=99s letter with me always, not for comfort, but for s=
upport, for it afforded me small consolation to know that I had the permiss=
ion or license of the Church to make myself unhappy. Father Howard, on the =
other hand, would have given me authority to be happy. I perceived, too, th=
at Mr. Hilyard had fully divined my secret, because he now sat glum, and lo=
oked at me with eyes full of pity, though he spoke not for a time. This is =
a grievous thing for a young woman who hath a great secret, to find that a =
third person has guessed it; for then must she either confess it to that pe=
rson, in which case she blabs the secret of another, or she must go on pret=
ending to hide what has already been discovered, like an ostrich with her e=
ggs, or the pelican who is said to bury her head in the sand, and so to thi=
nk that all is concealed. Mr. Hilyard gave no sign of his discovery save by=
 tell-tale eyes, which, dissimulator of looks though he was, could not hide=
 from me the truth that he knew my trouble and sorrow.



And many gallant plans unfinish=E2=80=99d now



THE last words of Dr. Marchmont, in taking leave of Edgar, were injunctions=
 to circumspection, and representations of the difficulty of drawing back w=
ith honour, if once any incautious eagerness betrayed his partiality. To th=
is counsel he was impelled to submit, lest he should risk for Camilla a rep=
ort similar to that which for Indiana had given him so much disturbance. Th=
ere, indeed, he felt himself wholly blameless. His admiration was but such =
as he always experienced at sight of a beautiful picture, nor had it ever b=
een demonstrated in any more serious manner. He had distinguished her by no=
 particular attention, singled her out by no pointed address, taken no pain=
s to engage her good opinion, and manifested no flattering pleasure at her =
approach or presence.



Mrs. Eyrecourt joined her daughter at the window.



Say, gee, do I! Say, listen, there=E2=80=99s some of these cigar-store spor=
ts that think because a girl=E2=80=99s working in a barber shop, they can g=
et away with anything. The things they saaaaaay! But, believe me, I know ho=
w to hop those birds! I just give um the north and south and ask um, =E2=80=
=98Say, who do you think you=E2=80=99re talking to?=E2=80=99 and they fade =
away like love=E2=80=99s young nightmare and oh, don=E2=80=99t you want a b=
ox of nail-paste? It will keep the nails as shiny as when first manicured, =
harmless to apply and lasts for days.





I believe you, my child, and I am anxious to help you. But I cannot corresp=
ond with an unknown person. If you decide to reveal yourself, it is only ri=
ght to add that I have shown your letter to the Reverend Father who, in tem=
poral as in spiritual things, is our counselor and guide. To him I must ref=
er you, in the first instance. His wisdom will decide the serious question =
of receiving you into our Holy Church, and will discover, in due time, if y=
ou have a true vocation to a religious life. With the Father=E2=80=99s sanc=
tion, you may be sure of my affectionate desire to serve you.



A day or two before my lord arrived, he began, Tom being present, to speak =
very briskly about badgers, otters, cub-foxes, seafowl, and other things wi=
th which his lordship might be amused; and presently, Tom having withdrawn,=
 he said to me gravely:



For ever. Clisson=E2=80=99s heart, which may God bless!



His sense of right was too just to mislead him into giving himself similar =
absolution with respect to Camilla. He had never, indeed, indulged a volunt=
ary vent to his preference; but the candour of his character convinced him =
that what so forcibly he had felt, he must occasionally have betrayed. Yet =
the idea excited regret without remorse; for though it had been his wish, a=
s well as intention, to conceal his best hopes, till they were ratified by =
his judgment, he had the conscious integrity of knowing that, should her he=
art become his prize, his dearest view in life would be to solicit her hand=
.



Well, my dear, is it clearing up? Shall we take a drive before luncheon?



Sure, I=E2=80=99ll try some. Say =E2=80=94 Say, it=E2=80=99s funny; I=E2=80=
=99ve been coming here ever since the shop opened and =E2=80=94 With arch s=
urprise. =E2=80=94 I don=E2=80=99t believe I know your name!





Sydney put the letter back in the envelope, feeling gratefully toward the M=
other Superior, but determined by the conditions imposed on her to make no =
further advance toward the Benedictine community.



=E2=80=98Miss Dorothy, I would that I could hope to see the roses return to=
 your cheeks when my lord comes. Believe me, those others who love you (in =
thine own station and with the respect due) take it greatly to heart that t=
hey see you thus going in sorrow and trouble.=E2=80=99



Was moved to pray for him, but all in vain;



To preserve, therefore, the appearance of an undesigning friend of the hous=
e, he had forced himself to refrain, for two days, from any visit to the re=
ctory, whither he was repairing, when thus, unlooked and unwished for, he s=
urprized Camilla at the Grove.



If you like, mama.



Don=E2=80=99t you? My, that=E2=80=99s funny! I don=E2=80=99t know yours!





Even if her motive in writing to the convent had remained unchallenged, the=
 allusions to the priest would still have decided her on taking this step. =
The bare idea of opening her inmost heart, and telling her saddest secrets,=
 to a man, and that man a stranger, was too repellent to be entertained for=
 a moment. In a few lines of reply, gratefully and respectfully written, sh=
e thanked the Mother Superior, and withdrew from the correspondence.



At these kind words I began to cry and lament.



Wherefore I bring this message:



Disappointed and disapproving feelings kept him, while there, aloof from he=
r; by continual suggestions, that her character was of no stability, that D=
r. Marchmont was right in his doubts, and Miss Margland herself not wrong i=
n accusing her of caprice; and when he perceived, upon her preparing to wal=
k home with her brother and sister, that Major Cerwood stept forward to att=
end her, he indignantly resolved to arrange without delay his continental e=
xcursion. But again, when, as she quitted the room, he saw her head half tu=
rned round, with an eye of enquiry if he followed, he determined frankly, a=
nd at once, in his capacity of a friend, to request some explanation of thi=
s meeting.



She turned to her mother as she answered.



Now you quit kidding me! What=E2=80=99s the nice little name?





--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PS2P216MB0228B8BCF638B0490142EC3CA7A40%40PS2P216MB0228.KORP21=
6.PROD.OUTLOOK.COM.

--_000_PS2P216MB0228B8BCF638B0490142EC3CA7A40PS2P216MB0228KORP_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Arial,Helvetica,san=
s-serif; font-size: 12pt;">
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"" align=3D"center">
=E3=80=90=E9=82=80=E8=AF=B7=E5=87=BD=E3=80=91</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
=E4=BD=A0=E5=A5=BD=E8=82=A1=E5=8F=8B=EF=BC=9A<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E6=88=91=E6=98=AF=E6=B9=96=E5=8C=97=E6=AD=A6=
=E6=B1=89=E8=AF=81=E5=88=B8=E4=BA=A4=E6=98=93=E5=91=98=E8=AE=B8=E6=9F=90=EF=
=BC=88=E4=B8=BA=E5=AE=89=E5=85=A8=E4=B8=8D=E6=96=B9=E4=BE=BF=E9=80=8F=E9=9C=
=B2=E5=85=A8=E5=90=8D=EF=BC=89=EF=BC=8C=E8=AF=B7=E8=AE=A4=E7=9C=9F=E7=9C=8B=
=E5=AE=8C=E6=88=91=E7=9A=84=E9=82=80=E8=AF=B7=E5=87=BD=EF=BC=8C=E8=83=BD=E7=
=BB=99=E6=82=A8=E5=B8=A6=E6=9D=A5=E5=B7=A8=E5=A4=A7=E6=94=B6=E7=9B=8A=E7=9A=
=84=E9=82=80=E8=AF=B7=E5=87=BD=E3=80=82=E6=88=91=E4=BB=8E=E4=BA=8B=E4=BA=A4=
=E6=98=93=E5=91=98=E5=B7=A5=E4=BD=9C=E5=B7=B2=E7=BB=8F8=E5=B9=B4=EF=BC=8C=
=E7=8E=B0=E5=B7=B2=E6=88=90=E4=B8=BA=E7=A7=81=E5=8B=9F=E4=BA=A4=E6=98=93=E5=
=91=98=E7=9A=84=E4=B8=BB=E7=AE=A1=E3=80=82=E6=AF=8F=E6=AC=A1=E6=88=91=E4=BB=
=AC=E7=A7=81=E5=8B=9F=E8=A6=81=E5=BB=BA=E4=BB=93=E5=89=8D5=E5=88=86=E9=92=
=9F=E6=88=91=E4=BC=9A=E6=94=B6=E5=88=B0=E4=B8=8A=E7=BA=A7=E9=80=9A=E7=9F=A5=
=E3=80=82=E6=8F=90=E5=89=8D=E7=9F=A5=E9=81=93=E8=82=A1=E7=A5=A8=E4=BB=A3=E7=
=A0=81=E3=80=82=E7=8E=B0=E5=9C=A8=E5=8F=88=E5=88=B0=E4=BA=86=E4=B8=8A=E5=B8=
=82=E5=85=AC=E5=8F=B8=E5=85=AC=E5=B8=83=E5=B9=B4=E6=8A=A5=E5=AD=A3=E6=8A=A5=
=E9=98=B6=E6=AE=B5=EF=BC=8C=E5=86=8D=E5=8A=A0=E4=B8=8A=E6=AF=8F=E4=B8=AA=E4=
=B8=8A=E5=B8=82=E5=85=AC=E5=8F=B8=E4=BC=9A=E5=9C=A8=E6=AD=A4=E6=9C=9F=E9=97=
=B4=E6=98=8E=E7=A1=AE=E6=96=B0=E7=9A=84=E4=B8=80=E5=B9=B4=E5=85=AC=E5=8F=B8=
=E7=9A=84=E7=9B=AE=E6=A0=87=E8=A7=84=E5=88=92=E5=8F=8A=E5=AD=A3=E5=BA=A6=E5=
=AE=9E=E6=96=BD=E6=96=B9=E6=A1=88=EF=BC=8C<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E6=AD=A4=E6=AC=A1=E5=BB=BA=E4=BB=93=E5=B0=86=
=E4=BC=9A=E6=98=AF=E6=8E=A5=E4=B8=8B=E6=9D=A5=E7=9A=84=E6=BD=9C=E5=8A=9B=E8=
=82=A1=EF=BC=8C=E5=BB=BA=E4=BB=93=E6=97=B6=E6=88=91=E4=BC=9A=E5=9C=A8qq=E7=
=BE=A4=E9=87=8C=E5=85=AC=E5=B8=83=E8=82=A1=E7=A5=A8=EF=BC=8C=E6=AF=8F=E6=AC=
=A1=E8=82=A1=E7=A5=A8=E7=9B=88=E5=88=A9=E5=87=BA=E5=B1=80=E5=90=8E=E5=90=84=
=E4=BD=8D=E8=82=A1=E5=8F=8B=E9=80=9A=E8=BF=87qq=E5=8F=91=E4=B8=AA=E5=BF=83=
=E6=84=8F=E7=BA=A2=E5=8C=85=EF=BC=8C=E4=B8=8D=E5=BC=BA=E5=88=B6=E6=80=A7=E3=
=80=82&nbsp;=E6=88=91=E7=9B=B8=E4=BF=A1=E5=A4=A7=E5=AE=B6=E7=9B=88=E5=88=A9=
=E5=90=8E=E4=BC=9A=E8=A1=A8=E5=BF=83=E6=84=8F=EF=BC=8C=E6=9C=AC=E4=BA=BA=E5=
=B0=86=E5=BB=BA=E7=AC=AC6=E7=BE=A4300=E4=BA=BA=E6=88=AA=E6=AD=A2=EF=BC=8C=
=E5=85=88=E5=88=B0=E5=85=88=E8=BF=9B=E7=BE=A4=EF=BC=8C=E7=9D=80=E6=89=8B=E5=
=BC=80=E5=A7=8B=E5=A4=96=E5=BF=AB=E5=BB=BA=E4=BB=93=E4=BA=8B=E5=AE=9C=EF=BC=
=8C=E7=9B=88=E5=88=A9=E4=B9=8B=E5=90=8E=E7=A7=81=E8=81=8A=E5=8F=91=E4=B8=AA=
=E7=BA=A2=E5=8C=85&nbsp;=E4=B8=8D=E9=99=90=E5=88=B6=E7=BA=A2=E5=8C=85=E5=A4=
=A7=E5=B0=8F=EF=BC=8C=E8=8B=A5=E4=BB=A5=E5=B9=B3=E5=9D=87=E6=AF=8F=E4=B8=AA=
=E4=BA=BA=E6=AF=8F=E6=AC=A1=E8=B7=9F=E4=B8=8A=E5=BB=BA=E4=BB=93=E7=9B=88=E5=
=88=A9=E4=B9=8B=E5=90=8E=E7=BB=99=E6=88=91200=E5=85=83=E7=BA=A2=E5=8C=85=E8=
=AE=A1=E7=AE=97=E5=B0=B1=E6=98=AF6=E4=B8=87=E5=85=83=E3=80=82=E4=B9=9F=E8=
=83=BD=E8=AE=A9=E5=AE=B6=E4=BA=BA=E7=9A=84=E7=94=9F=E6=B4=BB=E8=B4=A8=E9=87=
=8F=E5=9C=A8=E7=8E=B0=E6=9C=89=E7=9A=84=E6=B0=B4=E5=B9=B3=E4=B8=8A=E6=9C=89=
=E6=89=80=E6=8F=90=E9=AB=98=EF=BC=81=E4=BB=A5=E5=90=8E=E5=86=8D=E7=BE=A4=E9=
=87=8C=E7=9A=84=E6=9C=8B=E5=8F=8B=EF=BC=8C=E9=95=BF=E6=9C=9F=E5=90=88=E4=BD=
=9C=EF=BC=8C=E6=AD=A4=E7=BE=A4=E9=95=BF=E6=9C=9F=E5=AD=98=E5=9C=A8=EF=BC=81=
=EF=BC=81<br>
<br>
<span style=3D"background-color:#ffffff;">=E5=8A=A0=E6=88=91=E5=8A=A9=E7=90=
=86QQ=E5=8F=B7=EF=BC=9A&nbsp;<span style=3D"color:#e53333;">779449052</span=
><span style=3D"color:#e53333;">&nbsp;</span></span><span style=3D"backgrou=
nd-color:#ffffff;color:#000000;"><span style=3D"background-color:#ffffff;co=
lor:#000000;">
</span></span><span style=3D"background-color:#ffffff;">=E9=AA=8C=E8=AF=81<=
/span><span style=3D"background-color:#ffffff;color:red;">&nbsp;159
</span><span style=3D"background-color:#ffffff;">=E5=BF=85=E5=A1=AB=EF=BC=
=88=E4=B8=8D=E5=A1=AB=E5=9D=87=E4=BB=A5=E6=9C=AA=E8=83=BD=E6=94=B6=E5=88=B0=
=E9=82=80=E8=AF=B7=E7=A0=81=EF=BC=89</span><br>
&nbsp;<br>
=E4=BB=A5=E4=B8=8A=E6=98=AF=E6=88=91=E7=9A=84=E8=82=BA=E8=85=91=E4=B9=8B=E8=
=A8=80=EF=BC=8C=E6=B2=A1=E6=9C=89=E4=BB=BB=E4=BD=95=E7=9B=AE=E7=9A=84=E5=8F=
=AA=E4=B8=BA=E8=B5=9A=E7=82=B9=E5=A4=96=E5=BF=AB=E4=BD=A0=E8=BF=9B=E7=9A=84=
=E8=BF=99=E4=B8=AA=E7=BE=A4=E6=98=AF=E7=AC=AC6=E4=B8=AA=E7=BE=A4=EF=BC=8C=
=E5=85=B6=E4=BD=99=E7=BE=A4=E5=B7=B2=E7=BB=8F=E6=88=90=E7=AB=8B=E4=B8=80=E4=
=B8=A4=E5=B9=B4=E4=B9=8B=E4=B9=85=EF=BC=81</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">The Mother Superior=
 had replied. Sydney trembled as she opened the letter. It began kindly.</s=
pan>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">Just as Mr. Forster=
=E2=80=99s visit to Dilston is by some pretended to have had a political me=
aning, so Lord Derwentwater=E2=80=99s visit to Bamborough in the following =
June is also wrongly so described, as will immediately
 become apparent. In truth, there was in neither any political or rebelliou=
s intentions whatever; but as at Dilston the Radcliffe cousins assembled to=
 keep their Christmas and New Year with the Earl, so at Bamborough the Prot=
estant gentlemen, including those
 who then and afterwards remained well affected to the Hanover usurpation, =
gathered together to meet Lord Derwentwater. People in the south cannot und=
erstand how Protestants and Catholics can meet in Northumberland without im=
mediately falling to loggerheads
 and quarrelling about the Pope. And it seems the belief of the common sort=
 in London that the appearance of a Catholic should be the signal for the t=
hrowing of brickbats, dead cats, and stones at his head. This kind of piety=
 we do not understand. Alas! it
 was my unhappiness during this time of company, when everyone expected smi=
les and a face of joy, to feel that such a reply would have to be given to =
my lord as would fill two hearts with unhappiness. I carried Lady Crewe=E2=
=80=99s letter with me always, not for comfort,
 but for support, for it afforded me small consolation to know that I had t=
he permission or license of the Church to make myself unhappy. Father Howar=
d, on the other hand, would have given me authority to be happy. I perceive=
d, too, that Mr. Hilyard had fully
 divined my secret, because he now sat glum, and looked at me with eyes ful=
l of pity, though he spoke not for a time. This is a grievous thing for a y=
oung woman who hath a great secret, to find that a third person has guessed=
 it; for then must she either confess
 it to that person, in which case she blabs the secret of another, or she m=
ust go on pretending to hide what has already been discovered, like an ostr=
ich with her eggs, or the pelican who is said to bury her head in the sand,=
 and so to think that all is concealed.
 Mr. Hilyard gave no sign of his discovery save by tell-tale eyes, which, d=
issimulator of looks though he was, could not hide from me the truth that h=
e knew my trouble and sorrow.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">And many gallant pl=
ans unfinish=E2=80=99d now</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">THE last words of D=
r. Marchmont, in taking leave of Edgar, were injunctions to circumspection,=
 and representations of the difficulty of drawing back with honour, if once=
 any incautious eagerness betrayed
 his partiality. To this counsel he was impelled to submit, lest he should =
risk for Camilla a report similar to that which for Indiana had given him s=
o much disturbance. There, indeed, he felt himself wholly blameless. His ad=
miration was but such as he always
 experienced at sight of a beautiful picture, nor had it ever been demonstr=
ated in any more serious manner. He had distinguished her by no particular =
attention, singled her out by no pointed address, taken no pains to engage =
her good opinion, and manifested
 no flattering pleasure at her approach or presence.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">Mrs. Eyrecourt join=
ed her daughter at the window.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<span style=3D"background-color:#cccccc;color:#cccccc;">Say, gee, do I! Say=
, listen, there=E2=80=99s some of these cigar-store sports that think becau=
se a girl=E2=80=99s working in a barber shop, they can get away with anythi=
ng. The things they saaaaaay! But, believe me, I know
 how to hop those birds! I just give um the north and south and ask um, =E2=
=80=98Say, who do you think you=E2=80=99re talking to?=E2=80=99 and they fa=
de away like love=E2=80=99s young nightmare and oh, don=E2=80=99t you want =
a box of nail-paste? It will keep the nails as shiny as when first manicure=
d,
 harmless to apply and lasts for days.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">I believe you, my c=
hild, and I am anxious to help you. But I cannot correspond with an unknown=
 person. If you decide to reveal yourself, it is only right to add that I h=
ave shown your letter to the Reverend
 Father who, in temporal as in spiritual things, is our counselor and guide=
. To him I must refer you, in the first instance. His wisdom will decide th=
e serious question of receiving you into our Holy Church, and will discover=
, in due time, if you have a true
 vocation to a religious life. With the Father=E2=80=99s sanction, you may =
be sure of my affectionate desire to serve you.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">A day or two before=
 my lord arrived, he began, Tom being present, to speak very briskly about =
badgers, otters, cub-foxes, seafowl, and other things with which his lordsh=
ip might be amused; and presently,
 Tom having withdrawn, he said to me gravely:</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">For ever. Clisson=
=E2=80=99s heart, which may God bless!</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">His sense of right =
was too just to mislead him into giving himself similar absolution with res=
pect to Camilla. He had never, indeed, indulged a voluntary vent to his pre=
ference; but the candour of his character
 convinced him that what so forcibly he had felt, he must occasionally have=
 betrayed. Yet the idea excited regret without remorse; for though it had b=
een his wish, as well as intention, to conceal his best hopes, till they we=
re ratified by his judgment, he
 had the conscious integrity of knowing that, should her heart become his p=
rize, his dearest view in life would be to solicit her hand.</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">Well, my dear, is i=
t clearing up? Shall we take a drive before luncheon?</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<span style=3D"background-color:#cccccc;color:#cccccc;">Sure, I=E2=80=99ll =
try some. Say =E2=80=94 Say, it=E2=80=99s funny; I=E2=80=99ve been coming h=
ere ever since the shop opened and =E2=80=94 With arch surprise. =E2=80=94 =
I don=E2=80=99t believe I know your name!</span>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Sydney put the lett=
er back in the envelope, feeling gratefully toward the Mother Superior, but=
 determined by the conditions imposed on her to make no further advance tow=
ard the Benedictine community.</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">=E2=80=98Miss Dorot=
hy, I would that I could hope to see the roses return to your cheeks when m=
y lord comes. Believe me, those others who love you (in thine own station a=
nd with the respect due) take it greatly to
 heart that they see you thus going in sorrow and trouble.=E2=80=99</span> =
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Was moved to pray f=
or him, but all in vain;</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">To preserve, theref=
ore, the appearance of an undesigning friend of the house, he had forced hi=
mself to refrain, for two days, from any visit to the rectory, whither he w=
as repairing, when thus, unlooked
 and unwished for, he surprized Camilla at the Grove.</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">If you like, mama.<=
/span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Don=E2=80=99t you? =
My, that=E2=80=99s funny! I don=E2=80=99t know yours!</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Even if her motive =
in writing to the convent had remained unchallenged, the allusions to the p=
riest would still have decided her on taking this step. The bare idea of op=
ening her inmost heart, and telling
 her saddest secrets, to a man, and that man a stranger, was too repellent =
to be entertained for a moment. In a few lines of reply, gratefully and res=
pectfully written, she thanked the Mother Superior, and withdrew from the c=
orrespondence.</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">At these kind words=
 I began to cry and lament.</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Wherefore I bring t=
his message:</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Disappointed and di=
sapproving feelings kept him, while there, aloof from her; by continual sug=
gestions, that her character was of no stability, that Dr. Marchmont was ri=
ght in his doubts, and Miss Margland
 herself not wrong in accusing her of caprice; and when he perceived, upon =
her preparing to walk home with her brother and sister, that Major Cerwood =
stept forward to attend her, he indignantly resolved to arrange without del=
ay his continental excursion. But
 again, when, as she quitted the room, he saw her head half turned round, w=
ith an eye of enquiry if he followed, he determined frankly, and at once, i=
n his capacity of a friend, to request some explanation of this meeting.</s=
pan>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">She turned to her m=
other as she answered.</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">Now you quit kiddin=
g me! What=E2=80=99s the nice little name?</span>
</p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
<span style=3D"background-color:#cccccc;color:#cccccc;">&nbsp;</span> </p>
<p style=3D"line-height:23px;widows:2;text-transform:none;background-color:=
#ffffff;font-style:normal;text-indent:0px;font-family:" lucida=3D"" Grande?=
,=3D"" Verdana,=3D"" ?Microsoft=3D"" YaHei?;white-space:normal;orphans:2;le=
tter-spacing:normal;color:#000000;font-size:14px;font-weight:400;word-spaci=
ng:0px;font-variant-ligatures:normal;font-variant-caps:normal;-webkit-text-=
stroke-width:0px;text-decoration-style:initial;text-decoration-color:initia=
l;?=3D"">
&nbsp;</p>
<br>
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
om/d/msgid/jailhouse-dev/PS2P216MB0228B8BCF638B0490142EC3CA7A40%40PS2P216MB=
0228.KORP216.PROD.OUTLOOK.COM?utm_medium=3Demail&utm_source=3Dfooter">https=
://groups.google.com/d/msgid/jailhouse-dev/PS2P216MB0228B8BCF638B0490142EC3=
CA7A40%40PS2P216MB0228.KORP216.PROD.OUTLOOK.COM</a>.<br />

--_000_PS2P216MB0228B8BCF638B0490142EC3CA7A40PS2P216MB0228KORP_--
