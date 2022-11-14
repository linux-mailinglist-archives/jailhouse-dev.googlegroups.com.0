Return-Path: <jailhouse-dev+bncBAABBVF7ZGNQMGQEUVT5PEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD386283FC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 16:33:41 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id r4-20020adfbb04000000b00236639438e9sf2145228wrg.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 07:33:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668440020; cv=pass;
        d=google.com; s=arc-20160816;
        b=yccYGBU/2cwqGY5X9Yb0pfm1xUodg91ZPDOmkFTDIG9gpBfymoUD9YbJY+vh0ZRZHW
         PYcDkQ3zhhEXwNmMhgVsn59IFEu7KA2AFGYOLaM0IDq92ncZiR+KgsZK/icfsHp/6JTi
         MWfNI8k65ArdYFE9+Q7SnHuhha3Q6u7FBElk9LsSHH9CZk4IzwqrK+s7GoMJeJAX+dOl
         axlGL4HO3pyaXftuqtiyNpSfXuMbvUz6X74d4o/HOHlsqj1H9GLpxYcJDjbxjeh+iWi2
         LGIUnVFB5EGoZ1kRRb7jQUCq7iyhohTOw7wjIHhjkidob5/fRarHNPWHkT2Lli+YRjyS
         dzQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=QKq+ofNyUscFNPb0RRutrA/srhSaScRBhLGCsZdU8BU=;
        b=UAaNNbJbVBZSCNL170pLBakQeaWPYEYiC9OekDAChLd8taoP6JkkXNqF/UbQng1fgn
         xlapepTko8cJTxSvWvWVvmQf8xenpZKRvHxTI8fzJKzCpay3NjiovIwEEtm2wLr5e3ck
         Ty5yLHgrLm4KLsDq8pkDp2WiyS9YZHR3eT2Bk3d19rGxBOv696IxzHiLvmJrM1epDciF
         HKZ2Tg0lt1GkycYUOTx28BMJL+IkXXLOYXm3Td+NDyS3itJnAF95E5GJ0/Tsa1hv3/+e
         DqqSoA4CSQDu9zCDQlLgNr8GD6UJbKTggUb+qO/zZ+PO1duXD2Zlr99bm08Kpk/3Vwk5
         Jx9Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=Wi7IbfZW;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKq+ofNyUscFNPb0RRutrA/srhSaScRBhLGCsZdU8BU=;
        b=DOXeR233CYQFrWLvp7bGtJcDzmgpokXtN8vkLUHs0TXpdpl9aZRgqmPdNQWGT182aj
         MaORen/6KV8Tk1UTv+UVuOrlkiER9pJ/T4zkWPUIuvYk40zGWxB9UNVkBthtgqdGmmM4
         eYep9RUWAoKnmlDKGAacjKu8AJoFY6a7D71+5SFOr6DUaodgEYHnBkj7/Vfa9qbOwp6o
         /RgB5dGqkDpsVzllZoTaz62QUbQtFaOJFbwbYNiGlWf9Vt3tzKwfdGTbr61P8vjRYWq9
         RKyjpEh8UAWu+TBHpO7TnWW6jcQFcVgKm1ZBSIgaqwUCKZxC5tQTQlCEiXQGJaanTrGB
         l1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKq+ofNyUscFNPb0RRutrA/srhSaScRBhLGCsZdU8BU=;
        b=OS4ZlG/7AE17yRKpTKx3p71peIWbCIAWqixrR/ibntXacdoekuialMjjC1YKMaSH7Q
         hCgr8bfZDXTiGP+lAEHJxLCekX18NW2pEvvQIAmIAT4x5agcT2133pzauKEweh5uk9SX
         Kmc9gGfrfcpQueZBvAvbur4dcAn2AsE+Xu/IkyOzZamoLyZaq7q/DX1/RYAKDyaGW19q
         +NJ4AvFLTzAjWAT88t1TME6ck/X3JIvhxs1HPmEh9WmS4svg8dv+GZ3G8qHery5NNl/P
         qe8CmrYU5y0S8qO/KIK7AEAnB7xHU5RhAk7gPwehiKJSe23lEmmyEgDd7Zxdm0jCO8yr
         zGJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkCm2EjPXl512cFJQYoHwFUgQ26CfTzqUXg6TakNdp9/S/gM3ET
	54g3Cw9kMiCXrlGFp6SaMZc=
