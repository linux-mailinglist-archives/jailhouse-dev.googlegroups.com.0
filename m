Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBGXO3X6AKGQEJZN5ZYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6C29A230
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 02:25:47 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id t3sf4219561lfk.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 18:25:47 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1603761947; cv=pass;
        d=google.com; s=arc-20160816;
        b=E2JgmyIWjFrgx7g3Rge6QnYtUUG7lsZOy/u58sLflDVJqGpZ/n6w5IxbsOEMHJoWLx
         LPlu+cV5+8ceWv3YBlNUFdyVzqHwJw2bsuaSnJyrZ03n6h4t5y8M5RFaSbUTKNtEQCdF
         lSh0xoNgTMh7mYLxftxHkFxyVaqoLFGAXFT0hCG5Tz42tK6/koSR3JQ/OIigtyF7zED3
         2Ef6e9w05mVOj6hMJMN0+ncuK6ZHA57kN8B00T0TYX515LdoObKt1WGM9P883mZpcbOX
         iHo/1NA9DwLtPcgoHi4Lpzy70JGashAwcugXw+NStFtbIBVksZ1ZqVRUgIsczXttLSzo
         ZPHQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Edbc6i9vLRlYZRjZEvdXNiJt3IR3Pox3c4FjYRc03Jw=;
        b=wPedd47XgPy42XzOocbcDYZa2kp36PicvcnEpafK6SwJ7aomGVSfZGwdnszdqMg9/5
         V4s61vbVZWF8dyYgvhGW8hiiV32LQeCUCDqy7xx4KFR9bK4iYfyhuHsKCRzA9XQNWJUw
         TBYMf7UM6sukF+gjHR1rSU6ig/0WQNq7P3v1d/dSzvx7PAZ3QgZbsZpX12YReSnYdmfE
         t5TTNy0svFc1k6hu17+PGA1ufZUGOtURSK9tRrwAoubSDGXAnoXFE+BQgaX6KuAIDEpS
         x4cyKTqQddmHH0RDFd3yu4uXygiLVUeSozClHnQkn333l6e5xkIaw5O82tGfBNv32Dcd
         chZw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sOywesau;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Edbc6i9vLRlYZRjZEvdXNiJt3IR3Pox3c4FjYRc03Jw=;
        b=SBiT5p1XsXuCDRi3Y2czXSFmYkFoUPOZ5a5f5DyhbBlLv5hP5B/jwVs2ktInAr353t
         F1PfHor73+Q+fVq/QHEOYlASiKGSwY6xIWtKyZIgk3pdZIZ0BrcgZES3UJYCT9lIE5Pa
         AqmV33AtTG9Jn+ssrHaoWsdWH+9+mFWnAgk9O6mXzot6M3lrgCpQj5eiikv+lLSgcQEc
         MXRkaLcm8F28sHE4O4XNdpZbthRBvA8w127ye/A12M9K7b3SWl9g7XeOezXcGIkBqCVQ
         FSxnP5mBvObUvpRTvRrHTr6cqOUNDfiXQYi5kTPHAc5UDgoIyyPLGrtnupDju5SozozE
         lMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Edbc6i9vLRlYZRjZEvdXNiJt3IR3Pox3c4FjYRc03Jw=;
        b=YAhVuphSa47A0EipGUjLPkpi3ALT8B8Z2sY8xVvXprjq9HOXCDxl+DDfkHCofAGsCc
         oYy7F1p7i1FPJQt9e6OFusa2ZEbCMwg9P6v2fO23EdVr8KM0VtfgWRKT/BYT1nDdRjJT
         0BM01gWAtJpRqkooMlC9HCAUtS+EmJvWzAfFuJXWDgJg21d06JjL2Po20hmqx96oEGJj
         vM0+kQjwTLtaJUKKlFd33zz6+4lp622Ui5HpKJoqBcCnVRDB6GCgFXoIvjMB4nbUa0VC
         xoeKsPX21WIN8lk+OS01ZoBzUwaOPC5NFFv4ZhbplkwOcLIMMLO82lnHbcKsgEzcxUNZ
         c/ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bpEvHwC5rdwBafAeun2YLaJsWcIE3g3PUTSSytepBkr5ZODoH
	HK1gy8qsaLgECOTKXIpnNBE=
X-Google-Smtp-Source: ABdhPJz6AW2F3oX0qvfSFE5TMwupba0MRQWpp7hEmePSDF7rpBb1AsaKv2Ehy1kiBmqsrS2J2/MkZA==
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr6886726ljl.433.1603761947277;
        Mon, 26 Oct 2020 18:25:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls1777328ljd.8.gmail; Mon, 26
 Oct 2020 18:25:46 -0700 (PDT)
