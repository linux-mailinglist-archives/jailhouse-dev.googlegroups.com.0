Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBI5J3H4QKGQEWXYVDAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B472446C7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 11:08:52 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id u11sf1888029lfg.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 02:08:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597396132; cv=pass;
        d=google.com; s=arc-20160816;
        b=zFe8YYrM45ajCjBsYWbWZYCcwLXYGbKKeFm0sTcw0rAREzy/azwy/6cVysQOJI1YmQ
         vxkhdLENTEepNM5sqPeFpPZW3aOH/30vwRBTfZXUj6JTGqzgtg4I2OSuxic0xeA+2oFl
         HOlGItX4CiI87J6rXOh8XRD2iZ57W+iW7pI2sc3lXQgasqrjDHyl0oRXeMYbUTm3f0O/
         DYfCj1yR3YpYwGB+2E25Mr6fJtt0/I40MsZBOGYrrQWZeDDxrLc+9QRXOW6/TfQVohwi
         WU24OdwdaThUn5VUL0U9CJ4qaDOgWWewkkLX5Eii6Vel1ezjI8Qk5gz2UIkbbldGKQP/
         WLTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=V4HZ97BhL5An4HsxWklhzd8ZnIkGD4T+UcEczWsklao=;
        b=Yd+COWSeu9/yLjBNnj7s400LJHYkOtkDPDdR1fcEdxkPN1AjJ6gADXfdgFlWAh1FT+
         l3zwPUK0eyNno27jJDYgTNnxMnvvWhvBdTgFNnsJmVJDOqkZY5uRQY5+6ekvaO07O8oj
         +n4aTsn+I+500ILSdhnkSZ8c3nHwOsinE4SCjM5l2SNBu+Qrmx+6gWKkWZVjbJcuZP0G
         x6OKvNaFDuR0Botb9Ug1fby/5LcyvU9b7Cs9YWDkhw7Dv+e1jj8aN18rXVQZcVkFFImh
         Uovj1ogf2Vbbvjy4CyF1JLp04ae1HBkwi+gP5He5gfweUJwGtaEwehVKfvUzmfP7M9V/
         BzFA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jhRCWvIH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V4HZ97BhL5An4HsxWklhzd8ZnIkGD4T+UcEczWsklao=;
        b=e4ACWPinwmQrBRT9gbsNEodlFnu5pCvDTSMx+DyGpA1OJVXPIXEsovCrrJ4flJ91rV
         cgCgg4ceZZPHyxVGCEd/lcnN6YBIGSzzR4CU3h8DvAdrXputhG68sKg9b/ysYM3t8bDp
         Tm7026LEbTJSv0erezNM8zV+2uIL3uO/d6jc55uFuEUvkyOMS5cM4rnqPbd5Z0eok/V5
         F4hxs4XLf+AKzpjixYuq1B/gCAD9uPl7JKHUHDKiIwaOD7vWzaz/2ioqqmOhXcOkN5FY
         FpSyeHKKsLKNNrJ0lQahep+4l1GCNiWP75uxXNLl7uLS+tYpqC3eX+VFRhsh2JhxygK8
         MwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V4HZ97BhL5An4HsxWklhzd8ZnIkGD4T+UcEczWsklao=;
        b=UTF6CjDsfRgLzMfdm7jj2f+kLFDjf+01Ef8vFtzj57yCQs6GVydGM73u5D+G18+N2m
         g/yJP8GJ+0DITkN1QPu9OSsrCkJ/WhZ4d41Gu0fUqGx9rLskiCfmZ0oo1+JgIjh476Qu
         gqq1yBUOoynt2DbhChvcmHDBR8dWXwiOteJpVr3YBzzRLtVFixtTxasQaf+ubC12tr6A
         zU5ZC+DiKqMKgQpbC5HxF6zCqreqbUwaq/7KJ2Id67saPuAssD4hX5Q/XsVpntPg2zgn
         +QPsJ5wVV3V+8Gu2TB3D5zHHLy+OIIJwL1DUiaGsVPNj7dSaIsZKOvxVKrtSPADwv/Ea
         Klmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325E8VExua4UZFvDC3qWy+qSkkN355tEoBDpY+OHWUqPEDm276/
	JG/pqzlxAWCkKgleMYjhsv4=