X-Google-Smtp-Source: AA0mqf5VfCag7dqXWeGj1AB/+wVIOO6oATw3DNPD9DpsjbME7ipEQSXR7tjW5G87t1Dm/Rx/w7/28Q==
X-Received: by 2002:a5d:4386:0:b0:22e:3177:1401 with SMTP id i6-20020a5d4386000000b0022e31771401mr7721622wrq.148.1668440020723;
        Mon, 14 Nov 2022 07:33:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:222:b0:22c:d34e:768c with SMTP id
 l2-20020a056000022200b0022cd34e768cls16663772wrz.0.-pod-prod-gmail; Mon, 14
 Nov 2022 07:33:39 -0800 (PST)
X-Received: by 2002:a05:6000:510:b0:241:792f:b1fb with SMTP id a16-20020a056000051000b00241792fb1fbmr6239395wrf.436.1668440019593;
        Mon, 14 Nov 2022 07:33:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668440019; cv=pass;
        d=google.com; s=arc-20160816;
        b=vfgFXJ0RcGhAkSiiqkQzltN9SAgWGSK3RzYBTraMI+o3MuEWPjvCrdxp+JdYrK7/Pq
         zHcQUSNzEEI5CcgLUN6wm0m8Z8XIDEYhZU8X/ZVFJsNQ+TpkX2hOvVB81/TqUVAKcPbk
         zmdsjh0HH96yIJNke1evmuLlY4EDNRik2aqqsuvLIgdIDcUfDW2DLFsvcflIUfY6IeGT
         mYucbjuaxhO89dN2MbXqv3L1jeUFvfviAnAo9WMk8PEnLFEHJDaDsHDQ2iaU7tMkkoJA
         9sga6RiftwqXPskO3ogdiKSHJ+S1/oNRSrs7nNU9Zgv6oOW2CLMa2/rPN7bZwLwll2l6
         deAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=wg2yhvry3VFVBEz9cAr1ZdHww7wDay9cj9GxaaMyvs0=;
        b=wA4+wqDQ6A+HXTHXV1mPWOHncD6t3a0uAwtJY9+DlhNLUFiq2TItxAicKU8rqgy4X4
         nj//Ed4ouoUXJuC/SgR9yHAJ3TqJZD75rphbUXoCsPr3w4S746U1Jl8cK/FaOV7NKab5
         NFxPHmuxi8u3+onGkQR3W4ZDkxhbFtynwH6BPz4PonjEaMBUat1D4+RV61xonNgyIEeL
         aue5NUmKTl5SV434/oKyhevwtnYYDbIuJvdXsg03QIMhPBx1nqwj/fwm8g6Un84IFGbg
         DFVuifFNV2q90XqGIPWQaMkaUCrF5+qkzwOfCrFTO1j9nsDSOBKpcjbzl4PW6F46YyaN
         bGtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=Wi7IbfZW;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from seine.is.ed.ac.uk (seine.is.ed.ac.uk. [129.215.17.202])
        by gmr-mx.google.com with ESMTPS id co7-20020a0560000a0700b0023677081f0esi326581wrb.7.2022.11.14.07.33.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:33:39 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) client-ip=129.215.17.202;
