Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBV7ZVD3AKGQEZFQWEHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 243561DFDF2
	for <lists+jailhouse-dev@lfdr.de>; Sun, 24 May 2020 11:22:32 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id o7sf5890663edq.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 24 May 2020 02:22:32 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1590312151; cv=pass;
        d=google.com; s=arc-20160816;
        b=aD7FFG3rwpRiHcSKnCknTPRGffaPCo5Qq7B8UPM5HFDdgh2f1/HyxGB1bX/V2uOZi1
         XF4Q1vTkV8Cp3CpC4PjhZNwkoC8GdEVWPZlkKydOezNEpA8NVs0i8pcp8ChuboQUjaa+
         sI9tVY/GipxOp8GmEwpewFn5UcwG1eSdGkt20kqKN8AOmya0lFz8+Kz84cvT+BXsxf+J
         0fTU3HcXUGKIKt6u6v3YSPbteZtYQRTQTWLya78KrRMNIiqkQfKI7BnL91nEMyvNlpkT
         /7jENem4jNSrr1UP7t4llq5rzV8dZ+qB/g0DNIf7mc0AKYn7cPdcGvn+eNqAxVncdYZc
         SsPQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=L1qOSWWfvA53v0FO4ERjzBHr5fH9Nz2VcX5lxRV6ukY=;
        b=hxSUrwsnU9WCgUPUnw66TgOWMHxoQYH9WIehCOa5JfbkUvN4Z+x2Q6hrtoy2vVN1Fb
         60r0iBaQuH10zgLz+O87v+9GTwT7gsmwiU+wAW9pfIkpzcn8hFj1jY1JvxPSbXL4MoGG
         nCE28yIn3ZHmUQh3Ky6d7HTFMDusWHdcgmu29zqSAj1ioFNkxs9ViSVvn0urqwRhfWJK
         P+1E1EBIt5x0/5tYwgQ971vVWGkSdcSgjEZtabVekoQwBkKT8lz72E4FdwcFTy0BPnlN
         oolRZEnwvUWSfCeiNtDbxxl711g0Sd2A7EG+Kiz8f+HMlHHNG8E5E16rHxgx5xk0SsSF
         9R1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ko395+oW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L1qOSWWfvA53v0FO4ERjzBHr5fH9Nz2VcX5lxRV6ukY=;
        b=OI68fLRfe/i05Sa69IMEr9rmUihcPEmkwUXqYFZfDEhtz+Aty0V0xm0+rN+JVHU3on
         KdX3B529hgJk3PnYIyEb3C9RrRiIRSDYPEuHYb5yw9GBLNicuA2MWmN8kSW/RsKDOmIH
         PedE60nT3+SEhB5W12iYz1f8pOKXKJwL+M9IU7OPFhltGrpdUIzAEVAZrLuAi6r5wM5s
         eslxmbdNMsHXR1relMfJPgnpaJIPoVOUE+aET6OU3Z71nhJUbt6Yly8kSLtyVc9tSWsR
         2CQDQzrLd2LOs3+PxUHevlXQ7rQaJ6ZCqK88hsyQY3IAERg+nElRNrHEa5aeOm2OUT1U
         +1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L1qOSWWfvA53v0FO4ERjzBHr5fH9Nz2VcX5lxRV6ukY=;
        b=hFXmcOFuApTAO6/1p7dluj6qaQVb4uBET5fzHIZrSRkeiSUIgHMLz1Mg5/Wm3965iq
         CMffUTmYXJXXz2qNY5RsWihCcIKKTflrlQaWzWxCL1abTq1eY/B3Pk+9t/rLnfvF+Fvh
         8T7onm4inZQSf2h/i0cS8+JtTPZDUGQBmaNEqX8e5toKYT1pPUjv9XWai9mwW1gk0nty
         XvFDz9pIP2DT/o0ifMcBd4PkhNGDp/bYbp+Duld89wRtOwi47/eTvsEZsJlJqf966hL7
         su2MW3qj9lttTm3l4zFdKjpjnDTIYbXxQCoQQbA6P5kUokHpNxeuwN9gpAHw7xWvGaV/
         X1Xg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530z+pyGsz4fyHw41Llu43E0ty4hJxHIJyLd8f9H8VIBJaE4NkA9
	4TtgdkSL63AV+y7qy9YCtQ0=
