Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBS5D5H4QKGQEOJCEYTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 696742463A6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:45:48 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id f14sf6759222wrm.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 02:45:48 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597657548; cv=pass;
        d=google.com; s=arc-20160816;
        b=GRJWq+qImWxQSNEDYTfBxswj/1WNdDTyGz89Eb5MhFQj99FuNIxYSRqRwggGdHofYQ
         eEhAabYOm33diVvrhYT+WoocL+M7p0zkGslj2xNln4F7OqLzuXUtWnOhsieV3PIS03s/
         p+4fBFRhDqYr0E2CWil7n/aNIowasZE7LBkiFvaayabDELeaHYkd6IypV9zx39fGxLPV
         YCYOyA3PqnIvHpp+1dBrgDbUTrpczS1nfnku85YX88kJYNrUbp8ee5eTj9fT8itV7u5+
         FCbWb2HTuF9BqMYolWdssBgsCWozaXjZtV6nqBLGyKuhXjvp6cbvoH+t5KoJyF079595
         rsug==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=82iH08BdZVEBA8wlvU/+uDzS4obJTo+ACSrxxJAhXfg=;
        b=X2GMYurkT/ILDDCeVIVfTDMCk6i/Ur/j1/qZXyPtEuJRf2cBJmZNjL7WQV2afxitRh
         l0LMPbgjxMS1vlBvWItJ19ik83hMkxb+ZZdKSR2ZXjSlFcr6aRRWsPHozCE4x/kSBrsW
         CAoFmzkxLQc37MOYBJc5zgVkiiFT+RyMh44q+5BV10NKIX/xI8AuolG+jI/IZcuxXqKA
         sJanoV13dbTlz2zbIhWEmbH4zI4nkOmswEi70VuD2NE8ZKTtFwNwOnOh3erp31cedI2V
         0eWMDKLIxl4xdI2iW8ju9Y3WZrp2y/KweQWVlfKSKT0WIvNu8Zs6q3hmjZf7GEMcYPXO
         nNog==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=i+sJbWgU;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=82iH08BdZVEBA8wlvU/+uDzS4obJTo+ACSrxxJAhXfg=;
        b=Bevond7iUewoqfSrc1NOQos5CoLanEq53Un416oN34oR11xE2N0rGQXp0wvovB/eWZ
         fMH17+UQIcXD86r4WWqSi9ykkh7yH8OgyOtdcce+qFOADsrMne5YcinqG8OVVcheIZ3c
         yb8ZfqCJwv7zkfxjgV8G4qnQRCxIWABN90pyuIVRn5xqPVSUBV1j4lAuape6YFZvSzgt
         62UBa3q3gBI3TkciHaPOpMiU4r8AUwhu1osp4dpIyoGQUAK4b1nlLXodRV5UNL4AJcla
         StIC+v1+k4eL1ZmY+1HkpbEjd8684wJuRLcS4O0PgWDBa5IswJzrcfZllsocNxpC/RzP
         K0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=82iH08BdZVEBA8wlvU/+uDzS4obJTo+ACSrxxJAhXfg=;
        b=Btkqw6T68xhInctCEQYdx6CdZZ1DSbYnBhbFBj5BnI67AAGxn/XJ82feCdAJw9Sdg/
         iLQYoMh6U0dXl176ji7ARZQVzHB26cZArUi0npACRM3U5N+mxCkujPQA5heweDUNsfLO
         /TIHLH8/fIbm2b+xnrOMZiLAZFULWmUFe5En+4i5AgX7mMVvgOY09Mm2yge+9xV5l9S3
         X60Jj8Nld4IuA4BRGu8dvB2opvdMAGGHg71sSPpxDZUzd7HONqmCMJn+BV54sERodbeE
         PeK/I3hsRfxY2zTEkxUPSy6AbtdHrAn0RfT6WtHBjwbnyDy4vFbNzWTijsA+A/99B3y1
         yXrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303macHLB7sypfm54CZ3oD1Ot9D7MX/O8G25fMctxxTwAw5cpQI
	GwrDJxAyfOztA3h9+RS2BqA=
X-Google-Smtp-Source: ABdhPJyk3rjLQ+oxURxEEvAjd6hPH8Y3PdMYGmrMx4xbBhsli40z7riaS1oGiW2jPbKJ/gpbWyKS1Q==
X-Received: by 2002:adf:f08a:: with SMTP id n10mr15323839wro.351.1597657548178;
        Mon, 17 Aug 2020 02:45:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls6371188wra.2.gmail; Mon, 17 Aug
 2020 02:45:47 -0700 (PDT)