X-Received: by 2002:a2e:8986:: with SMTP id c6mr7641862lji.29.1603761945990;
        Mon, 26 Oct 2020 18:25:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603761945; cv=pass;
        d=google.com; s=arc-20160816;
        b=vhJMeNp2fbRQi0Z0iY4EeQFviJCIdlfC68dQyv95JWYutCRm4Swf6uUNtWqgU6+p6P
         9PqbrYTmXYCbX+swBSZYGdh/+i628rR6OaXtkY8eJalwuTaLzmKqCOKJd1+pSs/iHBlJ
         4MfGd9KA+HBe0XpOIPG0I/LDvpzTuWfvj6LvLVTLuybQN+d1/tGYvBYVSaQmaOz+wRG8
         bItGp31aCCMopJo5y+vuI6rTJwwX4IZuhNw4mccmCAhDXlkLAFIV8rvDzixdYsXZpnw3
         Jt9q8XLttDXAQdNgXliiS48Opafnw6FMIGlF5I3UjIcoZganEeuukPbzOMjU3NXJQNnx
         U8LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=CNTPHwSTnNm2lPNCFLTZwWBcogfRCC3wixwGQEGViZo=;
        b=vzjYVw0Pd4cCFmQG/KY7O3wGj35pLB8LTJJVaAIdtaJanYT4fILyp+c+5R7q4fHFKR
         F+NCIfD0GPU29JZ6chhtGHot2fjQFRTOt92dF0S2GdEcEEsvGIjp/gzyi0ID79jnNbKY
         rcYFmveIb3cks0jWQqDA3btYRo+ihE0mrTsSHtJeNSHy6Wh2Wiau63r+m/kH64jJJbwn
         tOMHCbQfo0d6AOnG4ahYyyN+SFc4DDr8fkEgauLVlcnRBeioNNk+dA5TloSw9SMBwKBe
         ClAKHboPYIyp/iD1hqG4bD/vdV8cLaKWbxg1CEiiwdtQ2UVaBgSaeDqFbItRooyWmEpj
         Nj9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sOywesau;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com. [40.107.22.55])
        by gmr-mx.google.com with ESMTPS id w28si1646lfq.3.2020.10.26.18.25.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 18:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.55 as permitted sender) client-ip=40.107.22.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeimaO21Oaptu5z5qAuPeVZwOTVddCUk0CdjAg1y98epjI2lM0KgSNmZEyplOSqVmYMrnF8TM4z9Z7cCXD8/Z6yFNWGOEAaLmsNhskV//Y78ZVWvrj+mdKYg2YaJLoJbF7v995a1xUp9hwckvwWKExCUAaGdiKxhV0tuBKB9AepGdZ/T7jitKDTL16DN4nuaL3TzGAg/FYxm1bzFI3rZHQrU0tPYxnLaGlw9Zai63zMp12rHjbWlgzz9cU917vabQEfMF2QSw1vQtiLDb9HqqlVtJ+9Gn10uYUI8PSGVrjnBdV/D3W7OCItxoBI17iqI3+NyYUecnkcbP0nchB19yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNTPHwSTnNm2lPNCFLTZwWBcogfRCC3wixwGQEGViZo=;
 b=PGH3zkISyIZ8D01+UDf3/CBegn70bnexaj6gBwlX+IKIjRivcmPdjaJvyAV73+qEPFRvVhnnMnyNGiOu0wIs1BV97AnPQJSzaS0+HPaSQim6VglTaOut5+9IB/Zdu2QAbd3jaZTZ5KL2lsI7RxYn9B7WmNGS+mo4ld7DCtSrOqtOOFYwx12m+x1i3J9UnVy3BIF3UPyXSt4uBe5vovVdoinyl4HnxRpjMOU7kqQnlBNFkCepwavYuBIzJ+cbc3+9vJo6wOGg0Eq+E9K2tnS5OROaVHYi5xO4m6JV+UtnizP2pPPUi6q6B0VLtwMpULvv2+RSXgxHj5n/B9XoaRA5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Tue, 27 Oct
 2020 01:25:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 01:25:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH v2 00/46] arm64: Rework SMMUv2 support