Received: from exseed.ed.ac.uk (hbdkb3.is.ed.ac.uk [129.215.235.37])
	by seine.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2AEFXbQC009086
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 14 Nov 2022 15:33:37 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdkb3.is.ed.ac.uk
 (129.215.235.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 14 Nov
 2022 15:33:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13 via Frontend Transport; Mon, 14 Nov 2022 15:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmz2Yqvgdoy/qIQIfWaUmAHicfPG0ax7W9WEETq0pphH+9y0cS7ayys3gsufw+e0fEFpaqGyJrew3L31sv7S03uz5Qu8h7TUF8hRtZbpXoR5X466h7ta3trtzLvRIJs2CIYlhvM2zSxTHvc5tw/9qfmvbgagHwa7nXn70XissRfa8DrQA45C0enmbOj1b6+IL/U3mGG1VBMxUnnZmdDI0nwHSy8/8iFUYV22DBRn3VeNzsusou+xE/X+4LkakEBwUkHZ8jotBEa3I/U2G9XtERFnSahDZkpLsOSMMeaLrxbPrWxtdDO+U7T+j9StFHWmW2eTNvKrSdl7f7GNDAyMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg2yhvry3VFVBEz9cAr1ZdHww7wDay9cj9GxaaMyvs0=;
 b=GIOrERANlnTEDIDBgKvKBibf9bbqjCGmSkQ7sh58I1EeHnuLcmmgTJh5FEF+0NtOzbIlgUee5+2jYUcVZXxKDmjsZHfD3l5t5P2DVlUxgtUIruGtTZYAsgIgrytziXGhTWduo186i2dV59SmQDm8D5EbMcTaOlZEiRYWkUVi5sWiwJmTN64P2PZes6bbFTDj3kDx+f13jtR8xgYBjudgKrxrJoXKW1T/FGt35Qh63Ev85lOdhyHKtR3pyzcfg8km7l7YERGf9TIFRFZF7I2DphTPXBaDUyS+oGLfcA6F/pdzXbEq7v67e9IZObR2dx1zP+HkfzrFj4xeNwREbiBsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by AS8PR05MB9763.eurprd05.prod.outlook.com (2603:10a6:20b:56f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 15:33:22 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 15:33:21 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Henning Schild <henning.schild@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCK47kFSAgAHcNMCAALsugIAAZUl1
Date: Mon, 14 Nov 2022 15:33:21 +0000
Message-ID: <AM0PR05MB601897535EA411A0535D9A5DA9059@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
	<63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
	<AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
In-Reply-To: <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|AS8PR05MB9763:EE_
x-ms-office365-filtering-correlation-id: 197113aa-6ecc-436c-100b-08dac6559018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ji1OefagxUhkpLPI3NqpYIFl13+7fROXVBG+47mNCdhuXSnejL5nrj8o1JvCXWkOj/wdM7sOgO61UNoTbwYRP3xW8D6J13xiy9aEctT8imaDmaWr7fMpGmIrCCPB6Ceh72KAKidXUZVeYGke2rgbDoOnP/8kA1jxh42VOk0ZRpOHn+T2p18jjHfVnG3Rp6CYxH+oT8NF3L84wjRe5lKNfW5x4ttCSTUQfkUQRpuTWP8aefYWAFwFg+LoGi4he/eREJU2ccd+pgvEPkF8+3UD+RZpQWP+HZPoN30deo7FwtRpsDrwgiK93Ldkttgh7gwQcQQ7Gu0TShdax1n0UqlzkEPfdHS0ib0cgSthCN1yTdrlKVLiUVByb/Yf4Cz/3uYQV3vRjRlKtEFjqYDqhqgh5GY3U/DaKGHPRJ9zExDWRtw6qmqUcrD1+C6PwUSAm0cNrEMHIZ/URspUSaIEroUcLuMxSAnrnqkHf5LpJMc+ZeoTYDsaq+Sm1Ku7dtlbVS2yFFI+MwowEeyLZKY+JivQWTuYrzMSkgLvtK4ShaUfzJoWmCOezCGAHHMRAxh9EgDbAzag84eQKD7e5ZxOb7p7eHg70uHajDnj1btLlHBeQOUw7drtZw4l6W4e+bXRvG1DuBSWuwzcr4LIAEQPpR3W+fHBOFsKEZABCXcI1DOAeZn2fXNSPSLMAkGek5OEqVZO06lvua6zzhJiR8fE6UFtTOrVEMHkj/Pp6LsOyHO59rnOumDhPuLykthJp9iGI7XzXC3mhDfewBOqiIr5ahJGPNd7a0/qY6YG6ad/AU5rSyZoAGrBAMVMQXA4kwdSu7Zn4gzqAIAq8XbYfFM932GeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(6916009)(316002)(786003)(54906003)(9686003)(66946007)(86362001)(66446008)(76116006)(66556008)(186003)(45080400002)(64756008)(66476007)(91956017)(38100700002)(4326008)(8676002)(2906002)(122000001)(478600001)(8936002)(52536014)(71200400001)(33656002)(41320700001)(66899015)(41300700001)(38070700005)(26005)(83380400001)(19627405001)(5660300002)(55016003)(166002)(53546011)(7696005)(6506007)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?pioLiceAWsZj5sSx9LC16WK3/Ib9sNhz/hLTCsRoCsr2yKnkjlBiGMc0?=
 =?Windows-1252?Q?89DYSdDcJSqNL56mNR6Buyu4CR7SCLxWyWU28plS4Yxzm84Brs4V8PoN?=
 =?Windows-1252?Q?CbtMyX13wQfsmR+VfcEieLG6bz9Wu7aqxDepoP7aLXt3UrzNXVh0KaoR?=
 =?Windows-1252?Q?IlU5C5KaD3KIjDkw1UqmtlBi09jG4O1IAqllRYo1EERdXXbPDaLcTugK?=
 =?Windows-1252?Q?CQaZioer7P+HD78iAawRuzzWJSusUmQyFkAft/+1LI/YvsLusBwgIu4i?=
 =?Windows-1252?Q?eSkceZJ4t6pg96dkPbBF5DvBvKrZf0YQ+U6ON+v21u2LAM3yErDzVf+K?=
 =?Windows-1252?Q?96gFnFbpPeJs0t3xxm+kCcgc0/NSg9J48gs6nEfm7jksYOBs76H/YmKO?=
 =?Windows-1252?Q?cSwcOIZqiuVoGEwkV7nAyRUsXxU4EM8ycp9OP4Cj6iUf1MQmCFU4mN+Y?=
 =?Windows-1252?Q?DFNrER5drhCqUG5BpKZTUv7RW92Ry/ydL+FHnwmOGbWIwiwD2akhtcEd?=
 =?Windows-1252?Q?rRSuoO0noQl423mTJfAnHHkcQdtwfRlWO4TFQwOjygTbKTd31jrArXgr?=
 =?Windows-1252?Q?b3t/EJCkkImdeeW+ZsuHQrvt9Y1ntFTlKEIK2h7bRh17T5glnGbw4UeU?=
 =?Windows-1252?Q?Bz6Aq9ntGFhAqhgygtfyN2SpmS0qzTxF2IJQ7XEyzhNyPl4maiS8soNl?=
 =?Windows-1252?Q?iWQUvE/z/flIQf7i1KTns4nsBowtZgvOXKYd+Mbc3pLIVYnQIlLoOlkF?=
 =?Windows-1252?Q?qQl4R9d0ah59d0NCe5IFfS6wAoopMa7ogiCNoJNOPsSfKrZptWGQLfHJ?=
 =?Windows-1252?Q?KVoYwHqBXrw2HVRY6S+P9FkHN7wPXpq3ryOxv303CYLMKclCz9HelfoO?=
 =?Windows-1252?Q?YhqyCsbMYAg6OjfY7JKfOCil+/xUavkN4Fk0kzYdSaAtQpm7bv+WvELD?=
 =?Windows-1252?Q?kLznnZp1Hmg2rm8qo8uU5uSeUHazxlYZZdi05LkzAGbNs6myfKvuKcwp?=
 =?Windows-1252?Q?8x/QG1XxxYhNt8Xxq7h6rYXWn4Ftcmc1QMXoLUq9LCBs9G0HaRmu8GL7?=
 =?Windows-1252?Q?eI1yL+sPyLGeqB8kr2dWtqMuXYzGYxQdSM8Twy888aPjDpfxb0Mu+iyH?=
 =?Windows-1252?Q?yk9co+NsVpI0Tzc+Qa75uOtyk+wDjBrX+VYqWz9ZKPJ4IXOxaRI5QPWf?=
 =?Windows-1252?Q?YIliCkLBSYCJeuH6Y62XVB5MdBD6bJH8jrKo90seAi31NoxDLo6lRBNZ?=
 =?Windows-1252?Q?cziscszNbdijbfBHd5eRNbIccBfSJ/qr8SSVdAPmgotfpt/34mWDH8o2?=
 =?Windows-1252?Q?bSbt84SyUW5tKe1Ias1ImOALG+xVm8sBtW0qgKeL/dbAK1q+YSroXCJi?=
 =?Windows-1252?Q?agjLQe1VacSoGVwvk83L4uNfL7FvCyeSg0M+FWaCMhYi5Hc6V3hfuRIe?=
 =?Windows-1252?Q?ZP7TRlZXkLosK+Fhf11v6DY221xhIqPVR4FRj+lV/znzotP7IulsQKyO?=
 =?Windows-1252?Q?BLc5GCdqlSHFYnK3C4hGR9g+jSwtqHKGk09jOdd0JMrngthjIuq3WP4l?=
 =?Windows-1252?Q?xsdAd4jU9CXsXOM7uGQ7fNMiHgPIXOc6QkkdB6aROJ5usbncig8bpUb3?=
 =?Windows-1252?Q?Gy26OfKi7FpQVJvoKtOJVrWTI/zSUU27drh/mPxUCaj1bepaocX2DGme?=
 =?Windows-1252?Q?9g1CAg21Sv0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB601897535EA411A0535D9A5DA9059AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197113aa-6ecc-436c-100b-08dac6559018
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 15:33:21.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMcuWwhKxWssnIT3knyx5SKObENR7DwucI6yu3OlKpFRC55r/XTvgqEwO18eafDIsPfE5AtEHZu3xaxvCC2qnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB9763
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at seine.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=Wi7IbfZW;       arc=pass (i=1
 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass
 fromdomain=ed.ac.uk);       spf=pass (google.com: domain of
 karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender)
 smtp.mailfrom=Karim.Manaouil@ed.ac.uk;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=ed.ac.uk
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

--_000_AM0PR05MB601897535EA411A0535D9A5DA9059AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henning,

Do you mean the host's serial console?

The logs I sent in the previous email were copied from
the serial console of the host machine (/dev/ttyUSBx from
another head machine connected to the serial port of the host).

The system gets stuck after I run this series of commands:

$ jailhouse config create --mem-hv 32M configs/x86/sysconfig.c
$ make -j16 && make install
$ modprobe jailhouse
$ jailhouse enable configs/x86/sysconfig.cell

Check the previous email for the logs (I attached a text file as well as a =
snippet).

Best
Karim
________________________________
From: Henning Schild <henning.schild@siemens.com>
Sent: 14 November 2022 09:22
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; jan.kiszka@siemens.com=
 <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com <jailhouse-dev@go=
oglegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

Am Sun, 13 Nov 2022 22:24:45 +0000
schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:

> Hi Ralf,
>
> Thanks for the reply!
>
> >Did you use jailhouse-config-create?
>
> I am using `jailhouse config create` to generate the sysconfig.c file.
>
> >You can use the --mem-hv option to
> increate the memory. Try, for example, 32MiB and see if it works.
>
> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
> The driver prints "The Jailhouse is opening" on dmesg. However, right
> after that the CPUs get stuck, and I get rcu_sched detected stalls.
> The system is completely irresponsive.
>
> I attached a text file containing the full output from dmesg. Here is
> the initial part:

I guess the output of the hypervisor might also be valuable here.
According to its spec that machine should have a serial port, and with
that default config from the generate script you should see logs coming
out of there. With the usual 115200 8n1

Henning

> [  434.792008] The Jailhouse is opening.
> [  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  455.793303] rcu:     1-...0: (839 GPs behind)
> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [  455.80229=
2]
> rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x4000000000000000
> softirq=3D905/905 fqs=3D1827 [  455.811276] rcu:     3-...0: (144 GPs
> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
> 455.820266] rcu:     4-...0: (1 GPs behind)
> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
> 455.829252] rcu:     5-...0: (144 GPs behind)
> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [  455.83823=
8]
> rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x4000000000000000
> softirq=3D777/777 fqs=3D1827 [  455.847218] rcu:     7-...0: (144 GPs
> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827 [
> 455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364) [
> 455.862170] Sending NMI from CPU 87 to CPUs 1: [  465.776884] Sending
> NMI from CPU 87 to CPUs 2: [  467.182686] watchdog: BUG: soft lockup
> - CPU#0 stuck for 23s! [kworker/0:1:7] [  467.189857] Modules linked
> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
> 467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4
> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
> raid6_pq ] [  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G
>          O      5.10.0 #3 [  467.328767] Hardware name: Dell Inc.
> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [  467.337154]
> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
> [  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
> 0000000000000001 [  467.385123] RDX: ffff964f1fa31280 RSI:
> 0000000000000000 RDI: 0000000000000001 [  467.393024] RBP:
> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
> 0000000000000000 [  467.408836] R13: 000000000000007f R14:
> ffff962f1f42c9c0 R15: 0000000000000080 [  467.416737] FS:
> 0000000000000000(0000) GS:ffff962f1f400000(0000)
> knlGS:0000000000000000 [  467.425604] CS:  0010 DS: 0000 ES: 0000
> CR0: 0000000080050033 [  467.432127] CR2: 0000000000000000 CR3:
> 00000010987ea000 CR4: 00000000003506f0 [  467.440045] Call Trace: [
> 467.443289]  ? tlbflush_read_file+0x70/0x70 [  467.448266]  ?
> tlbflush_read_file+0x70/0x70 [  467.453242]  on_each_cpu+0x2b/0x60 [
> 467.457437]  __purge_vmap_area_lazy+0x5d/0x680 [  467.462679]  ?
> _cond_resched+0x16/0x40 [  467.467224]  ?
> unmap_kernel_range_noflush+0x2fa/0x380 [  467.473072]
> free_vmap_area_noflush+0xe7/0x100 [  467.478315]
> remove_vm_area+0x96/0xa0 [  467.482770]  __vunmap+0x8d/0x290 [
> 467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [  467.492299]
> drm_client_buffer_vunmap+0x16/0x20 [drm] [  467.498144]
> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [  467.505118]
> process_one_work+0x1b6/0x350 [  467.509912]  worker_thread+0x53/0x3e0
> [  467.514361]  ? process_one_work+0x350/0x350 [  467.519338]
> kthread+0x11b/0x140 [  467.523342]  ? __kthread_bind_mask+0x60/0x60 [
>  467.528389]  ret_from_fork+0x22/0x30
>
> Cheers
> Karim
> ________________________________
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Sent: 12 November 2022 17:47
> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
> enter_hypervisor returns -ENOMEM
>
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that
> the email is genuine and the content is safe.
>
> On 12/11/2022 18:15, Karim Manaouil wrote:
> > Hi Jan,
> >
> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
> > nodes), running Linux kernel v5.10 (same version used by jailhouse
> > CI with same patches applied).
> >
> > `jailhouse hardware check` return that everything is ok and that
> > "Check passed!".
> >
> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
> >
> > However, enter_hypervisor() [1] fails when entry() is called on
> > every cpu and return -ENOMEM as error_code.
>
> Try to reserve more memory. Maybe the default size of 6MiB for HV
> memory is insufficient for 128 CPUs.
>
> Did you use jailhouse-config-create? You can use the --mem-hv option
> to increate the memory. Try, for example, 32MiB and see if it works.
>
>    Ralf
>
> >
> > Do you possibly know where could the issue come from?
> >
> > Best
> > Karim
> >
> > [1]
> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6=
e2cbd99f9fc/driver/main.c#L251
> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef=
6e2cbd99f9fc/driver/main.c#L251>
> >
> > The University of Edinburgh is a charitable body, registered in
> > Scotland, with registration number SC005336. Is e buidheann
> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=
=A0raichte an Alba,
> > =C3=A0ireamh cl=C3=A0raidh SC005336.
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61=
DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com
> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Dema=
il&utm_source=3Dfooter>.
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB601897535EA411A0535D9A5DA9059%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB601897535EA411A0535D9A5DA9059AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
i Henning,</span><br>
<br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">D=
o you mean the host's serial console?</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">T=
he logs I sent in the previous email were copied&nbsp;</span><span style=3D=
"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">from&nbsp;</span></d=
iv>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">t=
he serial console of the host machine (/dev/ttyUSBx from</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">another head machine connected to the serial port o=
f the host).</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">T=
he system gets stuck after I run this series of commands:</span></div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">$ jailhouse config create --mem-</span><span style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">hv</span><span st=
yle=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">&nbsp;32M
 configs/x86/sysconfig.c</span><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">$ make -j16 &amp;&amp; make install</span><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">$ modprobe jailhouse</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">$ jailhouse enable configs/x86/sysconfig.cell</span=
><br>
</div>
<div><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Check the previous email for the logs (I attached a=
 text file as well as a snippet).</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">B=
est</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">K=
arim</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Henning Schild &lt;he=
nning.schild@siemens.com&gt;<br>
<b>Sent:</b> 14 November 2022 09:22<br>
<b>To:</b> Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
<b>Cc:</b> Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;; jan.kiszk=
a@siemens.com &lt;jan.kiszka@siemens.com&gt;; jailhouse-dev@googlegroups.co=
m &lt;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: Jailhouse: enter_hypervisor returns -ENOMEM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
Am Sun, 13 Nov 2022 22:24:45 +0000<br>
schrieb Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;:<br>
<br>
&gt; Hi Ralf,<br>
&gt;<br>
&gt; Thanks for the reply!<br>
&gt;<br>
&gt; &gt;Did you use jailhouse-config-create?<br>
&gt;<br>
&gt; I am using `jailhouse config create` to generate the sysconfig.c file.=
<br>
&gt;<br>
&gt; &gt;You can use the --mem-hv option to<br>
&gt; increate the memory. Try, for example, 32MiB and see if it works.<br>
&gt;<br>
&gt; I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.<br>
&gt; The driver prints &quot;The Jailhouse is opening&quot; on dmesg. Howev=
er, right<br>
&gt; after that the CPUs get stuck, and I get rcu_sched detected stalls.<br=
>
&gt; The system is completely irresponsive.<br>
&gt;<br>
&gt; I attached a text file containing the full output from dmesg. Here is<=
br>
&gt; the initial part:<br>
<br>
I guess the output of the hypervisor might also be valuable here.<br>
According to its spec that machine should have a serial port, and with<br>
that default config from the generate script you should see logs coming<br>
out of there. With the usual 115200 8n1<br>
<br>
Henning<br>
<br>
&gt; [&nbsp; 434.792008] The Jailhouse is opening.<br>
&gt; [&nbsp; 455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks=
:<br>
&gt; [&nbsp; 455.793303] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 1-...0: (839 GPs behi=
nd)<br>
&gt; idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [&nbsp; 4=
55.802292]<br>
&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 2-...0: (144 GPs behind) idle=3D812/1/0x4=
000000000000000<br>
&gt; softirq=3D905/905 fqs=3D1827 [&nbsp; 455.811276] rcu:&nbsp;&nbsp;&nbsp=
;&nbsp; 3-...0: (144 GPs<br>
&gt; behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [=
<br>
&gt; 455.820266] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 4-...0: (1 GPs behind)<br>
&gt; idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [<br>
&gt; 455.829252] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 5-...0: (144 GPs behind)<br>
&gt; idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [&nbsp; 4=
55.838238]<br>
&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 6-...0: (144 GPs behind) idle=3D912/1/0x4=
000000000000000<br>
&gt; softirq=3D777/777 fqs=3D1827 [&nbsp; 455.847218] rcu:&nbsp;&nbsp;&nbsp=
;&nbsp; 7-...0: (144 GPs<br>
&gt; behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827=
 [<br>
&gt; 455.856404]&nbsp; (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D36=
4) [<br>
&gt; 455.862170] Sending NMI from CPU 87 to CPUs 1: [&nbsp; 465.776884] Sen=
ding<br>
&gt; NMI from CPU 87 to CPUs 2: [&nbsp; 467.182686] watchdog: BUG: soft loc=
kup<br>
&gt; - CPU#0 stuck for 23s! [kworker/0:1:7] [&nbsp; 467.189857] Modules lin=
ked<br>
&gt; in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype<br>
&gt; br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT<br>
&gt; nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [<br>
&gt; 467.189928]&nbsp; binfmt_misc configfs efivarfs ip_tables x_tables aut=
ofs4<br>
&gt; ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic<br>
&gt; async_raid6_recov async_memcpy async_pq async_xor xor async_tx<br>
&gt; raid6_pq ] [&nbsp; 467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted=
: G<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 5.10.0 #3 [&nbsp; 467.328767] Hardware name: Dell Inc.<br>
&gt; PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [&nbsp; 467.337154]<br>
&gt; Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [<br>
&gt; 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [<br>
&gt; 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe<b=
r>
&gt; ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09<b=
r>
&gt; f3 90 &lt;8b&gt; 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe=
 44 7<br>
&gt; [&nbsp; 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [<br>
&gt; 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:<br>
&gt; 0000000000000001 [&nbsp; 467.385123] RDX: ffff964f1fa31280 RSI:<br>
&gt; 0000000000000000 RDI: 0000000000000001 [&nbsp; 467.393024] RBP:<br>
&gt; 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [<br>
&gt; 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:<br>
&gt; 0000000000000000 [&nbsp; 467.408836] R13: 000000000000007f R14:<br>
&gt; ffff962f1f42c9c0 R15: 0000000000000080 [&nbsp; 467.416737] FS:<br>
&gt; 0000000000000000(0000) GS:ffff962f1f400000(0000)<br>
&gt; knlGS:0000000000000000 [&nbsp; 467.425604] CS:&nbsp; 0010 DS: 0000 ES:=
 0000<br>
&gt; CR0: 0000000080050033 [&nbsp; 467.432127] CR2: 0000000000000000 CR3:<b=
r>
&gt; 00000010987ea000 CR4: 00000000003506f0 [&nbsp; 467.440045] Call Trace:=
 [<br>
&gt; 467.443289]&nbsp; ? tlbflush_read_file+0x70/0x70 [&nbsp; 467.448266]&n=
bsp; ?<br>
&gt; tlbflush_read_file+0x70/0x70 [&nbsp; 467.453242]&nbsp; on_each_cpu+0x2=
b/0x60 [<br>
&gt; 467.457437]&nbsp; __purge_vmap_area_lazy+0x5d/0x680 [&nbsp; 467.462679=
]&nbsp; ?<br>
&gt; _cond_resched+0x16/0x40 [&nbsp; 467.467224]&nbsp; ?<br>
&gt; unmap_kernel_range_noflush+0x2fa/0x380 [&nbsp; 467.473072]<br>
&gt; free_vmap_area_noflush+0xe7/0x100 [&nbsp; 467.478315]<br>
&gt; remove_vm_area+0x96/0xa0 [&nbsp; 467.482770]&nbsp; __vunmap+0x8d/0x290=
 [<br>
&gt; 467.486792]&nbsp; drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [&nbsp; 467.492=
299]<br>
&gt; drm_client_buffer_vunmap+0x16/0x20 [drm] [&nbsp; 467.498144]<br>
&gt; drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [&nbsp; 467.5051=
18]<br>
&gt; process_one_work+0x1b6/0x350 [&nbsp; 467.509912]&nbsp; worker_thread+0=
x53/0x3e0<br>
&gt; [&nbsp; 467.514361]&nbsp; ? process_one_work+0x350/0x350 [&nbsp; 467.5=
19338]<br>
&gt; kthread+0x11b/0x140 [&nbsp; 467.523342]&nbsp; ? __kthread_bind_mask+0x=
60/0x60 [<br>
&gt;&nbsp; 467.528389]&nbsp; ret_from_fork+0x22/0x30<br>
&gt;<br>
&gt; Cheers<br>
&gt; Karim<br>
&gt; ________________________________<br>
&gt; From: Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br>
&gt; Sent: 12 November 2022 17:47<br>
&gt; To: Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; jan.kiszka@siemens=
.com<br>
&gt; &lt;jan.kiszka@siemens.com&gt; Cc: jailhouse-dev@googlegroups.com<br>
&gt; &lt;jailhouse-dev@googlegroups.com&gt; Subject: Re: Jailhouse:<br>
&gt; enter_hypervisor returns -ENOMEM<br>
&gt;<br>
&gt; This email was sent to you by someone outside the University.<br>
&gt; You should only click on links or attachments if you are certain that<=
br>
&gt; the email is genuine and the content is safe.<br>
&gt;<br>
&gt; On 12/11/2022 18:15, Karim Manaouil wrote:<br>
&gt; &gt; Hi Jan,<br>
&gt; &gt;<br>
&gt; &gt; I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 N=
UMA<br>
&gt; &gt; nodes), running Linux kernel v5.10 (same version used by jailhous=
e<br>
&gt; &gt; CI with same patches applied).<br>
&gt; &gt;<br>
&gt; &gt; `jailhouse hardware check` return that everything is ok and that<=
br>
&gt; &gt; &quot;Check passed!&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Memory was reserved via `memmap=3D0x5200000$0x3a000000`<br>
&gt; &gt;<br>
&gt; &gt; However, enter_hypervisor() [1] fails when entry() is called on<b=
r>
&gt; &gt; every cpu and return -ENOMEM as error_code.<br>
&gt;<br>
&gt; Try to reserve more memory. Maybe the default size of 6MiB for HV<br>
&gt; memory is insufficient for 128 CPUs.<br>
&gt;<br>
&gt; Did you use jailhouse-config-create? You can use the --mem-hv option<b=
r>
&gt; to increate the memory. Try, for example, 32MiB and see if it works.<b=
r>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Do you possibly know where could the issue come from?<br>
&gt; &gt;<br>
&gt; &gt; Best<br>
&gt; &gt; Karim<br>
&gt; &gt;<br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b6971ac1=
5e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251</a><br>
&gt; &gt; &lt;<a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b697=
1ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">https://github.com/sie=
mens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#=
L251</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The University of Edinburgh is a charitable body, registered in<b=
r>
&gt; &gt; Scotland, with registration number SC005336. Is e buidheann<br>
&gt; &gt; carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann,=
 cl=C3=A0raichte an Alba,<br>
&gt; &gt; =C3=A0ireamh cl=C3=A0raidh SC005336.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; You received this message because you are subscribed to the Googl=
e<br>
&gt; &gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; &gt; To unsubscribe from this group and stop receiving emails from it,=
<br>
&gt; &gt; send an email to jailhouse-dev+unsubscribe@googlegroups.com<br>
&gt; &gt; &lt;<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com"=
>mailto:jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<br>
&gt; &gt; To view this discussion on the web visit<br>
&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR0=
5MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com"=
>
https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C=
697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a><br>
&gt; &gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM=
0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.=
com?utm_medium=3Demail&amp;utm_source=3Dfooter">https://groups.google.com/d=
/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018=
.eurprd05.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&g=
t;.<br>
&gt; &gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
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
om/d/msgid/jailhouse-dev/AM0PR05MB601897535EA411A0535D9A5DA9059%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB601897535EA411A0535D9A=
5DA9059%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB601897535EA411A0535D9A5DA9059AM0PR05MB6018eurp_--
