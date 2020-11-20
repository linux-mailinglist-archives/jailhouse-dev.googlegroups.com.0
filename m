Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBNOX3X6QKGQENYAOJLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 347592BA2D6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Nov 2020 08:09:42 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id n207sf3327375lfa.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 23:09:42 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1605856181; cv=pass;
        d=google.com; s=arc-20160816;
        b=kdcipYhM+FPPKw+fuveVL4lOfsPIQriRlArjDNg09VvEp/V5nvJTqfY284vZXEvXfW
         hzUPJWZT4kIaxAKSk274+h1h2j9CJ5rJWceqR6S8FM6/K+bnP8lJ028Ui1PpZ0Z4Mr1S
         shlJZCJX4CUtgUgzvkCdnyoW1LpTIA2oPW2O6GboRWhj/rI9krFw2QWQl9CxjlzAqFUB
         q1vjyEvT4M8Nxw8CNkuvo0zqKFcJwRWEkMPF6kr9BTh060OIGWKxtL+JP4BSmQk5wXnI
         5dwF88jbOiIlRdpL5czGJyp6TAGewbKLGCU3G0CnJVFt60V3hp8xTA0kww4MVLfOROc/
         lW5g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=45oQrV4U9LnxK0kAHktgHPOsaLg847tytsMgsYLdPX8=;
        b=hzkBJrlZQnmLEkB8UXGKDShQ8+QfBR+UC1oGkdy1cnf5gJwpIRqyqajYCxccmbj4RY
         x9XVqzlty9/W90JfruYqR2YmOSu3ltCTKIvTYbPrM2v9c7Cr8jqgVBJAYbmMFxv0lc6s
         QgU16z+3eYSy1EgIRj+F1bU1D/npYVUq6k6DftPgIRn+lRMd5y/UM02/FmROGBk2iFwM
         ASkygoyyxLmSYDFc0DusMf5ruOIUsMKVfsudH1/GcM702dh7CMti4ZLR3X2z61nApywF
         YvN7iH8xUdc5CX3eOJX6W6qaALMbAR85WRheDg6ZAEh+Ae27DGiihox5gPB33DzeNezX
         7mww==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Wr3S+bNm;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=45oQrV4U9LnxK0kAHktgHPOsaLg847tytsMgsYLdPX8=;
        b=qGH2L8ZOqFiZc6iTc/9r507r5LGCP32REio9EAqcimrBz52ZfyijODq7HAIV6KlNT6
         vwGUHdTa2LsocWMn/tJuZQ9udQuk5RtncCPc0tR6K8KOLpDObhzCGo/aTYA/EyXEURLs
         31yt7bjLaj8jeVIn96W+OzZuM7Xbj69wGUAllVZIeNGa6ahK+1IwMPhpw4PX4+4cNgKj
         SCotB22c81JmIJv1bt9wnZb6L9cXq5zxz0IvBXAXEDRAhrKELE1O3wvTFmHvemke9lT9
         VjaWEr63tXi8tMqXfHS37gzZMneOlBRN8ViHkG3wfiFoF10MKMU5aBeAjO6ceDl48tOn
         YlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=45oQrV4U9LnxK0kAHktgHPOsaLg847tytsMgsYLdPX8=;
        b=kfe4CcEtTZfyuTv9zVvocHbAxk6A7cNfQN1+Td/qiq6ZlJ/9MVP0YHOakWibDYtb6M
         v85UjjB/wqrMMYL4oFEju3D12OjrQF9Ch1+Gt+khv82P0WgdaJ2zICuwfl+SjqBxG8VY
         MmoF/g3T6DX6JBm+ggoOzzXOeA4v2IaPrhewsu1pV2ouP5wM4NvjjuWQZe3/e5o0SKYw
         q71kUr5vS56NPiSqrJPv9WYsD2DiTQQuADRywdVQvGrZr+qtBZE3i5vwKGBie79N3tNz
         n4Ewk3jyxba2Z1lW1v6pT+0gJtJhu5QwOZtD5phcbiAHzm1akWguZHo0B5HAjIyqNRjU
         W11A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ayRjF/H8vBzY0Bt5bP1uHi0vyYVqn4sSwoj8SYqUOC82+vbg5
	SokfhuBaLuUlSto2oumgvIk=
X-Google-Smtp-Source: ABdhPJwm10LZuHUAHK1ASB+ASci0qe2fRtuo+3dX36sqVILlMV49nN4ZhwAqqYPWcZouh80IeTVCGQ==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr6970501lfl.304.1605856181625;
        Thu, 19 Nov 2020 23:09:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:914c:: with SMTP id q12ls933470ljg.8.gmail; Thu, 19 Nov
 2020 23:09:40 -0800 (PST)