X-Received: by 2002:adf:dd01:: with SMTP id a1mr15563341wrm.301.1597657547473;
        Mon, 17 Aug 2020 02:45:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597657547; cv=pass;
        d=google.com; s=arc-20160816;
        b=iQm4h5p/GT0fBmSrJfWXepRUtCZq2TGDRXwLzrSaR+Xn19kw39gDJJrzIFLbZ43e3m
         suArzAQ5aNVTUaORdmnyMFPO7iwJPFGAh/t3I45/iX46xw6KpSbd/Qi8UfWg9MzreNZ8
         9NEqeHSMViJIhkw9E2dmY50vnbKMWiDiH3Gf+JC2tGQ0d6jPu7mYTCGJ0GmtqlAupkmh
         h0amWLkv8Cu807C9o99KOA0P2ELMyz3Of+RG7jSek2+qYzaTG2WYj28swzJ258i6Zw+n
         rVeuREmjX/P71ytKLdvGnYlMpNCVCJBNv8FgShDr+p6+kMMh+uCvyhYBZ/0ylLyDavEW
         8WEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=pW3r52xSxyTmirqX1ByuD1NLzOrt9jPwg3nFeBw132I=;
        b=PEgrVS1qTYxRMVWel9SNkMDkOqOxybpggR8DyKHKz6x9IL5cucuMpqLnoxjznymNLl
         +8EaqHyTd/OPvBxENWt2+2f3AGiFmntL1nmgevL15E9dIYYWVQV1Z6buU6n9vXnyDNQ1
         Jxwz6PL5mN3QCztnuCtlqFXef808i7P4xtQ2rnLL0hlYQWYT3wS6C6T5+jXz48OvH8Ij
         ciVkGgc3rBBVFq/CB3wxZNRq2mOsZ2Yun7UxdPY4GQDUM5NSv0ctc/sChVF9Pg/D/Fwz
         /d1pTF1SnmMwoSDJJPhBH89piIvDYO6+uITVKEjctppFag9P+d6GqK88Ks2wmTgGqhmt
         f9xQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=i+sJbWgU;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com. [40.107.8.48])
        by gmr-mx.google.com with ESMTPS id h11si692655wrc.2.2020.08.17.02.45.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.48 as permitted sender) client-ip=40.107.8.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPb4rCnpbcVqtW7mdSV/AsGSjz2eBzsdUn9a0tQ0+5GJzK4VQWO6IOfrl5+myPZlnijPW2cR0T9h2UEdpltRAiy787CV4jdOtkIO/LwNBd3WPFIlOoG1t92mryTcQ5u6haO6tBuCZHAZq1SRwB194uV5XHLW9iDByeFMiUheZeYHTNggET7YYcD2/x3tm6ycM9SaoiGhrfEsZebM34DLv+QXfXdk3Ibyf9HWVPJSbttvGi290KiXA2ddJFJvkq5iaCbzgEvtZbjt8lIfpGy02w1STmrqPotVgwonLzheyMVwyjidfECj0jNs7YxeAMaKfr1uCWx3usQOPjY9DJgoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW3r52xSxyTmirqX1ByuD1NLzOrt9jPwg3nFeBw132I=;
 b=R3IRxt7bAoDxc2Mw8Psb/ol+KuQ52cmMPU7dGKTRzG7xnND29LqMii+vmNYU/5gCLWMW3AXI+t5djuyf2QMRHKGRH8BkfMGKxSqKqtg7C28K7irHYLhix8792QpRX9G4TkXt7I6JuDgRViNnSCplnDmEG3DbEUfEzUDlT+QiEi6n9Faq4y2x4uVDJq7nfgOK2OkriBpZWFyXzhqC8sqFnV0Y9i99L1Bj86uCJkoF/7GSZkcNRepkl1QUuTDP2HxFcr+W28fcqXcuo7cMaZIiqKL6EvJDOVpC3D6g+P253D7kCRiLMbqn3m3dm09RFKK8c9Am+SDLaPFZysoM8AdAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 09:45:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Mon, 17 Aug
 2020 09:45:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: RE: Dropping code during runtime (was: Re: [PATCH 06/10] Add
 libbaremetal)
Thread-Topic: Dropping code during runtime (was: Re: [PATCH 06/10] Add
 libbaremetal)
Thread-Index: AQHWcqO+VtAza/LJ4EO1k4kNpGFzS6k8EDJA
Date: Mon, 17 Aug 2020 09:45:46 +0000
Message-ID: <DB6PR0402MB2760B89232AA1E85661A252F885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
 <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