X-Google-Smtp-Source: ABdhPJxWzb4CdowDHTmgswFnhe+HGZqHUCmpWteXOIjbwNGC3B7ro1umJB78jmQJgdtFenG5oWqk9Q==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr991530ljp.84.1597396132284;
        Fri, 14 Aug 2020 02:08:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c18:: with SMTP id h24ls1616819ljc.6.gmail; Fri, 14 Aug
 2020 02:08:51 -0700 (PDT)
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr918618ljj.270.1597396131442;
        Fri, 14 Aug 2020 02:08:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597396131; cv=pass;
        d=google.com; s=arc-20160816;
        b=AyGNtvbYhBTE6MOAFfdOIRtxH0ZVtzGmvAEOEmAWjKAse69FH+hAhVlY1QUL2Cj78g
         4GXfosy6eqCUqcuWriuhcQCrcxComimggmIIkaE1AgX1Y+ZRUAk5KMEETvjL4Y0Bwm/n
         MPZtKosOee0FQSOxrLEZHTp/5Qq3mUzR33tR47uxx/kgzOHqNdOk4agsyYKY2zmCm/Up
         Op0zq/t4gg3YIiSM3INLtZv4AMqRNnCpmWEnbJ9nmdDzEpxscnqNrEKDWHF3RT3G8Usg
         MZG02MU/PewK0AoVDniYNEE0dQeg6ZHqcXcLz2gSs+aK9oghaV8entuKyuL8HwBZkUAp
         ZixA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=nIHvB/M2nBrxlA5q5GBwx/q6dZdYOC2L5BJObhA/4+M=;
        b=oBUO+7KmUZdMOCaf0wPNCylwpjkz3Hl7dYSn7n49dE0WkvgJR/IggbhebOe42v67K3
         2fJ3iaq8DD9PHZlXmO9sqwxiKl4gswRtLZyjGsZxs7zwZeUHmTf2uGDzLvRBuswfB623
         mDIIsBj6Zf7agB40kBcq9JYYMUxP25HuaxSnPTV2f/62ikkjq1pnU6T9omqXI+PUhEfT
         t5nx8r1vx/hVZsZNru4Pytjc1sfDPj5SUDT7q1G1/QrUw6QrzlEONhNas6GHq2dmwoB+
         IwNTm7NC7ttwnCNKqP1dpk/dQ8YNUOa+afXkQHOkhSK84VxcmKU6lc/JTd0ik2walewY
         GI4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jhRCWvIH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00073.outbound.protection.outlook.com. [40.107.0.73])
        by gmr-mx.google.com with ESMTPS id o13si306465lfc.0.2020.08.14.02.08.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 02:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.73 as permitted sender) client-ip=40.107.0.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZaaVNNF26Tc5zAjJx0j33QrctMwTcHYXZ52WDwe04xfLbA1P25dIgayddsMFT5Ku5az1AYUb6dEKuLy7sfQdx2ZSHWcH0/skL0IYOhs0wOnPJqqr4UX4YU3WLPGctDbTJIuTXroB2mvnbzpNYNAVI5aTmSlqMZAbO35HwTMN4JzCJ2OkAHg5v8c+V9lA2IGG+SFR1Kj6lrQjMI43YShCcNUIr688RRd7izY5aC+rakHrkdbPu7EeOHi5mlJnAK8AFKJNE3SjGbhHPQk6X8AobtsBT5x1MzsH11KPwZKwNgbggCh8jVoAlBguP1BF/fGBseGd7knG4KOdRKOoGO9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIHvB/M2nBrxlA5q5GBwx/q6dZdYOC2L5BJObhA/4+M=;
 b=HKYSOTF+ApQFuCVbGrkyINjPdCN+IWs+vjqaAsfs+om+tmqq5MPnyq3JYEEoyNk5ceYwwFNlmfRXOkssc3vXGsyJBG7fZNNisiIyadzpZ6k1zePiA/Y9TSFJ3/Zfi7xBo9/H3D4fRV/i+ZzEkrY4Z6mCOCzI1rxK1gGpBP8i0QknLoA+Tw/o2bE3e10cdY18Kq59ocYAQDa6rea1WHhCsAk14h0EVialARvkgHT4UCvreFv1DfNY8NBZAX4+bhBDGJtMPtnKsJW40ghBGF5/Q5LRUIL1AgGravnT/c8TemqOOJiLh6wl3moxQY4CTCEUqiyupOKVtqRRt8ls1DtP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 09:08:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.015; Fri, 14 Aug
 2020 09:08:49 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 06/10] Add libbaremetal