X-Received: by 2002:a2e:6f13:: with SMTP id k19mr6745074ljc.74.1605856180432;
        Thu, 19 Nov 2020 23:09:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605856180; cv=pass;
        d=google.com; s=arc-20160816;
        b=CDMx4OuGTpgAMHI/n/qEnXsGr2KRaiXjpC0L4zv2KIyJtSTAfoXryjxJqs9eL3NtvV
         E4vKx2jjUcu3Dt3Ou6nqEEsTOWYDjv7wEAKg1Y7sdkYGXI7vBSQ4XYNLIrnPu2KXO+/n
         ROZD5zfmmj4vN47O6DsBbOoeOhOmBepetZBHNcoHBH28leWGHBfKDubDpMxJjZVuC8Af
         tEj4kXeVZfrWYWShUKF/t8LzvtYDxSGN/Wa09o9Qaw+sohmoMRndqYHbz6k7DwdcZKJ8
         AqJreOTEODiYpw9kqON9w8StXPFREa+RkPMHGMxEWQyvfULXtgt0dYItlLXrAjN09DYC
         3WgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=V6uSQ8/to2BRZUPRnRrfIi0KHrB+TMw/gT4YtLLZUBY=;
        b=U060vihevyT35JjY1uZQCmXQ7keCU91uWm1tuHJ8uNIhgJZr+fu/4k1smKb02WfaHQ
         bgJjqBHTOWdBuYxYupv6FRdu+xCNKCGczJqJ+NIiGspFYaMoM19LonrTtukrB4ePQwVi
         azP9SNOGezQYZa5c+vQxazR9a9UkG3+Qt43kzbHII7zv+VtG2mKep0Uzs8v2tNwqDn6v
         47yjHMitPgKCcigcHnSjSjflcVS6dCLGXmFbd2etHnWBgkCudQdUjeARafXYoB9xfgYT
         4TDItwxKjXpJgOU27tzExfOZi1ZLSRj2Nm3PF0C4M1F0pX6nrtbF+aaFrsWz90IP+ygo
         Cj/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Wr3S+bNm;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150081.outbound.protection.outlook.com. [40.107.15.81])
        by gmr-mx.google.com with ESMTPS id j2si34147lfe.9.2020.11.19.23.09.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 23:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.81 as permitted sender) client-ip=40.107.15.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGEmE8pL3VLCATGxppdQcn/UzbLT9nTqaRPH7sUeb0FxBSL92EXZBIfdj03XSeW36yXE7xhQCWK3u/c/a3brSpsPrtWzSOiFPV5N2CV3FgKXVBFKMuPOINHg4UpoYjp4TqNO37j7tIqHjAsFsw0JxgN8rEBY3q2/KstML36d2QVWYGx0rul7LJ0ds9BwnMS7IxYytOAxPXEUhrQTqSG1CuDV61yBic0RfQkSXohsSis1f+kmZqnzPPldiOwfLg35poDXPmhnGWCPtnKqPWytASaeOFlLxikRHv7R66/R/yPJyUVgFjvQ6dTL+7bTtiCxRHUO7O//6IWkvoHLmhNHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6uSQ8/to2BRZUPRnRrfIi0KHrB+TMw/gT4YtLLZUBY=;
 b=YFFeSq4kd7WzgPY0zydfAvh53VKLaG7WdmQ6ny5HBlcBAVZnWa6boUIN+V5q+Zb0vkxog9ssaMEASjapXwaGc5KlMAPgvuWn8p4M3ri4HncOE5tXewOlOK1vabSaHXgLfu3RTJsZw1RZmF/XehFGMk09jrWEb3SLzboi9HfW7cLArEMCoad/gkrdlw+EsZ9EdTDhW2HmkrCClFqrfaa9CIweUkbtcG0m1vp97cfc8QBhIvHUXbKGew2JmLHQLjjZFxEJXMSVs2rLyf2LOQ1nhLFj8Iwt3I1jPwAPf6qjtMjutYnxkvGYAytSiz79mHfc4EEDQwPrsY4YBMLOj4creg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 07:09:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3564.028; Fri, 20 Nov 2020
 07:09:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: zephyr ARM64 SMP runs on Jailhouse