X-Google-Smtp-Source: ABdhPJwC1gGwgAop0kcTprpxpKDa70Jj3VIzP0BzWivhvrUb+Lvo77UkW0jEzUJm5ifDXDNo6GWqAw==
X-Received: by 2002:a17:906:9157:: with SMTP id y23mr15353229ejw.0.1590312151735;
        Sun, 24 May 2020 02:22:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6002:: with SMTP id o2ls2685620ejj.6.gmail; Sun, 24
 May 2020 02:22:31 -0700 (PDT)
X-Received: by 2002:a17:906:fa84:: with SMTP id lt4mr15513239ejb.318.1590312150943;
        Sun, 24 May 2020 02:22:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590312150; cv=pass;
        d=google.com; s=arc-20160816;
        b=tFmTuemLQnv9PkTexeJ4GoXRl90mUmc6ZhlW4PpFmydpUaKImF689ReB8k9Rmm+9ZK
         F8QSzUBglxZW9OwqWM41igjDaRLeoj7h/3Cc5jLsnMdRcL6Yseu/mKOYDLDm4wDQgAQh
         o6r3ongNpmIjKg/kgDh7XbdO7XHd54I8CMJDWYRLHWpDBzvirjaFcNLv1Y7sL0lsICsi
         YkHLg2yKEFWfZ36eBMi1bvBuh/animXXvSyv8QQFmYydrK8Ms62zOHCeHs6xEx7Oj2K7
         Es4cj5O4u/1kmyvb4o4RwntUHjnho9y4nckh+DabAGUtSHV037GW7WbKwDXNsxcXfmM4
         c5cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=4auuHYhRCDaKMM1bSHYJKz73IInh62poGP92i6wwpVg=;
        b=Ta7o5HTEBcem1Nbr6f4o6uIEn2YFPimZtADkWkq9EINb0ycxMarqK5LM01ifdJCeO/
         7RgysddvmbU7N1Yld5cLfuaGKjwTv5bMwLhln5+Do/b9sw3LDCa0BdnKETecMQ2LVQ7d
         Uu4QOtkkJB05eGQB7UviQ/9qEtxZb/fiw1scOqAiZWVOeA4zVOfEYX+tiEAdaSmOI1+S
         r4C12djF8fjWr98JjmQR2yTqIyWt8ekxFwONmp2twqRGrwn35w+WcK1n3/JBm+qts7SI
         bCZYpCuhIuvgpcRFtJZh6MBB7WDZ3NTlMNBGgEBPoxf7rJ3zHj7li2KAdbm9DQu0DXI2
         PsMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ko395+oW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com. [40.107.22.45])
        by gmr-mx.google.com with ESMTPS id f27si1066733ejt.0.2020.05.24.02.22.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 02:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.45 as permitted sender) client-ip=40.107.22.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMxS0LHkNKnGDTxO58PzBGiohvNCxvcK5Wa4/keD+QQGLuwgIh7hMkqV1bkmwmZFwFtT3HfdovndegoYbFtjFcOLO+9yB35lF500EiClSqOulEymSwJKtYV2KGYtyVlMufsBdKrw0hTxld/cZCAKuh0YUIxJ7YLj2O2OiAoFJGcJtoZ4s+q2FK7A71uIByZE8pr9M1iWag4LTMgpowm3qJr43/CD1zAKXAWO87nPt92AwEiU5ha+7P+fMIe9C5josiYPoVDjmFsEFAZJw/AjMw+lYvuiln5V2GfH5N05txKd1QvPzusTaVs0MLpJ37Vsh6m5PTbbtwxNDycN2n8WRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4auuHYhRCDaKMM1bSHYJKz73IInh62poGP92i6wwpVg=;
 b=SmKCpMG4geo1zO7rZVeTl18wOPcu5Ir+wmwYokGRd7LQdLvjiIJosJVcwgUOXGD/oNrRt0G2J1w1AX2LliigWZtC8P/9/UdWxiE3sHGTTpDQzVHNBI7UUSPLqQqoR6NFqJvolb4x7XGl05SkLrRMuG9xaz1PH0KagqEQIhbw8cZh468RLLwLrvbPIDS6AFtJhqn9LckMzG6CseH18/Wc6Nh2445/RJMjkGLGKoJZ2F6PEa2flz3rHBOWwnwxy2b1dxcNzirpQMFAzdybtL3zt4ACslglne2DG9jCETWgjiM2rvujWyKwI3wLkU4o3LatO/rmkN0t2m9/Sk5jn1JxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2695.eurprd04.prod.outlook.com (2603:10a6:4:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sun, 24 May
 2020 09:22:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.3021.029; Sun, 24 May 2020
 09:22:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: zhengjun zhang <zhangzhengjunhust@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: On the question of virtualization performance loss
Thread-Topic: On the question of virtualization performance loss
Thread-Index: AQHWJt9RY/hmRdK9JEGebwhkTJ3i36ihiaaAgACnTwCAFNmeMA==
Date: Sun, 24 May 2020 09:22:28 +0000
Message-ID: <DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
 <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
 <2428dc45-5f56-497d-8c70-b6cfd17cc17a@googlegroups.com>
In-Reply-To: <2428dc45-5f56-497d-8c70-b6cfd17cc17a@googlegroups.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ca98ad2-39b1-4c0a-0767-08d7ffc3fb0e
x-ms-traffictypediagnostic: DB6PR0402MB2695:
x-microsoft-antispam-prvs: <DB6PR0402MB269589C141E982319A48A2DC88B20@DB6PR0402MB2695.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0413C9F1ED
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mgd9xSHTbzOroYi+WvGhCaUzbryyPd0lycjqKbZzeVJ8PvWc8txU8bkMdITWLTI5oZ2ZdaBGx9xc70de88H/Q6a9GzBP2NnqFWh4bwSoob1Vg329lbuvJZZpD88+udYknuiXktGG/RgpNywed/HmcMaHtEydUmdD63Kx7RWdm74KRe7i6H9Uk1aKN2Dovf74TMdwQqNwMeddyMU/CBP9kgXnmIr1Pb5hEtyktKiTMoN6ldc+Ei/mUw8WMgvuW90pzij61mPZ94cVCM/fepewvXB61rfHdN8PmcmJFUe9DitvxI59v42Mjjmm79pl/rsWaDzdYNFOMOclIJ3K5uu+grNYN1FpHqbm9376AlWut/NWiSztYkEfj0Ydqwocsw5gTXAnzyjdGedb4LWwVxmqsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(316002)(71200400001)(110136005)(166002)(6506007)(52536014)(478600001)(53546011)(7696005)(26005)(45080400002)(66446008)(76116006)(86362001)(44832011)(5660300002)(66556008)(64756008)(66476007)(66946007)(2906002)(8676002)(33656002)(9686003)(55016002)(8936002)(966005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dli/6U16/G6wV+mpgk0JaohOKyFqIOcGpyiD7DBnULWvvCC2onU4UTNzVeZTERgeyKWT+73ov2vdpbHw/r0IyXHGB23CO5ShZmNPZ8VsTQyW9NdqsHpwRF79bje30LYr4QJmX1oELeAz6Bg4kT6SECmsbbtsM+SEkywJQdQyGlTdzq1KmUJh5l0Viq7OnyeOOM9zvKywBsmNtxLUJcjIBPMTRAXKDEDPvWusowP7Je++NPuK7AojQz090VAOdvaJCyw3scu0NFr615qrDicR4+DNzlFpeM45TlEW2C58eFfGlItU2Vpo5JDaqCtsmIimBCuHednZcZz7HjApkGpNFfcCfqOgh9EJblpzF+XmmIXrwZoxvaKjGi4HwY2JtKS9tM/YSlVWhi10YKh0I4CXBJw25cLJPr3DghOg36yDLYIdZKueWZOChkS/xl788u+DUbNqnBaLKELui4HbQrKvw5DVTGngqhn0JKF8ns0Acic=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20DB6PR0402MB2760_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca98ad2-39b1-4c0a-0767-08d7ffc3fb0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2020 09:22:28.9291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXeY2/mcLo449RkUYVQqvzAEks7E0vHu4iM7N15rteEi3YzbbckOsimQZMV7mQXtVymtQry8iKSVMfzUy2cUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2695
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ko395+oW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

--_000_DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20DB6PR0402MB2760_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for top post, I am not able to convert the original mail to plain tex=
t from zhengjun using outlook.

Hi Zhengjun,

Would you mind share what products would you using jailhouse on i.MX8MQ?

Did you configure cpu to max cpufreq when testing root/inmate? The root cel=
l cpufreq might affect inmate cpu frequency, please configure cpufreq to pe=
rformance governer in rootcell, then test inmate Linux.

Regards,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of zhengjun zhang
Sent: 2020=E5=B9=B45=E6=9C=8811=E6=97=A5 10:54
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: On the question of virtualization performance loss

I used the official configuration file provided by NXP without any modifica=
tion.

=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A
On 10.05.20 17:26, zhengjun zhang wrote:
>
> Hi~
> I recently tested the loss of virtualization performance in jailhouse on
> the i.MX 8MQuad, using the testing tools sysbench and super_pi.
> I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and
> inmate Cell
> Here is the jailhouse startup information
> Root $ cat /proc/cpuinfo
> processor: 0
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> processor: 1
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
> Root $ cd ~/jailhouse
> Root $ insmod jailhouse.ko
> [  233.063524] jailhouse: loading out-of-tree module taints kernel.
>
> Root $ ./jailhouse enable configs/imx8mq-veth.cell
>
> Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
>   CPU 1... OK
>   CPU 0... OK
>   CPU 3... OK
>   CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU
> No SMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "imx8mq"
> iommu_config_commit imx8mq
> Page pool usage after late setup: mem 72/994, remap 144/131072
> Activating hypervisor
> [  251.213460] OF: PCI: host bridge /pci@0 ranges:
> [  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000
> [  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
> 0xbfb00000-0xbfbfffff] for [bus 00]
> [  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000=
:00
> [  251.240052] pci_bus 0000:00: root bus resource [bus 00]
> [  251.245533] pci_bus 0000:00: root bus resource [mem
> 0xbfc00000-0xbfc01fff]
> [  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
> 0xbfc00000-0xbfc000ff 64bit]
> [  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
> [  251.269478] The Jailhouse is opening.
> [  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
>
> Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
> /run/media/mmcblk1p1/Image -d
> /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused
> console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200
> root=3D/dev/mmcblk0p2 rootwait rw"
> [  315.757129] CPU2: shutdown
> [  315.759844] psci: CPU2 killed.
> [  315.804134] CPU3: shutdown
> [  315.806843] psci: CPU3 killed.
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
> iommu_config_commit linux-inmate-demo
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 88/994, remap 144/131072
> [  315.835959] Created Jailhouse cell "linux-inmate-demo"
> Cell "linux-inmate-demo" can be loaded
> Started cell "linux-inmate-demo"
> [    0.000000] Booting Linux on physical CPU 0x2
> [    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc
> version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
> [    0.000000] Boot CPU: AArch64 Processor [410fd034]
> [    0.000000] Machine model: Freescale i.MX8MQ EVK
> [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options
> '115200')
> [    0.000000] bootconsole [ec_imx6q0] enabled
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem
> 0x0000000000000000-0x00000000fdbfffff]
> [    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]
> [    0.000000] Initmem setup node 0 [mem
> 0x00000000c0000000-0x00000000fdbfffff]
> processor: 2
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> processor: 3
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> I executed the same test case in bare-machine, root cell, and inmate cell=
.
> The CPU test results of sysbench in the root cell were approximately 1%
> lower than those of the bare machine, but the CPU test results of
> sysbench  in the inmate cell were approximately 1/3 lower than those of
> the bare machine.
> The super_pi test results in the root cell were approximately 1% lower
> than those in the bare-bones machine, but the super_pi test results in
> the inmate cell were approximately 20% lower than those in the
> bare-machine.
> Jailhouse  is a partitioning hypervisor, why is there a significant
> decrease in CPU performance in the inmate cell?
> This result makes me very puzzled, hope to answer.
> If you need any other info let me know.
> I really appreciate any analysis.

Jailhouse does not treat non-root cells differently from root cells /wrt
performance. The reason must be in the configuration. Were you using the
very same kernel in root-cell and non-root inmate? Maybe Peng can also
point to areas that could explain performance differences.

Jan
--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+uns=
ubscribe@googlegroups.com>.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2428dc45-5f56-497d-8c70-b6cfd17cc17a%40googlegroups.com<https=
://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.googl=
e.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F2428dc45-5f56-497d-8c70-b6cfd17cc17a%25=
40googlegroups.com%3Futm_medium%3Demail%26utm_source%3Dfooter&data=3D02%7C0=
1%7Cpeng.fan%40nxp.com%7C29fdf0b65a1846c1523808d7f5567df5%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0%7C0%7C637247624135070378&sdata=3DDE3bLTOwdjTIe%2BXlf3=
Di9dfjGlUmozMATQ%2Be7FL%2Flrc%3D&reserved=3D0>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.

--_000_DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20DB6PR0402MB2760_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Sorry for top post, I =
am not able to convert the original mail to plain text from zhengjun using =
outlook.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Hi Zhengjun,<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Would you mind share w=
hat products would you using jailhouse on i.MX8MQ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Did you configure cpu =
to max cpufreq when testing root/inmate? The root cell cpufreq might affect=
 inmate cpu frequency, please configure cpufreq
 to performance governer in rootcell, then test inmate Linux.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Peng.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.com&gt;
<b>On Behalf Of </b>zhengjun zhang<br>
<b>Sent:</b> 2020</span><span style=3D"font-size:11.0pt">=E5=B9=B4</span><s=
pan lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">5</span><span style=3D"font-size:11.0pt">=E6=9C=88</span><spa=
n lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,=
sans-serif">11</span><span style=3D"font-size:11.0pt">=E6=97=A5</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif">
 10:54<br>
<b>To:</b> Jailhouse &lt;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: On the question of virtualization performance loss<o:p>=
</o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I used the official configurati=
on file provided by NXP without any modification.<br>
<br>
</span>=E5=9C=A8<span lang=3D"EN-US"> 2020</span>=E5=B9=B4<span lang=3D"EN-=
US">5</span>=E6=9C=88<span lang=3D"EN-US">11</span>=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=B8=80<span lang=3D"EN-US"> UTC&#43;8</span>=E4=B8=8A=E5=8D=88<span l=
ang=3D"EN-US">12:54:46</span>=EF=BC=8C<span lang=3D"EN-US">Jan Kiszka</span=
>=E5=86=99=E9=81=93=EF=BC=9A<span lang=3D"EN-US"><o:p></o:p></span></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 10.05.20 17:26, zhengjun zha=
ng wrote: <br>
&gt; <br>
&gt; Hi~ <br>
&gt; I recently tested the loss of virtualization performance in jailhouse =
on <br>
&gt; the i.MX 8MQuad, using the testing tools sysbench and super_pi. <br>
&gt; I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell an=
d <br>
&gt; inmate Cell <br>
&gt; Here is the jailhouse startup information <br>
&gt; Root $ cat /proc/cpuinfo <br>
&gt; processor: 0 <br>
&gt; BogoMIPS: 16.66 <br>
&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid <br>
&gt; CPU implementer: 0x41 <br>
&gt; CPU architecture: 8 <br>
&gt; CPU variant: 0x0 <br>
&gt; CPU part: 0xd03 <br>
&gt; CPU revision: 4 <br>
&gt; <br>
&gt; processor: 1 <br>
&gt; BogoMIPS: 16.66 <br>
&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid <br>
&gt; CPU implementer: 0x41 <br>
&gt; CPU architecture: 8 <br>
&gt; CPU variant: 0x0 <br>
&gt; CPU part: 0xd03 <br>
&gt; CPU revision: 4 <br>
&gt; Root $ cd ~/jailhouse <br>
&gt; Root $ insmod jailhouse.ko <br>
&gt; [&nbsp; 233.063524] jailhouse: loading out-of-tree module taints kerne=
l. <br>
&gt; <br>
&gt; Root $ ./jailhouse enable configs/imx8mq-veth.cell <br>
&gt; <br>
&gt; Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1 <br>
&gt; Code location: 0x0000ffffc0200800 <br>
&gt; Page pool usage after early setup: mem 39/994, remap 0/131072 <br>
&gt; Initializing processors: <br>
&gt; &nbsp;&nbsp;CPU 1... OK <br>
&gt; &nbsp;&nbsp;CPU 0... OK <br>
&gt; &nbsp;&nbsp;CPU 3... OK <br>
&gt; &nbsp;&nbsp;CPU 2... OK <br>
&gt; Initializing unit: irqchip <br>
&gt; Initializing unit: ARM SMMU <br>
&gt; No SMMU <br>
&gt; Initializing unit: PCI <br>
&gt; Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot; <br>
&gt; iommu_config_commit imx8mq <br>
&gt; Page pool usage after late setup: mem 72/994, remap 144/131072 <br>
&gt; Activating hypervisor <br>
&gt; [&nbsp; 251.213460] OF: PCI: host bridge /pci@0 ranges: <br>
&gt; [&nbsp; 251.218097] OF: PCI:&nbsp; &nbsp;MEM 0xbfc00000..0xbfc01fff -&=
gt; 0xbfc00000 <br>
&gt; [&nbsp; 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem <br>
&gt; 0xbfb00000-0xbfbfffff] for [bus 00] <br>
&gt; [&nbsp; 251.233114] pci-host-generic bfb00000.pci: PCI host bridge to =
bus 0000:00 <br>
&gt; [&nbsp; 251.240052] pci_bus 0000:00: root bus resource [bus 00] <br>
&gt; [&nbsp; 251.245533] pci_bus 0000:00: root bus resource [mem <br>
&gt; 0xbfc00000-0xbfc01fff] <br>
&gt; [&nbsp; 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem <br>
&gt; 0xbfc00000-0xbfc000ff 64bit] <br>
&gt; [&nbsp; 251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -&g=
t; 0002) <br>
&gt; [&nbsp; 251.269478] The Jailhouse is opening. <br>
&gt; [&nbsp; 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready=
 <br>
&gt; <br>
&gt; Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell <br>
&gt; /run/media/mmcblk1p1/Image -d <br>
&gt; /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c &quot;clk_ignore_unu=
sed <br>
&gt; console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200 <br>
&gt; root=3D/dev/mmcblk0p2 rootwait rw&quot; <br>
&gt; [&nbsp; 315.757129] CPU2: shutdown <br>
&gt; [&nbsp; 315.759844] psci: CPU2 killed. <br>
&gt; [&nbsp; 315.804134] CPU3: shutdown <br>
&gt; [&nbsp; 315.806843] psci: CPU3 killed. <br>
&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&quot=
; <br>
&gt; Shared memory connection established: &quot;linux-inmate-demo&quot; &l=
t;--&gt; &quot;imx8mq&quot; <br>
&gt; iommu_config_commit linux-inmate-demo <br>
&gt; Created cell &quot;linux-inmate-demo&quot; <br>
&gt; Page pool usage after cell creation: mem 88/994, remap 144/131072 <br>
&gt; [&nbsp; 315.835959] Created Jailhouse cell &quot;linux-inmate-demo&quo=
t; <br>
&gt; Cell &quot;linux-inmate-demo&quot; can be loaded <br>
&gt; Started cell &quot;linux-inmate-demo&quot; <br>
&gt; [&nbsp; &nbsp; 0.000000] Booting Linux on physical CPU 0x2 <br>
&gt; [&nbsp; &nbsp; 0.000000] Linux version 4.14.98-05985-g1175b59 (root@De=
velop) (gcc <br>
&gt; version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020 <br>
&gt; [&nbsp; &nbsp; 0.000000] Boot CPU: AArch64 Processor [410fd034] <br>
&gt; [&nbsp; &nbsp; 0.000000] Machine model: Freescale i.MX8MQ EVK <br>
&gt; [&nbsp; &nbsp; 0.000000] earlycon: ec_imx6q0 at MMIO 0x000000003086000=
0 (options <br>
&gt; '115200') <br>
&gt; [&nbsp; &nbsp; 0.000000] bootconsole [ec_imx6q0] enabled <br>
&gt; [&nbsp; &nbsp; 0.000000] efi: Getting EFI parameters from FDT: <br>
&gt; [&nbsp; &nbsp; 0.000000] efi: UEFI not found. <br>
&gt; [&nbsp; &nbsp; 0.000000] cma: Reserved 320 MiB at 0x00000000e8000000 <=
br>
&gt; [&nbsp; &nbsp; 0.000000] NUMA: No NUMA configuration found <br>
&gt; [&nbsp; &nbsp; 0.000000] NUMA: Faking a node at [mem <br>
&gt; 0x0000000000000000-0x00000000fdbfffff] <br>
&gt; [&nbsp; &nbsp; 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff] <=
br>
&gt; [&nbsp; &nbsp; 0.000000] Zone ranges: <br>
&gt; [&nbsp; &nbsp; 0.000000]&nbsp; &nbsp;DMA&nbsp; &nbsp; &nbsp; [mem 0x00=
000000c0000000-0x00000000fdbfffff] <br>
&gt; [&nbsp; &nbsp; 0.000000]&nbsp; &nbsp;Normal&nbsp; &nbsp;empty <br>
&gt; [&nbsp; &nbsp; 0.000000] Movable zone start for each node <br>
&gt; [&nbsp; &nbsp; 0.000000] Early memory node ranges <br>
&gt; [&nbsp; &nbsp; 0.000000]&nbsp; &nbsp;node&nbsp; &nbsp;0: [mem 0x000000=
00c0000000-0x00000000fdbfffff] <br>
&gt; [&nbsp; &nbsp; 0.000000] Initmem setup node 0 [mem <br>
&gt; 0x00000000c0000000-0x00000000fdbfffff] <br>
&gt; processor: 2 <br>
&gt; BogoMIPS: 16.66 <br>
&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid <br>
&gt; CPU implementer: 0x41 <br>
&gt; CPU architecture: 8 <br>
&gt; CPU variant: 0x0 <br>
&gt; CPU part: 0xd03 <br>
&gt; CPU revision: 4 <br>
&gt; <br>
&gt; processor: 3 <br>
&gt; BogoMIPS: 16.66 <br>
&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid <br>
&gt; CPU implementer: 0x41 <br>
&gt; CPU architecture: 8 <br>
&gt; CPU variant: 0x0 <br>
&gt; CPU part: 0xd03 <br>
&gt; CPU revision: 4 <br>
&gt; <br>
&gt; I executed the same test case in bare-machine, root cell, and inmate c=
ell. <br>
&gt; The CPU test results of sysbench in the root cell were approximately 1=
% <br>
&gt; lower than those of the bare machine, but the CPU test results of <br>
&gt; sysbench&nbsp; in the inmate cell were approximately 1/3 lower than th=
ose of <br>
&gt; the bare machine. <br>
&gt; The super_pi test results in the root cell were approximately 1% lower=
 <br>
&gt; than those in the bare-bones machine, but the super_pi test results in=
 <br>
&gt; the inmate cell were approximately 20% lower than those in the <br>
&gt; bare-machine. <br>
&gt; Jailhouse&nbsp; is a partitioning hypervisor, why is there a significa=
nt <br>
&gt; decrease in CPU performance in the inmate cell? <br>
&gt; This result makes me very puzzled, hope to answer. <br>
&gt; If you need any other info let me know. <br>
&gt; I really appreciate any analysis. <br>
<br>
Jailhouse does not treat non-root cells differently from root cells /wrt <b=
r>
performance. The reason must be in the configuration. Were you using the <b=
r>
very same kernel in root-cell and non-root inmate? Maybe Peng can also <br>
point to areas that could explain performance differences. <br>
<br>
Jan <o:p></o:p></span></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href=3D"mailto:jailhouse-dev&#43;unsubscribe@googlegroups.com">jailhouse=
-dev&#43;unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://eur01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%=
2Fjailhouse-dev%2F2428dc45-5f56-497d-8c70-b6cfd17cc17a%2540googlegroups.com=
%3Futm_medium%3Demail%26utm_source%3Dfooter&amp;data=3D02%7C01%7Cpeng.fan%4=
0nxp.com%7C29fdf0b65a1846c1523808d7f5567df5%7C686ea1d3bc2b4c6fa92cd99c5c301=
635%7C0%7C0%7C637247624135070378&amp;sdata=3DDE3bLTOwdjTIe%2BXlf3Di9dfjGlUm=
ozMATQ%2Be7FL%2Flrc%3D&amp;reserved=3D0">
https://groups.google.com/d/msgid/jailhouse-dev/2428dc45-5f56-497d-8c70-b6c=
fd17cc17a%40googlegroups.com</a>.<o:p></o:p></span></p>
</div>
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
om/d/msgid/jailhouse-dev/DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20%40DB6PR04=
02MB2760.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">=
https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760EDC3E7EFD80A=
1134AD1788B20%40DB6PR0402MB2760.eurprd04.prod.outlook.com</a>.<br />

--_000_DB6PR0402MB2760EDC3E7EFD80A1134AD1788B20DB6PR0402MB2760_--