Thread-Topic: [PATCH 06/10] Add libbaremetal
Thread-Index: AQHWbGRD5zCxHBIdykSEGCFUwoysfqkyir8AgATRQiA=
Date: Fri, 14 Aug 2020 09:08:49 +0000
Message-ID: <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
In-Reply-To: <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 80fec034-7a9c-4219-510b-08d84031a882
x-ms-traffictypediagnostic: DB7PR04MB5081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB50813B271FB9CE95C0751A5788400@DB7PR04MB5081.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s4loQrDer6nBwYPofMjvSM3JButAGEAanzwa2j3n5Hy1Mosgpc9NB6AYT/vnjLh9LdPbZJwEO1FH9mZTFKnYvnq7EWEoCN3l7/SBFOboclHzD/6YoKlXALP7b2mIlUWai418HoBUutMHP/uFh+TLwsUb373N044+tVtBF0yLKlcXJCGk//9y9m8sDrtA2LSQNkEXcXEWNRQ8GTA4I7bKgr4f7pGvATbDL1nEcQfNbUAPn9pzfeCnbWwQh4rErjPKDT30kFy1rZDje56o/J0XJ2DVzuHwJvRTAKP5jWBuEvd9wSBEE185ar06/BErKRE9lrT8VBSykrgXFqplenl7/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(66476007)(64756008)(66556008)(66446008)(55016002)(54906003)(9686003)(71200400001)(186003)(53546011)(4326008)(26005)(6506007)(86362001)(76116006)(66946007)(2906002)(316002)(44832011)(6916009)(83380400001)(8936002)(8676002)(33656002)(5660300002)(478600001)(52536014)(30864003)(7696005)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uZK4PznKZ1+uZn4tF3JPkUFFAW4iCLTK+B+TP5AzGcUA+BIPT/LTRLWb5Mto03hWSL5c93kHflmzEIGbPbqp3cTUEWKwmsFTDVlwzNdmfaawLNqBb1O3di8PUZO72NjeQcL9RI2CcrjAr35Hii8dTpXbjyFnRxvJ+XCaS/TK1TI25/YGx8d7e9ykN+KK5Wpi7Vbfq40XmMuUpSy4fVh9fawkt2MC65ZR0mdJApds1NrtM6K8j3RjOYAqMGYtniCcZXGgPSo6Woxv7jZLdK4s50z51tdcjdYhUARe46kdx1Q2CKrBOQQCAkHdxXqC4VUH5GF66rA0P/jmI2+Hpt7PQAnJ6vUoPEjKdVEc0CfDP4aOc9S/+YurWxIrMTnC3Zp2pu4cXYBAGqIacbw7p/eStChUWWVF2szSWmpJLh4SScFIXdAl/3Tb6IMBNZnUpEumWRxU3aQCT69RUkTBg+uVkVleHdXB1i6AMWdUOJJtBjB4bi8febk2bjdQ/KcTucNgQfC7UYlQhdFi7PW7JVEgT0k0S9fH1X3beqoXUoYDMuwV8D5AS0Ui2b2Amx170oGNKSCtjmBDJ3Ds05f96Ki3o6upcnfvA9kVqQOGMYEzxcur9IqCChIs5HhBIml1knoukeqtMD2cuqs9IfIDCryEyw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fec034-7a9c-4219-510b-08d84031a882
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 09:08:49.6233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1aL249JdUmYqQR8lbqzfx3vamlTvgiN/kKDShn4x/MFiJInYVNvSBNq7LEUxDg2sk+yVrlpYI/qrt6Ig985KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=jhRCWvIH;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> 
> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add libbaremetal for sharing code between inmates and jailhouse
> > baremetal loader.
> >
> > The Makefile code is copied from inmates, currently only string.c is
> > moved from inmates to libbaremetal. In future, we might need to share
> > uart/mmu and etc.
> 
> Might quickly become confusing to have two libs. What prevents renaming
> inmates/lib completely into libbaremetal? Sure, there are some jailhouse
> specifics in inmates/lib, but those could likely be put in some corner.