Thread-Topic: zephyr ARM64 SMP runs on Jailhouse
Thread-Index: Ada+HotgWPdpOhbSTKucu1X0S1ipHQAL3GYAAC9CoiA=
Date: Fri, 20 Nov 2020 07:09:39 +0000
Message-ID: <DB6PR0402MB276009F841DA2D085725319688FF0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB276052104C2CE78B10D2BD5188E00@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <fd4ed87a-58b1-2767-8a28-f1ba335582d3@siemens.com>
In-Reply-To: <fd4ed87a-58b1-2767-8a28-f1ba335582d3@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87bbe7c2-d88b-46f4-8a9e-08d88d233f14
x-ms-traffictypediagnostic: DBBPR04MB7817:
x-microsoft-antispam-prvs: <DBBPR04MB7817329B46B6C7B39EF9FAC788FF0@DBBPR04MB7817.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xrhOgwt0qXj1kyG2SOx2I+T5IIGVJDYXwGDx1dO28ewnGM+MAWxIh9W1ZDG9212MYChBl+txZDw2E34d4oooSBHL/V6OQpIy62raiuZvy4+XpSpwSXRprlgEx3l0CWcwQah/L05AFiC4I9k2lbD2NWVBoocv/QN7a5sqRQGlJHvlzbmTy0H1aT/WV2Vn9KCgGNGv0mQqzMM6Nb2QXu9k62oiRsi9ZmgQ5TE4RwQ9x+THnuBncnie3hdEYVy1U9epKuzqQGN0kXj4Nj3i1dTXNBDyqgmjVXkPR2O60tOTCoTRyJPisJB7PKYzWWiFKL6njAs1sKwHymUuO98DpTdzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(86362001)(2906002)(9686003)(33656002)(5660300002)(71200400001)(44832011)(110136005)(66556008)(316002)(83380400001)(8676002)(8936002)(7696005)(52536014)(55016002)(26005)(76116006)(478600001)(53546011)(66476007)(186003)(6506007)(66946007)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yYazI0uEqbM58+0EMgQKJoHd1R+wkxV9C9NpDIIHJUbgtYbWlcfsVxv/Yzy6BdhaQAe9MNDWqJiq/uxi0PYt3q2I4aPzNW6f7tz0V80jZNgXX3fSslWY0Duwg/ayVpdgNcDtz1B0n+ZNfWmDi3PmLYf0v1AtRtlpy2R1hgDvT1emB1yXX0Ieoy9MoyIF5RpkjOkGRS3vaEQjfOj88h42OMK4CtB0RFm6dOkbyPPf0J5DXVeQ4U0yQbQ3Ymj1cwJ4DE0OQjGjsWsi9/AhRP0w+xEmDj10yueTeQkA2MpO1+PvGPzULrWu2x/0boCZsNJdlVHOoLzTCoUcTg0YMEZX7vMiPStoGWDRKj71RPYEicaHw1mhnggiJytCFN2YsVNw5Cpzxg7u6d4oZbyD3WpNJFnlV2M1VOWn5ASR4zoigWYoXb8Dh186Q80OUMTpYAlVkZra1YXcqSf5HDKApChFp6rz4dJbHYO2FX62IhCVxPT6usy2jr6ahapZrJy8Qfb4dVDmhAdsPkzDDC5IAKnLXKDdBC3JRX14zbQ68PYT4x9u/aLakUbtN1ugCflwDNZnrPs3FBmtf+Wc+rRvH0pna6uk8Fi/jjQG2jKnQveUZUd7o5kT0g0Sg+AsDV3rV0ENFlbY5J9ktmDJAI4FNUqoNQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bbe7c2-d88b-46f4-8a9e-08d88d233f14
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 07:09:39.3328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSqF3ae8Zr4EJfxA8JgYFrAVxv4FB3UuZ59AunFTPk7Jm9OD29RSFgPmp9w4tj9j556lZ3cmuLcy5+Nv7Kt+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Wr3S+bNm;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: zephyr ARM64 SMP runs on Jailhouse
> 
> On 19.11.20 03:50, Peng Fan wrote:
> > Just share info, we have enabled zephyr ARM64 SMP on Jailhouse using
> > i.MX8M
> >
> 
> This is great news, indeed! Do you need patches against Zephyr, or is
> upstream ready for this? Would it work in qemuarm64 as well?

Current upstream zephyr not support SMP, and only runs in secure world.
So I have some patches to make it run in normal world and SMP support.

I only did this on i.MX8MM EVK board. Qemuarm64 needs some porting
effort. Jailhouse also needs one minor patch as below:

@@ -364,15 +365,21 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
        case GICR_SYNCR:
                mmio->value = 0;
                return MMIO_HANDLED;
-       case GICR_CTLR:
-       case GICR_STATUSR:
-       case GICR_WAKER:
        case GICR_SGI_BASE + GICR_ISENABLER:
        case GICR_SGI_BASE + GICR_ICENABLER:
        case GICR_SGI_BASE + GICR_ISPENDR:
        case GICR_SGI_BASE + GICR_ICPENDR:
        case GICR_SGI_BASE + GICR_ISACTIVER:
        case GICR_SGI_BASE + GICR_ICACTIVER:
+               if (this_cell() != cpu_public->cell) {
+                       /* ignore access to foreign redistributors */
+                       return MMIO_HANDLED;
+               }
+               mmio->value &= ~(SGI_MASK | (1 << mnt_irq));
+               break;
+       case GICR_CTLR:
+       case GICR_STATUSR:
+       case GICR_WAKER:
        case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR, 8, 4):
        case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4):
                if (this_cell() != cpu_public->cell) {


I'll prepare my zephyr patches to zephyr PR.

Regards,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276009F841DA2D085725319688FF0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