In-Reply-To: <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f180ea39-e3ae-4850-e4fd-08d8429250f2
x-ms-traffictypediagnostic: DBAPR04MB7223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7223C94D6B12684F8C12F7CE885F0@DBAPR04MB7223.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0l2v8pPVmRVPQ9sWRswilcHHZaQLZk+srF7Mx5FncQ9tKuImSMnP6uLSwZ5qGR01xfvadKtPkAJ3ubb0pL96KXFlBSXV31TkqZVsGbKnPLEGpVm2FtSV5HjZWiIXCF3/3L//2Ah8bEo/hQ0RUTzZUq/xcBRbmOrxQgwPBZfRJqEw9sY/2roAtTPiHTT3ODDvqOwAZ+OM/m6WMCLuvh/oIKA0fAvbRTD82mNQtBS5OtD/qLyj9zlkfv0gM1hnCBwuRYkp/Wtx+ybgEi9v5YhXkBi1Y4gpY5s3tCDd+0Lf3sZfGFIRq8g1OJzYVPlAj5/iRA++i0Q2OcQnKySXv3QwUyP/3eF5T7IFyLKUgZ6N2c/lHnsI+73blY/gDAlYx37rSDIDziLbfx3FfeQoWu7F9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(55016002)(66476007)(44832011)(9686003)(52536014)(71200400001)(5660300002)(86362001)(8936002)(66946007)(76116006)(66446008)(64756008)(66556008)(8676002)(110136005)(54906003)(6506007)(53546011)(26005)(2906002)(45080400002)(186003)(316002)(966005)(83080400001)(33656002)(478600001)(4326008)(7696005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oPTLxdX95cbJ342YqxSoYcfvWH25Iue6e35sDnP7Rm7kNQFX/bzTMiN5vfHGHzde7FVL51nWncL2/v4s7uP6S1kxwNWbDvxXz1ad1ZHt5LqwD3/GPgwDUIeUFtKplDeZEKa2IUlNGI/10UdTHEDsW0QxB+DyaPZXrtE48Am/LAURN178BwpCYhLTyOYSVVpvuwsVYvP6moPcX8f0G7A8tPQVx/2YSD4OUSC9tqDvMWgPEkn+jsqX5ERDJ/shp4BtcRIBbaIOqVadYbO1JYOK6KowtAFzk7m2ClkUfQFMWc5JAqcb2jmVxIqscbS1Yln4i3MxutiMfmmZonCheceLoOFO1uxyD0rHSJqL/kFl0TY180Rqo3bSFfhINL/rH0x5SNCa4MaLwfuVL417Y6iv9uOF/zCQ+ZL9S/jZGfgMVRY8oVSzOaJ+nVnzEo5SLu/2HrKALY+nkQKzF9GwwkbOts9He/atyaFkm6MvWx3BjOLxluMfUomBJ4OCsiTFoJ9xPT1OOrDl0a6Ru6RkvcvUy2HE0osHRvubYsFqTHZN/Bx94OSXamfTu2b2K2Yi0raBfFDGJWf54ifyyZq+ElFL8IicVC7A2ys/KXllSoZz9SXO+FIvYEIrz2z8m3q8g48ro7JVplfPOv/R+EdGkV0yHQ==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f180ea39-e3ae-4850-e4fd-08d8429250f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 09:45:46.2049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zs1NJe8j00aHbDtWBdO2WCI7G5xY6TsYtTYUj0wWBZgEtU1fLPzZDBLVtmOVcN8lV/ODMJrFez3BEx1CtGvx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=i+sJbWgU;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.48 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Dropping code during runtime (was: Re: [PATCH 06/10] Add
> libbaremetal)
> 
> On 8/14/20 8:13 PM, Jan Kiszka wrote:
> >>
> >> If we have a universal binary, there will be a jailhouse disable will
> >> be present in the beginning. Once we decide freeze the configuration,
> >> drop it. If we make those things compile-time configurable, then it
> >> has potential to become a variant hell.
> >
> > Dropping significant code chunks from a root-less jailhouse.bin would
> > be a valuable reason for such a config variant. You do not have to
> > argue over things that are provably not there.
> 
> With my approach, things are (provably) not there in the operative phase. It
> depends when you want to attest your system. In the same way, you could
> also argue that Linux, U-boot, the firmware, whatever has been there before
> you made your attest.
> 
> What are the parts you could drop during compile time?
> For system partitioning / cell creation, you definitely need to execute the code
> at least once - you can not drop it during compile time.

Is there any use cases currently?

Saying you have a safe critical cell and non-critical cell, if non-critical cell
crash or hang, there is no chance to resume that cell.

Thanks,
Peng.

> 
> But after execution, you can drop it. In the same way, you can drop
> init_early, ... and others. The only part that you could drop during compile
> time would probably be the whole disabling logic.
> 
> 
> Let me try to show what I had in mind:
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Flfd%2Fjailhouse%2Ftree%2Fdetention%2Frfc&amp;data=02%7C01%7
> Cpeng.fan%40nxp.com%7Ca624847b373041f70cd308d840badf66%7C686ea1
> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637330518648340844&amp;s
> data=HXf52%2FonHPkrqAlEZnU0mCooP0oOz5wVSHn3%2FIJInZ4%3D&amp;r
> eserved=0
> 
> That's a very early hack of what I was thinking about. The idea is as
> follows: Simply lock access to the hypercall subsystem, after the new
> detention hypercall was issued. With this, we can remove everything, that is
> only reachable from the interface. Runs on Qemu.
> 
> For the Intel version of the hypervisor, before that patch, the .text section
> contained 48182 bytes, with that patch, 40616 byte remain in .text, the rest
> can be dropped. 16% less assembly, and I'm sure we can find way more
> routines that can be annotated: init stuff, pagers, ...
> 
> Ah by the way, what I realised during my experiments: The .text section of
> Jailhouse is RW mapped. I wondered that I didn't receive an exception when I
> tried to overwrite code. Is that intended?
> 
>   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760B89232AA1E85661A252F885F0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