How about rename inmates to baremetal?
And add bootloader stuff under baremetal?

Thanks,
Peng.

> 
> Jan
> 
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  Kbuild                                 |  4 +-
> >  inmates/Makefile                       |  4 ++
> >  inmates/lib/arm-common/Makefile.lib    |  2 +-
> >  inmates/lib/arm/Makefile.lib           |  2 +-
> >  inmates/lib/arm64/Makefile.lib         |  2 +-
> >  inmates/lib/x86/Makefile               |  2 +-
> >  inmates/lib/x86/Makefile.lib           |  3 +-
> >  libbaremetal/Makefile                  | 46
> +++++++++++++++++++++++
> >  libbaremetal/arm-common/Makefile.lib   | 41 ++++++++++++++++++++
> >  libbaremetal/arm/Makefile              | 44
> ++++++++++++++++++++++
> >  libbaremetal/arm/Makefile.lib          | 63
> +++++++++++++++++++++++++++++++
> >  libbaremetal/arm64/Makefile            | 44
> ++++++++++++++++++++++
> >  libbaremetal/arm64/Makefile.lib        | 63
> +++++++++++++++++++++++++++++++
> >  {inmates/lib => libbaremetal}/string.c |  0
> >  libbaremetal/x86/Makefile              | 66
> ++++++++++++++++++++++++++++++++
> >  libbaremetal/x86/Makefile.lib          | 69
> ++++++++++++++++++++++++++++++++++
> >  16 files changed, 449 insertions(+), 6 deletions(-)  create mode
> > 100644 libbaremetal/Makefile  create mode 100644
> > libbaremetal/arm-common/Makefile.lib
> >  create mode 100644 libbaremetal/arm/Makefile  create mode 100644
> > libbaremetal/arm/Makefile.lib  create mode 100644
> > libbaremetal/arm64/Makefile  create mode 100644
> > libbaremetal/arm64/Makefile.lib  rename {inmates/lib =>
> > libbaremetal}/string.c (100%)  create mode 100644
> > libbaremetal/x86/Makefile  create mode 100644
> > libbaremetal/x86/Makefile.lib
> >
> > diff --git a/Kbuild b/Kbuild
> > index 0b25e26e..dc6423ad 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -51,7 +51,7 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
> >  $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
> >  	$(call if_changed,gen_pci_defs)
> >
> > -subdir-y := hypervisor configs inmates tools
> > +subdir-y := hypervisor configs inmates tools libbaremetal
> >
> >  subdir-ccflags-y := -Werror
> >
> > @@ -62,6 +62,8 @@ ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
> >
> >  $(obj)/driver $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
> >
> > +$(addprefix $(obj)/,inmates): $(addprefix $(obj)/,libbaremetal)
> > +
> >  $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
> >
> >  $(obj)/tools: $(GEN_PCI_DEFS_PY)
> > diff --git a/inmates/Makefile b/inmates/Makefile index
> > 095055c8..44354c87 100644
> > --- a/inmates/Makefile
> > +++ b/inmates/Makefile
> > @@ -15,7 +15,11 @@
> >  INMATES_LIB = $(src)/lib/$(SRCARCH)
> >  export INMATES_LIB
> >
> > +BAREMETAL_LIB = $(src)/../libbaremetal/$(SRCARCH) export
> > +BAREMETAL_LIB
> > +
> >  INCLUDES := -I$(INMATES_LIB) \
> > +	    -I$(BAREMETAL_LIB)/include \
> >  	    -I$(src)/../include/arch/$(SRCARCH) \
> >  	    -I$(src)/lib/include \
> >  	    -I$(src)/../include	\
> > diff --git a/inmates/lib/arm-common/Makefile.lib
> > b/inmates/lib/arm-common/Makefile.lib
> > index 3d7b335d..d99102a9 100644
> > --- a/inmates/lib/arm-common/Makefile.lib
> > +++ b/inmates/lib/arm-common/Makefile.lib
> > @@ -36,7 +36,7 @@
> >  # THE POSSIBILITY OF SUCH DAMAGE.
> >  #
> >
> > -objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o
> > ../uart-8250.o
> > +objs-y := ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
> >  objs-y += ../printk.o ../pci.o
> >  objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o  objs-y
> > += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
> > diff --git a/inmates/lib/arm/Makefile.lib
> > b/inmates/lib/arm/Makefile.lib index 0976f894..4b4165bb 100644
> > --- a/inmates/lib/arm/Makefile.lib
> > +++ b/inmates/lib/arm/Makefile.lib
> > @@ -56,7 +56,7 @@ endef
> >
> >  .SECONDEXPANSION:
> >  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > -		   $(INMATES_LIB)/lib.a
> > +		   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
> >  	$(call if_changed,ld)
> >
> >  $(obj)/%.bin: $(obj)/%-linked.o
> > diff --git a/inmates/lib/arm64/Makefile.lib
> > b/inmates/lib/arm64/Makefile.lib index 0976f894..6d5df339 100644
> > --- a/inmates/lib/arm64/Makefile.lib
> > +++ b/inmates/lib/arm64/Makefile.lib
> > @@ -56,7 +56,7 @@ endef
> >
> >  .SECONDEXPANSION:
> >  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > -		   $(INMATES_LIB)/lib.a
> > +                   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
> >  	$(call if_changed,ld)
> >
> >  $(obj)/%.bin: $(obj)/%-linked.o
> > diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile index
> > 40d3eba2..74e38b5a 100644
> > --- a/inmates/lib/x86/Makefile
> > +++ b/inmates/lib/x86/Makefile
> > @@ -42,7 +42,7 @@ always := lib.a lib32.a
> >
> >  TARGETS := cpu-features.o excp.o header-common.o irq.o ioapic.o
> > printk.o  TARGETS += setup.o uart.o -TARGETS += ../alloc.o ../pci.o
> > ../string.o ../cmdline.o ../setup.o ../test.o
> > +TARGETS += ../alloc.o ../pci.o ../cmdline.o ../setup.o ../test.o
> >  TARGETS += ../uart-8250.o ../printk.o  TARGETS_32_ONLY :=
> header-32.o
> > TARGETS_64_ONLY := mem.o pci.o smp.o timing.o header-64.o diff --git
> > a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib index
> > 6190315b..754dc426 100644
> > --- a/inmates/lib/x86/Makefile.lib
> > +++ b/inmates/lib/x86/Makefile.lib
> > @@ -55,7 +55,8 @@ endef
> >  # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
> >  .SECONDEXPANSION:
> >  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > -		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> > +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) \
> > +		   $(BAREMETAL_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> >  	$(call if_changed,ld)
> >
> >  $(obj)/%.bin: $(obj)/%-linked.o
> > diff --git a/libbaremetal/Makefile b/libbaremetal/Makefile new file
> > mode 100644 index 00000000..f36a2d09
> > --- /dev/null
> > +++ b/libbaremetal/Makefile
> > @@ -0,0 +1,46 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +Siemens AG, 2013 # # Authors:
> > +#  Jan Kiszka <jan.kiszka@siemens.com> # # This work is licensed
> > +under the terms of the GNU GPL, version 2.  See # the COPYING file in
> > +the top-level directory.
> > +#
> > +
> > +-include $(GEN_CONFIG_MK)
> > +
> > +BAREMETAL_LIB := $(src)/$(SRCARCH)
> > +export BAREMETAL_LIB
> > +
> > +INCLUDES := -I$(BAREMETAL_LIB) \
> > +	    -I$(src)/../include/arch/$(SRCARCH) \
> > +	    -I$(src)/include \
> > +	    -I$(src)/../include
> > +
> > +ifeq ($(subst arm64,arm,$(SRCARCH)),arm) INCLUDES +=
> > +-I$(src)/../hypervisor/arch/arm-common/include
> > +INCLUDES += -I$(src)/arm-common/include endif
> > +
> > +LINUXINCLUDE  := $(INCLUDES)
> > +KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE KBUILD_CFLAGS := -g -Os
> > +-Wall -Wstrict-prototypes -Wtype-limits \
> > +		 -Wmissing-declarations -Wmissing-prototypes \
> > +		 -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
> > +		 -fno-common -fno-stack-protector -ffreestanding \
> > +		 -ffunction-sections \
> > +		 -D__LINUX_COMPILER_TYPES_H
> > +ifneq ($(wildcard $(INC_CONFIG_H)),)
> > +KBUILD_CFLAGS += -include $(INC_CONFIG_H) endif
> > +
> > +OBJCOPYFLAGS := -O binary
> > +# prior to 4.19
> > +LDFLAGS += --gc-sections -T
> > +# since 4.19
> > +KBUILD_LDFLAGS += --gc-sections -T
> > +
> > +subdir-y := $(SRCARCH)
> > diff --git a/libbaremetal/arm-common/Makefile.lib
> > b/libbaremetal/arm-common/Makefile.lib
> > new file mode 100644
> > index 00000000..7b650a44
> > --- /dev/null
> > +++ b/libbaremetal/arm-common/Makefile.lib
> > @@ -0,0 +1,41 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +OTH Regensburg, 2016 # # Authors:
> > +#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> # # This work is
> > +licensed under the terms of the GNU GPL, version 2.  See # the
> > +COPYING file in the top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +objs-y := ../string.o
> > +
> > +common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> > diff --git a/libbaremetal/arm/Makefile b/libbaremetal/arm/Makefile new
> > file mode 100644 index 00000000..952b1475
> > --- /dev/null
> > +++ b/libbaremetal/arm/Makefile
> > @@ -0,0 +1,44 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +Siemens AG, 2015, 2016 # # Authors:
> > +#  Jan Kiszka <jan.kiszka@siemens.com> # # This work is licensed
> > +under the terms of the GNU GPL, version 2.  See # the COPYING file in
> > +the top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +include $(INMATES_LIB)/Makefile.lib
> > +include $(INMATES_LIB)/../arm-common/Makefile.lib
> > +
> > +always := lib.a
> > +
> > +lib-y := $(common-objs-y)
> > diff --git a/libbaremetal/arm/Makefile.lib
> > b/libbaremetal/arm/Makefile.lib new file mode 100644 index
> > 00000000..0976f894
> > --- /dev/null
> > +++ b/libbaremetal/arm/Makefile.lib
> > @@ -0,0 +1,63 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +ARM Limited, 2014 # Copyright (c) Siemens AG, 2014 # # Authors:
> > +#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com> #  Jan
> > +Kiszka <jan.kiszka@siemens.com> # # This work is licensed under the
> > +terms of the GNU GPL, version 2.  See # the COPYING file in the
> > +top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +-include $(GEN_CONFIG_MK)
> > +
> > +LINUXINCLUDE += -I$(INMATES_LIB)/include LINUXINCLUDE +=
> > +-I$(INMATES_LIB)/../arm-common/include
> > +
> > +define DECLARE_TARGETS =
> > + _TARGETS = $(1)
> > + always := $$(_TARGETS)
> > + # $(NAME-y) NAME-linked.o NAME.bin
> > + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> > +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS) endef
> > +
> > +# prevent deleting intermediate files which would cause rebuilds
> > +.SECONDARY: $(addprefix $(obj)/,$(targets))
> > +
> > +.SECONDEXPANSION:
> > +$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > +		   $(INMATES_LIB)/lib.a
> > +	$(call if_changed,ld)
> > +
> > +$(obj)/%.bin: $(obj)/%-linked.o
> > +	$(call if_changed,objcopy)
> > diff --git a/libbaremetal/arm64/Makefile b/libbaremetal/arm64/Makefile
> > new file mode 100644 index 00000000..6d3cf399
> > --- /dev/null
> > +++ b/libbaremetal/arm64/Makefile
> > @@ -0,0 +1,44 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +Siemens AG, 2015 # # Authors:
> > +#  Jan Kiszka <jan.kiszka@siemens.com> # # This work is licensed
> > +under the terms of the GNU GPL, version 2.  See # the COPYING file in
> > +the top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +include $(BAREMETAL_LIB)/Makefile.lib include
> > +$(BAREMETAL_LIB)/../arm-common/Makefile.lib
> > +
> > +always := lib.a
> > +
> > +lib-y := $(common-objs-y)
> > diff --git a/libbaremetal/arm64/Makefile.lib
> > b/libbaremetal/arm64/Makefile.lib new file mode 100644 index
> > 00000000..c4560721
> > --- /dev/null
> > +++ b/libbaremetal/arm64/Makefile.lib
> > @@ -0,0 +1,63 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +ARM Limited, 2014 # Copyright (c) Siemens AG, 2014 # # Authors:
> > +#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com> #  Jan
> > +Kiszka <jan.kiszka@siemens.com> # # This work is licensed under the
> > +terms of the GNU GPL, version 2.  See # the COPYING file in the
> > +top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +-include $(GEN_CONFIG_MK)
> > +
> > +LINUXINCLUDE += -I$(INMATES_LIB)/include LINUXINCLUDE +=
> > +-I$(INMATES_LIB)/../arm-common/include
> > +
> > +define DECLARE_TARGETS =
> > + _TARGETS = $(1)
> > + always := $$(_TARGETS)
> > + # $(NAME-y) NAME-linked.o NAME.bin
> > + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> > +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS) endef
> > +
> > +# prevent deleting intermediate files which would cause rebuilds
> > +.SECONDARY: $(addprefix $(obj)/,$(targets))
> > +
> > +.SECONDEXPANSION:
> > +$(obj)/%-linked.o: $$(addprefix $$(obj)/,$$($$*-y)) \
> > +		   $(INMATES_LIB)/lib.a
> > +	$(call if_changed,ld)
> > +
> > +$(obj)/%.bin: $(obj)/%-linked.o
> > +	$(call if_changed,objcopy)
> > diff --git a/inmates/lib/string.c b/libbaremetal/string.c similarity
> > index 100% rename from inmates/lib/string.c rename to
> > libbaremetal/string.c diff --git a/libbaremetal/x86/Makefile
> > b/libbaremetal/x86/Makefile new file mode 100644 index
> > 00000000..e4e72b5b
> > --- /dev/null
> > +++ b/libbaremetal/x86/Makefile
> > @@ -0,0 +1,66 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +Siemens AG, 2015, 2016 # # Authors:
> > +#  Jan Kiszka <jan.kiszka@siemens.com> # # This work is licensed
> > +under the terms of the GNU GPL, version 2.  See # the COPYING file in
> > +the top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +include $(INMATES_LIB)/Makefile.lib
> > +
> > +always := lib.a lib32.a
> > +
> > +TARGETS := += ../string.o
> > +
> > +lib-y := $(TARGETS) $(TARGETS_64_ONLY) lib32-y := $(TARGETS:.o=-32.o)
> > +$(TARGETS_32_ONLY)
> > +
> > +quiet_cmd_link_archive32 = AR      $@
> > +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> > +
> > +$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
> > +	$(call if_changed,link_archive32)
> > +
> > +targets += $(lib32-y)
> > +
> > +# Code of this object is called before SSE/AVX extensions are
> > +available. Ensure # that the compiler won't generate unsupported
> instructions for this file.
> > +CFLAGS_cpu-features.o += -mno-sse
> > +
> > +$(obj)/%-32.o: c_flags += -m32
> > +$(obj)/%-32.o: $(src)/%.c FORCE
> > +	$(call if_changed_rule,cc_o_c)
> > +
> > +$(obj)/%-32.o: a_flags += -m32
> > +$(obj)/%-32.o: $(src)/%.S FORCE
> > +	$(call if_changed_rule,as_o_S)
> > diff --git a/libbaremetal/x86/Makefile.lib
> > b/libbaremetal/x86/Makefile.lib new file mode 100644 index
> > 00000000..6190315b
> > --- /dev/null
> > +++ b/libbaremetal/x86/Makefile.lib
> > @@ -0,0 +1,69 @@
> > +#
> > +# Jailhouse, a Linux-based partitioning hypervisor # # Copyright (c)
> > +Siemens AG, 2013, 2014 # # Authors:
> > +#  Jan Kiszka <jan.kiszka@siemens.com> # # This work is licensed
> > +under the terms of the GNU GPL, version 2.  See # the COPYING file in
> > +the top-level directory.
> > +#
> > +# Alternatively, you can use or redistribute this file under the
> > +following # BSD license:
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +#
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +#
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in the
> > +#    documentation and/or other materials provided with the
> distribution.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A
> > +PARTICULAR PURPOSE # ARE DISCLAIMED. IN NO EVENT SHALL THE
> COPYRIGHT
> > +HOLDER OR CONTRIBUTORS BE # LIABLE FOR ANY DIRECT, INDIRECT,
> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR # CONSEQUENTIAL DAMAGES
> > +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF # SUBSTITUTE
> GOODS OR
> > +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS #
> INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN #
> CONTRACT,
> > +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) #
> > +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF # THE POSSIBILITY OF SUCH DAMAGE.
> > +#
> > +
> > +-include $(GEN_CONFIG_MK)
> > +
> > +KBUILD_CFLAGS += -m64 -mno-red-zone
> > +LINUXINCLUDE += -I$(INMATES_LIB)/include
> > +
> > +define DECLARE_TARGETS =
> > + _TARGETS = $(1)
> > + always := $$(_TARGETS)
> > + # $(NAME-y) NAME-linked.o NAME.bin
> > + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> > +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS) endef
> > +
> > +# prevent deleting intermediate files which would cause rebuilds
> > +.SECONDARY: $(addprefix $(obj)/,$(targets))
> > +
> > +# obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
> > +.SECONDEXPANSION:
> > +$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix
> $$(obj)/,$$($$*-y)) \
> > +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> > +	$(call if_changed,ld)
> > +
> > +$(obj)/%.bin: $(obj)/%-linked.o
> > +	$(call if_changed,objcopy)
> > +
> > +# 32-bit (i386) support
> > +define DECLARE_32_BIT =
> > + CFLAGS_$(1).o := -m32 -msse
> > + LDFLAGS_$(1)-linked.o := /dev/null -m elf_i386 -T
> > + $(1)_32 := y
> > +endef
> >
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760040A34FE70576005395E88400%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