Thread-Topic: [PATCH v2 00/46] arm64: Rework SMMUv2 support
Thread-Index: AQHWogQZCtqK6USfUEmBoA7VLqZXd6mqN+CAgACCyvA=
Date: Tue, 27 Oct 2020 01:25:43 +0000
Message-ID: <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
In-Reply-To: <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd92c10c-02c6-453d-ef8b-08d87a173929
x-ms-traffictypediagnostic: DB7PR04MB5244:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5244B1C02F6F3B0D75E3A41188160@DB7PR04MB5244.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fzd/G8nqBOX9kARcPDiGivP9CRPmvoOOgcwblIqMYVioaZvTeyiTDpFwQsTZ68PQvy6buf7Yj+yxMejbNicUyDYjaR9E/8aNsS1UhgLTASDS50iiY7cgwWIu+SFJW8GnUR+dMq2jOqb2JXoICRhNMTEk5sWrcnbIf+UbwuH1d7YtuBAepKEdhUvu/WARWlClOdUQOnNt1JhCws+JmUWHBDtfLFCyFv6bMxg0XdhLdLt6wY6JOLTiDWwt+8A8wi2zt4tYm9wa8eT5JuE9Kj37xFRuVc/wUQsEzVurovDUcDoSdiuauwff+CsN9gGOrwOoxxvTXbH9lWvuT8udWmndVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(8676002)(66556008)(6636002)(7696005)(64756008)(478600001)(26005)(8936002)(6506007)(33656002)(44832011)(316002)(186003)(9686003)(76116006)(66476007)(55016002)(2906002)(53546011)(110136005)(83380400001)(5660300002)(71200400001)(86362001)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rqzExRJTQFxqDidQQRQtdldgHePj3vZiLeiEsEE1BKRRPAzWCb2FTsLMiNV/PG1QZjX0TTc3qliBDsNcL/TBvXYWIrOu4f3qZGj7L3bd7uzKhLiH/G3ESH/eLQsrVdpkT2U98Lxw3z5TeXgNlCDVnch0ZQaSnWWfgVnsiuanN2ydEJB9U6fpwP7Vj7r0KUn4XCwgrFXcDlaved5knBBip7SyXnA5cNWCeGjavNdPrWC4sUYdHt5FWyIyrKX4cjdeJhrsXtIGCYCINwmWdbffAzJsi00lY6OL8qlXFQq6lpjMs/stEbsMK/TQwMO8LDpozYiMjGxRJ2dDIrFPJrxJb0eI15KQU94SqoLBr/t1ldpEvofHk/+go0ShrNk++suH2uCHn8FhjXDZ1DhjWVcq3i2PsDmC9qKkZZZ4cf+mLWSCk4tNY2MaDZGuwwenUXyAfis4vNb0btpe74l5A3LvfqJ8KDJ2Pq3pvWNusDRqdgUdOQz9d/nSFY5uO9Ovxjahm8TszHAGPFZDvDvWCSeTMghq84cgBWht1OaYFK8cz7e9tAWLSFVKTJ3uQNqHkghOXLpzp6kPbJZ07hROiD7tQ9lyJABDOSnc/JE4vHgnEoEN1EzLpebmHgl+52OkahZxeq4YwqTr2FSGTvkyWEk8XQ==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd92c10c-02c6-453d-ef8b-08d87a173929
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 01:25:43.3631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOrc+/dpNwZgzUTvS3mgn386kx/L82l60niEm3nxrhM4W8ARRLvU/4zrsfgzdGkeHeC7+V6iXEe6VLHVAGTTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sOywesau;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Jan,

> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
> 
> On 14.10.20 10:28, Jan Kiszka wrote:
> > Changes in v2:
> >  - map 52-bit parange to 48
> >
> > That wasn't the plan when I started, but the more I dug into the
> > details and started to understand the hardware, the more issues I
> > found and the more dead code fragments from the Linux usage became
> visible.
> >
> > Highlights of the outcome:
> >  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
> >    to understand that...)
> >  - Fix programming of CBn_TCR and TTBR
> >  - Fix TLB flush on cell exit
> >  - Fix bogus handling of Extended StreamID support
> >  - Do not pass-through unknown streams
> >  - Disable SMMU on shutdown
> >  - Reassign StreamIDs to the root cell
> >  - 225 insertions(+), 666 deletions(-)
> >
> > The code works as expected on the Ultra96-v2 here, but due to all the
> > time that went into the rework, I had no chance to bring up my MX8QM
> > so far. I'm fairly optimistic that things are not broken there as
> > well, but if they are, bisecting should be rather simple with this
> > series. So please test and review.
> >
> 
> Alice, Peng, already had a chance to review or test (ie. next)?

I gave a test, sometimes I met SDHC ADMA error when
`jailhouse enable imx8qm.cell`, sometimes it work well.

I suspect when during jailhouse enable phase, there might be
ongoing sdhc transactions not finished, not sure.

I have not find time to look into details.

Anyway, you could check in to master I think, we could address
the issue later when I have time.

Thanks,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
