Return-Path: <jailhouse-dev+bncBAABBLNS5WNQMGQEUVXMFKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C9197631ED8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Nov 2022 11:55:42 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id s1-20020a197701000000b004a2aebd8b14sf4297724lfc.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Nov 2022 02:55:42 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1669028142; cv=pass;
        d=google.com; s=arc-20160816;
        b=f0MiOjxwRpZy9a/jKLQwDFBhGt2S7Q9Hwm3RGtv5k71Bu8zOhYYo12eYU2NhuptvlF
         zo9N9qzWBQ6/EzD8Behoijqk2PkyMXLQXahFpr4psE7S0HPS5FZH6J41s3W8c3NVHsoX
         FpB5QIqprBY5GLUGee4/xNBtL9hReFh0wZvaTrJJy18+sbsaddkgjrtaXmp+G3ZJDd8K
         PZ3XPn+oj1kGrri7bwxwpGK6woXwckWYrcOy8maovWm2zzSk4yByaQaUzjbdUCtBpToA
         cM5VLkC1mXdBdRhbwPsnzizLJWOuUWboivLdNzdeZl25HYJ1u2Tfwn+M+6bBlusMoIGL
         DExA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=CEsknFjVOOZT57IXyK3Oq2jc2W6SAMjQd/1BeeSLntk=;
        b=AQf9Hp2KAsufhfZQ+Xk7sBYTjQYg77i5JjIAFZXE5U2WDkiuWQgYB82D/nnSkxCCLX
         pC8NBXea0OPnU1/5KD8swwb9QofRla5CAAwGd850VLV0S7ZJPw3JWctLnCUEzrku/1zJ
         FNIN3rlfwV9+lC4qYEdOa3KwvPGEE/ASDU++cKUrWvKOnsR0S7VcJqLmSHoiE7/1FIuL
         FNEA8MJkrLNrQVpSQMl+Y4qpp63+OSmzwlRJJ60//Ef0M01/w9pt3Gt8PhyXQIhZD0hG
         ygKu/Y++kddB8NMFcuT5AtoYhoQHW74vqH0MyxAOKO4Wu3OIoiSEHFzSAohHHGRAJ6rV
         Bo2A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=py7MyfAG;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEsknFjVOOZT57IXyK3Oq2jc2W6SAMjQd/1BeeSLntk=;
        b=LmVtnaRGs122JOVADzEPHEbHYMDZgyEYvoKmAlmEVYyNvhUBGoX2sn10UC9k4BewRD
         5uXBHIh2GOeSQrKfM5/oqsUZq4P0aWvgCk+r6JSH/Zib+WXUsMz0GBHjzeMCB0sFnLyD
         pS+fezfOaSOtheT+j2mrbAy+dmGKB3ulaPuehQnZxY1drxx186HooaXLdb2ei86wvoH2
         VoOgj1mQkHyVCaNFdd9u8jXwpL3xuan/RzJPjwbMueY/Zv+lVmKzpkh0sO+lKOlePCNC
         YMNxvxde5SQylJV8hvscrk/ELEzeXVEv3GfxxRqA1Tlt9fe8YijQskZgTW6VkTpifANp
         fM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEsknFjVOOZT57IXyK3Oq2jc2W6SAMjQd/1BeeSLntk=;
        b=V8T0fUGmX/+8El6S8X/nsUFH/FKzMPu8IKq3dITg55IgtVrs9ZxL09Vg4p+u4LVKxN
         SSgVfzRwVwSd2FrSerUlcESOgsBvdoIJh3lLhjBoprUdQtYw8RuysG8MA3vqKXlm3EoM
         jhcb80e+yaORrqrixG8e+mS/Ap/lhk8rVLgb+wG9OCRscfjVYw+zI+sEp1lU6Pt8vJdJ
         ZTUQsPlSj/Yyb1b/CUR8Ihts7qxBPuXu4hxGa/Bf+VUOD5eKZ9x2P4c7Jd+VBy1/555X
         VMhou0CusyYoJqudd5Z3uXR8zjNugJozEEE0U9XDO9ee5AaN/876k7JnkgY4ZUKjAtZi
         +5aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plODBSVlDlOmBbxiGpXynZyr1hB0KlrrraBl6+dqOEMww+sCjZ8
	xNnphpP1KjJD224PZo9Dd2U=
X-Google-Smtp-Source: AA0mqf7+qm8unEC1T82GhXYEOeNyKyPyfBg9FX8IC5VZK5v+vNNo1nrVBBkBbPz87RXzSi4U5dZamw==
X-Received: by 2002:a2e:bcc2:0:b0:277:97f:a823 with SMTP id z2-20020a2ebcc2000000b00277097fa823mr5940554ljp.319.1669028142121;
        Mon, 21 Nov 2022 02:55:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4ecf:0:b0:49a:b814:856d with SMTP id p15-20020ac24ecf000000b0049ab814856dls559491lfr.1.-pod-prod-gmail;
 Mon, 21 Nov 2022 02:55:40 -0800 (PST)
X-Received: by 2002:ac2:4e82:0:b0:4ac:9f25:21c2 with SMTP id o2-20020ac24e82000000b004ac9f2521c2mr871861lfr.519.1669028139902;
        Mon, 21 Nov 2022 02:55:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1669028139; cv=pass;
        d=google.com; s=arc-20160816;
        b=hQxJCifndXb5bAd/R3/XVzdyNQ+eRK/tOHMvWsTskSVvCJaIsol2oR+QLRGhubSaLM
         Irov9yWE89gqj3i0H2DzJTT8dX6iSLsv8AzajaBesNRinnNWduN3DcsN3Y85upfZsemq
         1COnCYD1OmZ6Y7gxz1gE3aYo1C86GhTqFFBubYplygnXIV53R9dAzl6maoqeqbi8Yo7H
         jYB3Slkc+mfOpy2oYPsYBadizxe5eqBVrVWtkNLrarcDjzHKI1m7XT+dfA4VzT9Yc1HM
         d+6pKQWaxnxVa9qkjxW53vo/OTs0aNVJDeFM9QbsDOGC0dlej2YP0uyeoCZSZnVYD6CP
         Hw2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=QKjtpkZfyYg3hdj84j0QG/B+9YOX/w1boBIAH9xvS2A=;
        b=iPZRPpyjREGlIx7p8F1nNvz3QF7bGF6DQzvtZo8QJ3xs52NKsGTJgzL2oKauK3QeTx
         7laQn+69nEvyizOPegDGhDFSVZPhTZBLP7zH4vAbiFbO8KcsnYnycAUNxbf1GsWqU7zf
         4WIXCljdbyXjm3M6iZq5UiFcGWzycQfUUa9jCvNFeLBlrxKxosN7lcCpHXjmDFpm0tB6
         7/UmF8D956OTwD2Gnj12oCwRwEOAUCjQC8Y4dDRqsVwYFiALwB8QhXYK1DObaggcIAeP
         176Hp4z4h+i/fzwPXkAalwN/MO7qgFhBLWUy9kgjCGhYqw8rYMKRs53WQ2l5D/4mwGG2
         OobQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=py7MyfAG;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from loire.is.ed.ac.uk (loire.is.ed.ac.uk. [129.215.16.10])
        by gmr-mx.google.com with ESMTPS id o1-20020ac24e81000000b00499b6fc70ecsi422721lfr.1.2022.11.21.02.55.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:55:39 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) client-ip=129.215.16.10;
Received: from exseed.ed.ac.uk (hbdkb3.is.ed.ac.uk [129.215.235.37])
	by loire.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2ALAtYIs025842
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 21 Nov 2022 10:55:34 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdkb3.is.ed.ac.uk
 (129.215.235.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 21 Nov
 2022 10:55:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.106)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 21 Nov 2022 10:55:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdX+YW0jIE9Qnmq2B/kFi74fmB/m/eM+cOMhLRBBYOIX9+ze08qNLy2/i6jqbF5PURak54IQ7OU928Ikl3YEbpwySsdOawAR0iC5/K9a90OZWf4NYH5g9Jk9YX/4qcc4TtcihCp/wo5E92us5tC3lBM6RS3Oaafy0s1mWmb4kAMvoWeAI5vCDSkdL5EjFDAZnayhhVZQtkz2JdZo49uOLnpZZEKLwH8tF22HekkgOxovPhGIoKKbXhobOV+Q3Ivt/ge0e+fCph9BBjfY1PJRqvGzA5cPt4RK4kcGrsP+N4J4HHu5BqiUK9vwqixQ1003zEJFUdhwcXACNoIkYXgnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKjtpkZfyYg3hdj84j0QG/B+9YOX/w1boBIAH9xvS2A=;
 b=bEE2rGv707yOCVPJrc4sJ3Z4u+2+6o5eHGFmuAdVVQxLxJvx7u4ISPGSOzEq9LzMMzub/vIB9H5qfDAfivLtctcu7bq1ASR3riueSyAAiI0uPlp/VFnYxcmt9C4wsg6j7r9kqCR3pWJiRRiMXLjDMH4RjFk+D9mgthiXhUHd114LSxkCMy4fvh4w3wXeNfaADWR6tWKDkKFHTe4s6s4WpWUtRgtN8zVUA8B55I9leSnkYEKMHdRAr943XkBl44zBLEwgz27EeqPqxroLHBcpjjZQf4JoHeKmcPrPz+ppbpTI1lqR+IacubtgW9keuGOzN1Xf1XVyI4PV8HyBJLjIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by VI1PR05MB6894.eurprd05.prod.outlook.com (2603:10a6:800:18a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 10:55:18 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81%4]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 10:55:17 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
        Henning Schild
	<henning.schild@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCK47kFSAgAHcNMCAALsugIAFv5ZMgAD/TgCAAB/EjoAAIhWAgAMF/6KAAEVwgIAAyuPx
Date: Mon, 21 Nov 2022 10:55:17 +0000
Message-ID: <AM0PR05MB60182BDF701FD335A923BD42A90A9@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
 <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
 <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <79cf1f00-9c20-404e-150b-42142c804d3e@oth-regensburg.de>
 <DB8PR05MB602623B1DA27CE3A1662FD72A9099@DB8PR05MB6026.eurprd05.prod.outlook.com>
 <08d3ca0e-9f82-cc84-f70a-0b0c8000326a@oth-regensburg.de>
 <AM0PR05MB60188F8CE4254465566F345BA90B9@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <22e926f8-c036-0e15-81a8-154eb74bb6f9@oth-regensburg.de>
In-Reply-To: <22e926f8-c036-0e15-81a8-154eb74bb6f9@oth-regensburg.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|VI1PR05MB6894:EE_
x-ms-office365-filtering-correlation-id: b407056f-e7c0-4235-c9f2-08dacbaee099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hUFUipt7QwHD003KYZ4TsaNo+LkqItYZLsj1sI2Uk8kTArwCwEMhJ9TJQMQwQzdbcmGr40/SZevCb4ivy6Q9eWmSeGxCJUhByja4xjaU3nxL0dKh5gcSzuCjnsOj2zogGXONmoTAoskMMJ9GYQW9XOHwKE38PJZKuQ4a8XLXrWtW1XSWSSFbhGXQWE8GbnBD5+9EpG0WV7uh0uM+qyx0Vpj2g32LPIRqgJAbkjrxC0BxQ8S5KI8gqY4gPLxGeu8dnC1WEU1yXO9PiCA7oFwVsVlGt8SzxwFORG8lPyLbF1CWBGo8RVXpl/7xL83QzSlkerLEvOlbPUK/zhQOV7nqZafpX8tziU4FYKuh5ffv2x5d8nZ2LwtWfPOUkwFEZGD/8HYk2B3mltkfeBmyaBzs0tHq5juTFtcmMwiPf3HJq6YSuq3i4Uo/5uhvTDryw1Zb6NFeeSEbao9MpAaNXMxkm8ACCH87TxswNphrQAN3ds0kNinlQa8htFmtZ0b/wgT6E4te7Qg0+b3T9sKtdRAt7wrEccq0y1EXYw7lQ7J3x8Ot1GJGn6/+Hkr+4nxPzg2+7EGRj3h3JJCSFasUHvy1lgM4c1fmgHH4BjzM10zwMGSuGaaUvsue5ySWJ7nc1UX9NxA3IxOAkb6JyfVKKLkkO8cHBbxxU4Sf0d8SC/hgMV2+gE62SBDzA9yxnL6JJeun83NtX02gWxJ7ilsgo3XwZLzWkRfAzyHOPABi3xHQWzl+vofGRUMPtdZWCf6sIKrPBBTq2sOVGt7BU7M7B16NNVWwUKs7xB86AENUJ3d3Y2s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(66899015)(33656002)(38070700005)(38100700002)(41300700001)(52536014)(30864003)(166002)(2906002)(66574015)(83380400001)(122000001)(86362001)(66476007)(66446008)(8676002)(4326008)(91956017)(66556008)(9686003)(316002)(786003)(76116006)(66946007)(26005)(71200400001)(19627405001)(64756008)(54906003)(45080400002)(966005)(6916009)(186003)(41320700001)(8936002)(5660300002)(18265965005)(478600001)(6506007)(7696005)(53546011)(55016003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?kTGdGXJOdChvTM7ax9q6k5bcUIyJOA2ML2XvxuhXAngvPW1srcyL3LQ9?=
 =?Windows-1252?Q?G1AXTwwwGgQFqYo3DaMNNCYEnRO8xOtwGYNq6uWC7FuxYsqH6jz2S7KC?=
 =?Windows-1252?Q?+BOrp5wE/z285G7qlHW6nQpeoYE12ngpzGzm7LvaFG4C62hrT4Gjpquz?=
 =?Windows-1252?Q?UUuQb1C7U3+8y/EbsXN6eEQ1dI9xrYs4975X8sJgEg4tZIFv2wjthG6e?=
 =?Windows-1252?Q?mdRSgDmdmmi/eXV4DKFhNSNHGNtXbgSCo3AOAytbs1Oz6J4LOSP+7NeF?=
 =?Windows-1252?Q?weeho/MapsG+bT00gncn/mGtQNZ4Ndle0nfx++Dtx7bxqmENcgQ+zlV5?=
 =?Windows-1252?Q?TO3Iyx9SRCvYQcunf2c3jtkxQxLINEXaDTNRNUH/wmpTfnPJT25hWs4r?=
 =?Windows-1252?Q?iPc1cFNnY5S/Y9JXk+HfJQyRzcerumAo9eUnuA8CyrAMa1AclER5j8fT?=
 =?Windows-1252?Q?eVtA+7lOoQEw02F/6x/jer1XxC6M9IbNMj8YmDtdFL4RmtVslzSsbUEQ?=
 =?Windows-1252?Q?whG9onuQ1fr/oaeqP2qRyJD9yCRcUSyU19MxQVVWXpd2sPDGrfkgGoNx?=
 =?Windows-1252?Q?Y+nlepB27Hl0M7k9AC9sj6L/WvwiSekZ0DWfcn0xi0pTiVocsvgcu/Y2?=
 =?Windows-1252?Q?t3BF+v2/cuzT//b/6kPJe9jEdGQOU8P+0ulLJssCecTc9TD+6e/eX7JV?=
 =?Windows-1252?Q?nY4WKpsxtIbOMbZWynQShRF3Fpm4+L4GpuZpA7V2bXYhyaSaRpoqXGD9?=
 =?Windows-1252?Q?PJan94Uo2EbGGd4VKmgA3PseHZz7repFeCYJqcM2TKWUr7xTKxIcoYJc?=
 =?Windows-1252?Q?GdQrXf9ZOCdjIec5wqD/V0BmJGVUl6PnVfAEWCL+oBvRr/kzFTg2R/tF?=
 =?Windows-1252?Q?KSWf0YfpE+laVL5zvhla7tA2xUEjSeTE9c3yI3Ljr9+CQndbJF00w5Hu?=
 =?Windows-1252?Q?mesO79wnwH74URLE4Hm+qxt0pHr7x9WSs9e4Qzom0eVVofWcpCEz/wqs?=
 =?Windows-1252?Q?CyeVI2TfLTWrqNJBDJWf9mPTVoO1rS6cSTg2FOf/KeEVrKGNhvmlgqK/?=
 =?Windows-1252?Q?3CymMRk1okVZ+18oa8blionX6mwcTH/U2RLTj6nBq2QhdHDE1Ls+BJ4h?=
 =?Windows-1252?Q?oJNBDuXrRrLXmio+4tCiylgBPtMXiCBfbs6m5GsqTw/HozxsLI83qYLJ?=
 =?Windows-1252?Q?8P9hSBmOLPxvMPn8Aa5FSbAnO/+IhGT/zQoF4twNUk+nmcLsEuL7Pdfh?=
 =?Windows-1252?Q?GU6PD+nPntJlU2UwVw6fT4m8lKrO3BXSgtYiu8lOSD0J5TgJqtyAgUsj?=
 =?Windows-1252?Q?nUaJx1R5Y/rgf/IGBGBe7rR9mPfX0w4VLl8pMUA7Pfr16I9M/iBLsyZu?=
 =?Windows-1252?Q?s0ov9fiwTHZlU2qHbl6axCoMYP2I+X133lJxDqSCNNCDjlcNi7K8VU/A?=
 =?Windows-1252?Q?k5CX8MS9nvu7nGCW5aD4CXy2aucVQ/5ggRgkhAKbM7ql8YkAilwKuMhw?=
 =?Windows-1252?Q?InxPYSglUe0PdBIiyDjjahN9xgDA6yV0HhV9+7EyOa1i0SfqTmUNXShZ?=
 =?Windows-1252?Q?N7+lNXS70PDFbWYHL/DLvGu9cpHxxviZZTIinZlDyQqmQHIcXLTRMUPS?=
 =?Windows-1252?Q?c/4ZuYCDr83imAHTaZpIC8bb3pMXTsEEBodHV5zUhRwd6YcVCZlQ/n5k?=
 =?Windows-1252?Q?vUiNoZHHy9g=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB60182BDF701FD335A923BD42A90A9AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b407056f-e7c0-4235-c9f2-08dacbaee099
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 10:55:17.8800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0t4d3VK+6ckffreUN2qKhVSSjD8Jo4QCjgwz1W5yrkhWtmvWyMnEWThXSTkRBN/iWqs+4FqIi9hKy0Gxr1wwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6894
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at loire.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=py7MyfAG;       arc=pass (i=1
 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass
 fromdomain=ed.ac.uk);       spf=pass (google.com: domain of
 karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender)
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

--_000_AM0PR05MB60182BDF701FD335A923BD42A90A9AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Thanks again! It's working now!

The serial console is connected to the secondary UART
on the machine. That's why I used 0x2f8 (I had to specify
-C ttyS1 in jailhouse config create).

I just prevented Linux from writing to the serial console
(removed console=3DttyS1 from cmdline).

Cell was created, demo was executed, then shutdown and
destroyed all successfully.

I appreciate your help a lot. Without you, I wouldn't have been
able to make it work (or maybe I would end up spending hours
reading every line of code and debugging).

I will be using Jailhouse in the next few months. I would be glad
to contribute any improvements (I'll take a look later to the sysfs
iomem parser and try to understand why it didn't add AMD
IOMMU leaf nodes).

Cheers
Karim
________________________________
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Sent: 20 November 2022 22:37
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
Cc: jan.kiszka@siemens.com <jan.kiszka@siemens.com>; Henning Schild <hennin=
g.schild@siemens.com>; jailhouse-dev@googlegroups.com <jailhouse-dev@google=
groups.com>
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

Hi Karim,

On 20/11/2022 19:47, Karim Manaouil wrote:
> Hi Ralf,
>
> Thanks a lot for the help!
>
> The missing entries are for AMD IOMMU (they appear
> in /proc/iommu tree, but for some reason the jailhouse
> config script is not adding them to sysconfig.c).
>
> I also had to add amd_iommu=3Dfalse to the kernel cmdline.
> Now the jailhouse is correctly created with no issues, and
> the Linux on the root cell works perfectly.

Perfect, sounds good! Yep, that's required. Afair, we don't have support
for the AMD IOMMU yet.

>
> I wanted to try creating another cell using the demo provided
> by configs/x86/apic-demo.c (since it's very simple), but it always
> generates a PIO read error.
>
> The PIO address is for UART (0x2f9). This address exists in a
> PIO_RANGE in apic-demo.c and it also exists on the root cell's
> sysconfig.c, so it should work, but here we are.

When you create a non-root cell, you take away that PIO_RANGE from the
root cell. If the root cell now tries to further access that port,
Jailhouse will stop that cell due to port access violation. This is
exactly what happened and in fact it works as intended.

What you need to do is to ensure that Linux won't claim that port, but I
wonder why Linux actually accesses that port=E2=80=A6 0x2f8 is the secondar=
y
UART (0x3f8 is the primary, also used by Jailhouse for its debug
output). Maybe there's a TTY allocated on that port?

There are two solutions to address your issue (you should do both, just
to have your system under control):

1. You can, limit the number of uarts with the nr_uarts
    kernel parameter, or/and, identify and stop the application that
    accesses the UART. 'lsof | grep ttyS1' or checking systemd's services
    (via systemctl) might be a good starting point.

2. Don't assign PIO_RANGE(0x2f8, ...) to the non-root cell if you (a)
    don't have a secondary UART at all (which I would expect), and (b) if
    you don't need it inside that cell. You can use the primary UART for
    the non-root cell.

As far as I remember, the non-root cell will use the primary UART in any
case by default.

   Ralf

>
> Here is the log that I get after running:
> jailhouse cell create configs/x86/apic-demo.cell
> it shows both hypervisor and Linux output. I also
> attached apic-demo.c for reference.
>
> Page pool usage after late setup: mem 1934/7635, remap 65703/131072
> Activating hypervisor
> [  698.582280] jailhouse: enter_hypvisor called on every cpu
> [  698.587918] jailhouse: console unmapped
> [  698.591942] jailhouse: firmware released
> [  698.595998] jailhouse: root cell registered
> [  698.600313] jailhouse: pci virtual root device added
> [  698.604973] hpet_rtc_timer_reinit: 5 callbacks suppressed
> [  698.604977] hpet: Lost 5719 RTC interrupts
> [  698.605434] The Jailhouse is opening.
> [  733.204370] jailhouse: pci setup done
> [  733.283290] IRQ fixup: irq 789 move in progress, old vector 39
> [  733.289163] IRQ 789: no longer affine to CPU3
> [  733.294892] smpboot: CPU 3 is now offline
> Created cell "apic-demo"
> Page pool usage after cell creation: mem 1949/7635, remap 65703/131072
> AFATAL: Invalid PIO read, port: 2f9 size: 1
> RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d627c98 FLAGS: 6
> RAX: 0xffffffff999b2670 RBX: 0x0000000000000247 RCX: 0x0000000000000000
> RDX: 0x00000000000002f9 RSI: 0x0000000000000001 RDI: 0xffffffff9b3da9f8
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000003082bea000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 29 (Cell: "RootCell")
> FATAL: Invalid PIO read, port: 2fa size: 1
> RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d450f08 FLAGS: 6
> RAX: 0xffffffff999b2670 RBX: 0xffffffff9b3da9f8 RCX: 0x0000000000000000
> RDX: 0x00000000000002fa RSI: 0x0000000000000002 RDI: 0xffffffff9b3da9f8
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000002085c36000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 64 (Cell: "RootCell")
>
>
> Cheers
> Karim
> ------------------------------------------------------------------------
> *From:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> *Sent:* 18 November 2022 20:18
> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
> *Cc:* jan.kiszka@siemens.com <jan.kiszka@siemens.com>; Henning Schild
> <henning.schild@siemens.com>; jailhouse-dev@googlegroups.com
> <jailhouse-dev@googlegroups.com>
> *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that
> the email is genuine and the content is safe.
>
> Hi Karim,
>
> On 18/11/2022 19:27, Karim Manaouil wrote:
>> Hi Ralf,
>>
>> Thanks! I appreciate your help!
>>
>> I disabled MCE to get rid of the unhandled MSR read error. It works.
>>
>> I also fixed the PCIe 04:00.0 invalid write to reg 0xb4 by manually addi=
ng
>
> Okay, take care that if you manually add an entry that you need to
> adjust the array size and their references.
>
>> a capability entry to sysconfig.c giving it write permissions (btw, the
>> entry
>> for that register was not generated by the config tool).
>
> Not everything is covered by the generator, some parts require manual
> inspection.
>
>>
>> Now, I am still getting the invalid MMIO/RAM read and write (see log bel=
ow).
>> I first get the read error immediately after the page pool message
>> is printed. Then after a little while, the write error follows up.
>
> Now we need to inspect /proc/iomem. You need to check what is behind
> address 0x90482020, and add an appropriate memory region entry to your
> config.
>
>     Ralf
>
>>
>> Always same case, immediate read error followed by a write error.
>> it happens every time (but the addresses change).
>>
>> Here is below the last log from jailhouse copy pasted.
>> I also attached the output of lspci -vvv as well as sysconfig.c.
>>
>> Cheers
>> Karim
>>
>> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
>> FATAL: Invalid MMIO/RAM read, addr: 0x0000000090482020 size: 4
>> RIP: 0xffffffff915d1735 RSP: 0xffffa9b08e97be18 FLAGS: 296
>> RAX: 0xffffa9b080780000 RBX: 0xffff934f4262a7c0 RCX: 0x0000000000000000
>> RDX: 0xffff934f47e32f10 RSI: 0xffff934f4004e800 RDI: 0x0000000000000021
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x00000020c2682000 CR4: 0x00000000003506a0
>> EFER: 0x0000000000001d01
>> Parking CPU 7 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>> FATAL: Invalid MMIO/RAM write, addr: 0x0000000093a82008 size: 4
>> RIP: 0xffffffff915ccce7 RSP: 0xffffa9b08db54da0 FLAGS: 2
>> RAX: 0xffffa9b080380000 RBX: 0x0000000000000001 RCX: 0x0000000000001a70
>> RDX: 0xffff9376c0004000 RSI: 0x3000004500000000 RDI: 0x7ffffffffffff003
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x00000001267d0000 CR4: 0x00000000003506a0
>> EFER: 0x0000000000001d01
>> Parking CPU 81 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>>
>>
>> ------------------------------------------------------------------------
>> *From:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> *Sent:* 18 November 2022 16:23
>> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>; Henning Schild
>> <henning.schild@siemens.com>
>> *Cc:* jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>> *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
>> This email was sent to you by someone outside the University.
>> You should only click on links or attachments if you are certain that
>> the email is genuine and the content is safe.
>>
>> Hi,
>>
>> On 18/11/2022 02:19, Karim Manaouil wrote:
>>> Hi Henning,
>>>
>>> I spent some more time debugging the issue.
>>> I am getting a "FATAL: Invalid MMIO/RAM write".
>>> Probably it's happening right after the first cpu that
>>> calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().
>>>
>>> Not sure why, but maybe you have some pointers.
>>>
>>> Here is the jailhouse output copy-pasted below.
>>>
>>> Cheers
>>>
>>> Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
>>> Code location: 0xfffffffff0000050
>>> Using xAPIC
>>> Page pool usage after early setup: mem 813/7635, remap 1/131072
>>> Initializing processors:
>>
>> Ok, having read your log, you have (at the moment) at least two issues:
>>
>> First:
>>
>>   > FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
>>
>> For the moment, go to your config and allow write access to that
>> capability. I could maybe help you with this if you share your config.
>> Please also attach lspci -vvv.
>>
>> I can send you the config diff, and in the long run, you need to
>> understand what the changes mean.
>>
>> Second:
>>
>>   > FATAL: Unhandled MSR read: c0002001
>>
>> That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine Check
>> Events (MCE) in your kernel config or add appropriate parameters to your
>> kernel to disable them.
>>
>> Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=3Doff t=
o
>> your kernel parameters.
>>
>> HTH,
>>
>>     Ralf
>>
>>>   CPU 6... (APIC ID 48) OK
>>>   CPU 64... (APIC ID 1) OK
>>>   CPU 0... (APIC ID 0) OK
>>>   CPU 16... (APIC ID 2) OK
>>>   CPU 112... (APIC ID 7) OK
>>>   CPU 104... (APIC ID 13) OK
>>>   CPU 40... (APIC ID 12) OK
>>>   CPU 72... (APIC ID 9) OK
>>>   CPU 8... (APIC ID 8) OK
>>>   CPU 56... (APIC ID 14) OK
>>>   CPU 120... (APIC ID 15) OK
>>>   CPU 110... (APIC ID 61) OK
>>>   CPU 46... (APIC ID 60) OK
>>>   CPU 14... (APIC ID 56) OK
>>>   CPU 78... (APIC ID 57) OK
>>>   CPU 94... (APIC ID 59) OK
>>>   CPU 30... (APIC ID 58) OK
>>>   CPU 126... (APIC ID 63) OK
>>>   CPU 62... (APIC ID 62) OK
>>>   CPU 2... (APIC ID 16) OK
>>>   CPU 66... (APIC ID 17) OK
>>>   CPU 18... (APIC ID 18) OK
>>>   CPU 82... (APIC ID 19) OK
>>>   CPU 114... (APIC ID 23) OK
>>>   CPU 50... (APIC ID 22) OK
>>>   CPU 98... (APIC ID 21) OK
>>>   CPU 34... (APIC ID 20) OK
>>>   CPU 12... (APIC ID 40) OK
>>>   CPU 76... (APIC ID 41) OK
>>>   CPU 60... (APIC ID 46) OK
>>>   CPU 124... (APIC ID 47) OK
>>>   CPU 44... (APIC ID 44) OK
>>>   CPU 108... (APIC ID 45) OK
>>>   CPU 92... (APIC ID 43) OK
>>>   CPU 28... (APIC ID 42) OK
>>>   CPU 26... (APIC ID 26) OK
>>>   CPU 90... (APIC ID 27) OK
>>>   CPU 74... (APIC ID 25) OK
>>>   CPU 10... (APIC ID 24) OK
>>>   CPU 106... (APIC ID 29) OK
>>>   CPU 42... (APIC ID 28) OK
>>>   CPU 58... (APIC ID 30) OK
>>>   CPU 122... (APIC ID 31) OK
>>>   CPU 20... (APIC ID 34) OK
>>>   CPU 84... (APIC ID 35) OK
>>>   CPU 36... (APIC ID 36) OK
>>>   CPU 100... (APIC ID 37) OK
>>>   CPU 116... (APIC ID 39) OK
>>>   CPU 52... (APIC ID 38) OK
>>>   CPU 4... (APIC ID 32) OK
>>>   CPU 68... (APIC ID 33) OK
>>>   CPU 96... (APIC ID 5) OK
>>>   CPU 32... (APIC ID 4) OK
>>>   CPU 88... (APIC ID 11) OK
>>>   CPU 55... (APIC ID 118) OK
>>>   CPU 119... (APIC ID 119) OK
>>>   CPU 87... (APIC ID 115) OK
>>>   CPU 23... (APIC ID 114) OK
>>>   CPU 71... (APIC ID 113) OK
>>>   CPU 7... (APIC ID 112) OK
>>>   CPU 39... (APIC ID 116) OK
>>>   CPU 103... (APIC ID 117) OK
>>>   CPU 47... (APIC ID 124) OK
>>>   CPU 111... (APIC ID 125) OK
>>>   CPU 15... (APIC ID 120) OK
>>>   CPU 79... (APIC ID 121) OK
>>>   CPU 31... (APIC ID 122) OK
>>>   CPU 95... (APIC ID 123) OK
>>>   CPU 127... (APIC ID 127) OK
>>>   CPU 63... (APIC ID 126) OK
>>>   CPU 86... (APIC ID 51) OK
>>>   CPU 22... (APIC ID 50) OK
>>>   CPU 38... (APIC ID 52) OK
>>>   CPU 102... (APIC ID 53) OK
>>>   CPU 118... (APIC ID 55) OK
>>>   CPU 54... (APIC ID 54) OK
>>>   CPU 70... (APIC ID 49) OK
>>>   CPU 109... (APIC ID 109) OK
>>>   CPU 45... (APIC ID 108) OK
>>>   CPU 93... (APIC ID 107) OK
>>>   CPU 29... (APIC ID 106) OK
>>>   CPU 13... (APIC ID 104) OK
>>>   CPU 77... (APIC ID 105) OK
>>>   CPU 61... (APIC ID 110) OK
>>>   CPU 125... (APIC ID 111) OK
>>>   CPU 5... (APIC ID 96) OK
>>>   CPU 101... (APIC ID 101) OK
>>>   CPU 37... (APIC ID 100) OK
>>>   CPU 85... (APIC ID 99) OK
>>>   CPU 21... (APIC ID 98) OK
>>>   CPU 117... (APIC ID 103) OK
>>>   CPU 53... (APIC ID 102) OK
>>>   CPU 69... (APIC ID 97) OK
>>>   CPU 49... (APIC ID 70) OK
>>>   CPU 1... (APIC ID 64) OK
>>>   CPU 65... (APIC ID 65) OK
>>>   CPU 81... (APIC ID 67) OK
>>>   CPU 17... (APIC ID 66) OK
>>>   CPU 97... (APIC ID 69) OK
>>>   CPU 33... (APIC ID 68) OK
>>>   CPU 113... (APIC ID 71) OK
>>>   CPU 25... (APIC ID 74) OK
>>>   CPU 89... (APIC ID 75) OK
>>>   CPU 41... (APIC ID 76) OK
>>>   CPU 105... (APIC ID 77) OK
>>>   CPU 9... (APIC ID 72) OK
>>>   CPU 73... (APIC ID 73) OK
>>>   CPU 121... (APIC ID 79) OK
>>>   CPU 57... (APIC ID 78) OK
>>>   CPU 3... (APIC ID 80) OK
>>>   CPU 67... (APIC ID 81) OK
>>>   CPU 35... (APIC ID 84) OK
>>>   CPU 99... (APIC ID 85) OK
>>>   CPU 115... (APIC ID 87) OK
>>>   CPU 51... (APIC ID 86) OK
>>>   CPU 19... (APIC ID 82) OK
>>>   CPU 83... (APIC ID 83) OK
>>>   CPU 107... (APIC ID 93) OK
>>>   CPU 43... (APIC ID 92) OK
>>>   CPU 11... (APIC ID 88) OK
>>>   CPU 75... (APIC ID 89) OK
>>>   CPU 123... (APIC ID 95) OK
>>>   CPU 59... (APIC ID 94) OK
>>>   CPU 27... (APIC ID 90) OK
>>>   CPU 24... (APIC ID 10) OK
>>>   CPU 80... (APIC ID 3) OK
>>>   CPU 48... (APIC ID 6) OK
>>>   CPU 91... (APIC ID 91) OK
>>> Initializing unit: AMD IOMMU
>>> AMD IOMMU @0xa1700000/0x80000
>>> Initializing unit: IOAPIC
>>> Initializing unit: PCI
>>> Adding PCI device 00:00.0 to cell "RootCell"
>>> Adding PCI device 00:01.0 to cell "RootCell"
>>> Adding PCI device 00:01.1 to cell "RootCell"
>>> Adding PCI device 00:01.3 to cell "RootCell"
>>> Adding PCI device 00:01.4 to cell "RootCell"
>>> Adding PCI device 00:02.0 to cell "RootCell"
>>> Adding PCI device 00:03.0 to cell "RootCell"
>>> Adding PCI device 00:04.0 to cell "RootCell"
>>> Adding PCI device 00:07.0 to cell "RootCell"
>>> Adding PCI device 00:07.1 to cell "RootCell"
>>> Adding PCI device 00:08.0 to cell "RootCell"
>>> Adding PCI device 00:08.1 to cell "RootCell"
>>> Adding PCI device 00:14.0 to cell "RootCell"
>>> Adding PCI device 00:14.3 to cell "RootCell"
>>> Adding PCI device 00:18.0 to cell "RootCell"
>>> Adding PCI device 00:18.1 to cell "RootCell"
>>> Adding PCI device 00:18.2 to cell "RootCell"
>>> Adding PCI device 00:18.3 to cell "RootCell"
>>> Adding PCI device 00:18.4 to cell "RootCell"
>>> Adding PCI device 00:18.5 to cell "RootCell"
>>> Adding PCI device 00:18.6 to cell "RootCell"
>>> Adding PCI device 00:18.7 to cell "RootCell"
>>> Adding PCI device 00:19.0 to cell "RootCell"
>>> Adding PCI device 00:19.1 to cell "RootCell"
>>> Adding PCI device 00:19.2 to cell "RootCell"
>>> Adding PCI device 00:19.3 to cell "RootCell"
>>> Adding PCI device 00:19.4 to cell "RootCell"
>>> Adding PCI device 00:19.5 to cell "RootCell"
>>> Adding PCI device 00:19.6 to cell "RootCell"
>>> Adding PCI device 00:19.7 to cell "RootCell"
>>> Adding PCI device 00:1a.0 to cell "RootCell"
>>> Adding PCI device 00:1a.1 to cell "RootCell"
>>> Adding PCI device 00:1a.2 to cell "RootCell"
>>> Adding PCI device 00:1a.3 to cell "RootCell"
>>> Adding PCI device 00:1a.4 to cell "RootCell"
>>> Adding PCI device 00:1a.5 to cell "RootCell"
>>> Adding PCI device 00:1a.6 to cell "RootCell"
>>> Adding PCI device 00:1a.7 to cell "RootCell"
>>> Adding PCI device 00:1b.0 to cell "RootCell"
>>> Adding PCI device 00:1b.1 to cell "RootCell"
>>> Adding PCI device 00:1b.2 to cell "RootCell"
>>> Adding PCI device 00:1b.3 to cell "RootCell"
>>> Adding PCI device 00:1b.4 to cell "RootCell"
>>> Adding PCI device 00:1b.5 to cell "RootCell"
>>> Adding PCI device 00:1b.6 to cell "RootCell"
>>> Adding PCI device 00:1b.7 to cell "RootCell"
>>> Adding PCI device 00:1c.0 to cell "RootCell"
>>> Adding PCI device 00:1c.1 to cell "RootCell"
>>> Adding PCI device 00:1c.2 to cell "RootCell"
>>> Adding PCI device 00:1c.3 to cell "RootCell"
>>> Adding PCI device 00:1c.4 to cell "RootCell"
>>> Adding PCI device 00:1c.5 to cell "RootCell"
>>> Adding PCI device 00:1c.6 to cell "RootCell"
>>> Adding PCI device 00:1c.7 to cell "RootCell"
>>> Adding PCI device 00:1d.0 to cell "RootCell"
>>> Adding PCI device 00:1d.1 to cell "RootCell"
>>> Adding PCI device 00:1d.2 to cell "RootCell"
>>> Adding PCI device 00:1d.3 to cell "RootCell"
>>> Adding PCI device 00:1d.4 to cell "RootCell"
>>> Adding PCI device 00:1d.5 to cell "RootCell"
>>> Adding PCI device 00:1d.6 to cell "RootCell"
>>> Adding PCI device 00:1d.7 to cell "RootCell"
>>> Adding PCI device 00:1e.0 to cell "RootCell"
>>> Adding PCI device 00:1e.1 to cell "RootCell"
>>> Adding PCI device 00:1e.2 to cell "RootCell"
>>> Adding PCI device 00:1e.3 to cell "RootCell"
>>> Adding PCI device 00:1e.4 to cell "RootCell"
>>> Adding PCI device 00:1e.5 to cell "RootCell"
>>> Adding PCI device 00:1e.6 to cell "RootCell"
>>> Adding PCI device 00:1e.7 to cell "RootCell"
>>> Adding PCI device 00:1f.0 to cell "RootCell"
>>> Adding PCI device 00:1f.1 to cell "RootCell"
>>> Adding PCI device 00:1f.2 to cell "RootCell"
>>> Adding PCI device 00:1f.3 to cell "RootCell"
>>> Adding PCI device 00:1f.4 to cell "RootCell"
>>> Adding PCI device 00:1f.5 to cell "RootCell"
>>> Adding PCI device 00:1f.6 to cell "RootCell"
>>> Adding PCI device 00:1f.7 to cell "RootCell"
>>> Adding PCI device 01:00.0 to cell "RootCell"
>>> Adding PCI device 01:00.1 to cell "RootCell"
>>> Adding PCI device 02:00.0 to cell "RootCell"
>>> Adding PCI device 03:00.0 to cell "RootCell"
>>> Adding PCI device 04:00.0 to cell "RootCell"
>>> Adding PCI device 04:00.1 to cell "RootCell"
>>> Adding PCI device 05:00.0 to cell "RootCell"
>>> Adding PCI device 05:00.2 to cell "RootCell"
>>> Adding PCI device 05:00.3 to cell "RootCell"
>>> Adding PCI device 06:00.0 to cell "RootCell"
>>> Adding PCI device 06:00.1 to cell "RootCell"
>>> Adding PCI device 06:00.2 to cell "RootCell"
>>> Adding PCI device 20:00.0 to cell "RootCell"
>>> Adding PCI device 20:00.2 to cell "RootCell"
>>> Adding PCI device 20:01.0 to cell "RootCell"
>>> Adding PCI device 20:01.1 to cell "RootCell"
>>> Adding PCI device 20:02.0 to cell "RootCell"
>>> Adding PCI device 20:03.0 to cell "RootCell"
>>> Adding PCI device 20:04.0 to cell "RootCell"
>>> Adding PCI device 20:07.0 to cell "RootCell"
>>> Adding PCI device 20:07.1 to cell "RootCell"
>>> Adding PCI device 20:08.0 to cell "RootCell"
>>> Adding PCI device 20:08.1 to cell "RootCell"
>>> Adding PCI device 21:00.0 to cell "RootCell"
>>> Adding PCI device 21:00.1 to cell "RootCell"
>>> Adding PCI device 22:08.0 to cell "RootCell"
>>> Adding PCI device 23:00.0 to cell "RootCell"
>>> Adding PCI device 24:00.0 to cell "RootCell"
>>> Adding PCI device 24:00.2 to cell "RootCell"
>>> Adding PCI device 24:00.3 to cell "RootCell"
>>> Adding PCI device 25:00.0 to cell "RootCell"
>>> Adding PCI device 25:00.1 to cell "RootCell"
>>> Adding PCI device 40:00.0 to cell "RootCell"
>>> Adding PCI device 40:00.2 to cell "RootCell"
>>> Adding PCI device 40:01.0 to cell "RootCell"
>>> Adding PCI device 40:02.0 to cell "RootCell"
>>> Adding PCI device 40:03.0 to cell "RootCell"
>>> Adding PCI device 40:03.1 to cell "RootCell"
>>> Adding PCI device 40:04.0 to cell "RootCell"
>>> Adding PCI device 40:07.0 to cell "RootCell"
>>> Adding PCI device 40:07.1 to cell "RootCell"
>>> Adding PCI device 40:08.0 to cell "RootCell"
>>> Adding PCI device 40:08.1 to cell "RootCell"
>>> Adding PCI device 41:00.0 to cell "RootCell"
>>> Adding PCI device 41:00.1 to cell "RootCell"
>>> Adding PCI device 42:00.0 to cell "RootCell"
>>> Adding PCI device 42:00.2 to cell "RootCell"
>>> Adding PCI device 43:00.0 to cell "RootCell"
>>> Adding PCI device 43:00.1 to cell "RootCell"
>>> Adding PCI device 60:00.0 to cell "RootCell"
>>> Adding PCI device 60:00.2 to cell "RootCell"
>>> Adding PCI device 60:01.0 to cell "RootCell"
>>> Adding PCI device 60:02.0 to cell "RootCell"
>>> Adding PCI device 60:03.0 to cell "RootCell"
>>> Adding PCI device 60:03.1 to cell "RootCell"
>>> Adding PCI device 60:04.0 to cell "RootCell"
>>> Adding PCI device 60:07.0 to cell "RootCell"
>>> Adding PCI device 60:07.1 to cell "RootCell"
>>> Adding PCI device 60:08.0 to cell "RootCell"
>>> Adding PCI device 60:08.1 to cell "RootCell"
>>> Adding PCI device 61:00.0 to cell "RootCell"
>>> Adding PCI device 62:00.0 to cell "RootCell"
>>> Adding PCI device 62:00.2 to cell "RootCell"
>>> Adding PCI device 63:00.0 to cell "RootCell"
>>> Adding PCI device 63:00.1 to cell "RootCell"
>>> Adding PCI device 80:00.0 to cell "RootCell"
>>> Adding PCI device 80:00.2 to cell "RootCell"
>>> Adding PCI device 80:01.0 to cell "RootCell"
>>> Adding PCI device 80:02.0 to cell "RootCell"
>>> Adding PCI device 80:03.0 to cell "RootCell"
>>> Adding PCI device 80:04.0 to cell "RootCell"
>>> Adding PCI device 80:07.0 to cell "RootCell"
>>> Adding PCI device 80:07.1 to cell "RootCell"
>>> Adding PCI device 80:08.0 to cell "RootCell"
>>> Adding PCI device 80:08.1 to cell "RootCell"
>>> Adding PCI device 81:00.0 to cell "RootCell"
>>> Adding PCI device 81:00.2 to cell "RootCell"
>>> Adding PCI device 82:00.0 to cell "RootCell"
>>> Adding PCI device 82:00.1 to cell "RootCell"
>>> Adding PCI device a0:00.0 to cell "RootCell"
>>> Adding PCI device a0:00.2 to cell "RootCell"
>>> Adding PCI device a0:01.0 to cell "RootCell"
>>> Adding PCI device a0:02.0 to cell "RootCell"
>>> Adding PCI device a0:03.0 to cell "RootCell"
>>> Adding PCI device a0:04.0 to cell "RootCell"
>>> Adding PCI device a0:07.0 to cell "RootCell"
>>> Adding PCI device a0:07.1 to cell "RootCell"
>>> Adding PCI device a0:08.0 to cell "RootCell"
>>> Adding PCI device a0:08.1 to cell "RootCell"
>>> Adding PCI device a1:00.0 to cell "RootCell"
>>> Adding PCI device a1:00.2 to cell "RootCell"
>>> Adding PCI device a2:00.0 to cell "RootCell"
>>> Adding PCI device a2:00.1 to cell "RootCell"
>>> Adding PCI device c0:00.0 to cell "RootCell"
>>> Adding PCI device c0:00.2 to cell "RootCell"
>>> Adding PCI device c0:01.0 to cell "RootCell"
>>> Adding PCI device c0:02.0 to cell "RootCell"
>>> Adding PCI device c0:03.0 to cell "RootCell"
>>> Adding PCI device c0:03.1 to cell "RootCell"
>>> Adding PCI device c0:03.2 to cell "RootCell"
>>> Adding PCI device c0:03.3 to cell "RootCell"
>>> Adding PCI device c0:03.4 to cell "RootCell"
>>> Adding PCI device c0:04.0 to cell "RootCell"
>>> Adding PCI device c0:07.0 to cell "RootCell"
>>> Adding PCI device c0:07.1 to cell "RootCell"
>>> Adding PCI device c0:08.0 to cell "RootCell"
>>> Adding PCI device c0:08.1 to cell "RootCell"
>>> Adding PCI device c1:00.0 to cell "RootCell"
>>> Adding PCI device c2:00.0 to cell "RootCell"
>>> Adding PCI device c3:00.0 to cell "RootCell"
>>> Adding PCI device c4:00.0 to cell "RootCell"
>>> Adding PCI device c5:00.0 to cell "RootCell"
>>> Adding PCI device c5:00.2 to cell "RootCell"
>>> Adding PCI device c6:00.0 to cell "RootCell"
>>> Adding PCI device c6:00.1 to cell "RootCell"
>>> Adding PCI device e0:00.0 to cell "RootCell"
>>> Adding PCI device e0:00.2 to cell "RootCell"
>>> Adding PCI device e0:01.0 to cell "RootCell"
>>> Adding PCI device e0:02.0 to cell "RootCell"
>>> Adding PCI device e0:03.0 to cell "RootCell"
>>> Adding PCI device e0:04.0 to cell "RootCell"
>>> Adding PCI device e0:07.0 to cell "RootCell"
>>> Adding PCI device e0:07.1 to cell "RootCell"
>>> Adding PCI device e0:08.0 to cell "RootCell"
>>> Adding PCI device e0:08.1 to cell "RootCell"
>>> Adding PCI device e1:00.0 to cell "RootCell"
>>> Adding PCI device e1:00.2 to cell "RootCell"
>>> Adding PCI device e2:00.0 to cell "RootCell"
>>> Adding PCI device e2:00.1 to cell "RootCell"
>>> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
>>> FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4
>>> RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6
>>> RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000000000030
>>> RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffffff003
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 76 (Cell: "RootCell")
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> Ignoring NMI IPI to CPU 76
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> Ignoring NMI IPI to CPU 76
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
>>> RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46
>>> RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000000b4
>>> RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa9401790
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 24 (Cell: "RootCell")
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> FATAL: Unhandled MSR read: c0002001
>>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246
>>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c0002001
>>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c0002001
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 68 (Cell: "RootCell")
>>> FATAL: Unhandled MSR read: c0002001
>>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246
>>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c0002001
>>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c0002001
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 44 (Cell: "RootCell")
>>>
>>> -----------------------------------------------------------------------=
-
>>> *From:* Henning Schild <henning.schild@siemens.com>
>>> *Sent:* 14 November 2022 09:22
>>> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
>>> *Cc:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>;
>>> jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
>>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>>> *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM
>>> This email was sent to you by someone outside the University.
>>> You should only click on links or attachments if you are certain that
>>> the email is genuine and the content is safe.
>>>
>>> Am Sun, 13 Nov 2022 22:24:45 +0000
>>> schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:
>>>
>>>> Hi Ralf,
>>>>
>>>> Thanks for the reply!
>>>>
>>>> >Did you use jailhouse-config-create?
>>>>
>>>> I am using `jailhouse config create` to generate the sysconfig.c file.
>>>>
>>>> >You can use the --mem-hv option to
>>>> increate the memory. Try, for example, 32MiB and see if it works.
>>>>
>>>> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
>>>> The driver prints "The Jailhouse is opening" on dmesg. However, right
>>>> after that the CPUs get stuck, and I get rcu_sched detected stalls.
>>>> The system is completely irresponsive.
>>>>
>>>> I attached a text file containing the full output from dmesg. Here is
>>>> the initial part:
>>>
>>> I guess the output of the hypervisor might also be valuable here.
>>> According to its spec that machine should have a serial port, and with
>>> that default config from the generate script you should see logs coming
>>> out of there. With the usual 115200 8n1
>>>
>>> Henning
>>>
>>>> [  434.792008] The Jailhouse is opening.
>>>> [  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>>>> [  455.793303] rcu:     1-...0: (839 GPs behind)
>>>> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [  455.80=
2292]
>>>> rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x4000000000000000
>>>> softirq=3D905/905 fqs=3D1827 [  455.811276] rcu:     3-...0: (144 GPs
>>>> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
>>>> 455.820266] rcu:     4-...0: (1 GPs behind)
>>>> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
>>>> 455.829252] rcu:     5-...0: (144 GPs behind)
>>>> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [  455.83=
8238]
>>>> rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x4000000000000000
>>>> softirq=3D777/777 fqs=3D1827 [  455.847218] rcu:     7-...0: (144 GPs
>>>> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827=
 [
>>>> 455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364) [
>>>> 455.862170] Sending NMI from CPU 87 to CPUs 1: [  465.776884] Sending
>>>> NMI from CPU 87 to CPUs 2: [  467.182686] watchdog: BUG: soft lockup
>>>> - CPU#0 stuck for 23s! [kworker/0:1:7] [  467.189857] Modules linked
>>>> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
>>>> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
>>>> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
>>>> 467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4
>>>> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
>>>> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
>>>> raid6_pq ] [  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G
>>>>          O      5.10.0 #3 [  467.328767] Hardware name: Dell Inc.
>>>> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [  467.337154]
>>>> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
>>>> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
>>>> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
>>>> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
>>>> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
>>>> [  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
>>>> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
>>>> 0000000000000001 [  467.385123] RDX: ffff964f1fa31280 RSI:
>>>> 0000000000000000 RDI: 0000000000000001 [  467.393024] RBP:
>>>> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
>>>> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
>>>> 0000000000000000 [  467.408836] R13: 000000000000007f R14:
>>>> ffff962f1f42c9c0 R15: 0000000000000080 [  467.416737] FS:
>>>> 0000000000000000(0000) GS:ffff962f1f400000(0000)
>>>> knlGS:0000000000000000 [  467.425604] CS:  0010 DS: 0000 ES: 0000
>>>> CR0: 0000000080050033 [  467.432127] CR2: 0000000000000000 CR3:
>>>> 00000010987ea000 CR4: 00000000003506f0 [  467.440045] Call Trace: [
>>>> 467.443289]  ? tlbflush_read_file+0x70/0x70 [  467.448266]  ?
>>>> tlbflush_read_file+0x70/0x70 [  467.453242]  on_each_cpu+0x2b/0x60 [
>>>> 467.457437]  __purge_vmap_area_lazy+0x5d/0x680 [  467.462679]  ?
>>>> _cond_resched+0x16/0x40 [  467.467224]  ?
>>>> unmap_kernel_range_noflush+0x2fa/0x380 [  467.473072]
>>>> free_vmap_area_noflush+0xe7/0x100 [  467.478315]
>>>> remove_vm_area+0x96/0xa0 [  467.482770]  __vunmap+0x8d/0x290 [
>>>> 467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [  467.492299]
>>>> drm_client_buffer_vunmap+0x16/0x20 [drm] [  467.498144]
>>>> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [  467.505118]
>>>> process_one_work+0x1b6/0x350 [  467.509912]  worker_thread+0x53/0x3e0
>>>> [  467.514361]  ? process_one_work+0x350/0x350 [  467.519338]
>>>> kthread+0x11b/0x140 [  467.523342]  ? __kthread_bind_mask+0x60/0x60 [
>>>>  467.528389]  ret_from_fork+0x22/0x30
>>>>
>>>> Cheers
>>>> Karim
>>>> ________________________________
>>>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> Sent: 12 November 2022 17:47
>>>> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
>>>> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
>>>> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
>>>> enter_hypervisor returns -ENOMEM
>>>>
>>>> This email was sent to you by someone outside the University.
>>>> You should only click on links or attachments if you are certain that
>>>> the email is genuine and the content is safe.
>>>>
>>>> On 12/11/2022 18:15, Karim Manaouil wrote:
>>>> > Hi Jan,
>>>> >
>>>> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
>>>> > nodes), running Linux kernel v5.10 (same version used by jailhouse
>>>> > CI with same patches applied).
>>>> >
>>>> > `jailhouse hardware check` return that everything is ok and that
>>>> > "Check passed!".
>>>> >
>>>> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>>>> >
>>>> > However, enter_hypervisor() [1] fails when entry() is called on
>>>> > every cpu and return -ENOMEM as error_code.
>>>>
>>>> Try to reserve more memory. Maybe the default size of 6MiB for HV
>>>> memory is insufficient for 128 CPUs.
>>>>
>>>> Did you use jailhouse-config-create? You can use the --mem-hv option
>>>> to increate the memory. Try, for example, 32MiB and see if it works.
>>>>
>>>>    Ralf
>>>>
>>>> >
>>>> > Do you possibly know where could the issue come from?
>>>> >
>>>> > Best
>>>> > Karim
>>>> >
>>>> > [1]
>>>> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9b=
ef6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blo=
b/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251> <https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>> <https://github.com/siemens/j=
ailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 <=
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b=
6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>>
>>>> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9=
bef6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/bl=
ob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 <https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>>>
>>>> >
>>>> > The University of Edinburgh is a charitable body, registered in
>>>> > Scotland, with registration number SC005336. Is e buidheann
>>>> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=
=C3=A0raichte an Alba,
>>>> > =C3=A0ireamh cl=C3=A0raidh SC005336.
>>>> >
>>>> > --
>>>> > You received this message because you are subscribed to the Google
>>>> > Groups "Jailhouse" group.
>>>> > To unsubscribe from this group and stop receiving emails from it,
>>>> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
>>>> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>>>>.
>>>> > To view this discussion on the web visit
>>>> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663AB=
E61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://group=
s.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%4=
0AM0PR05MB6018.eurprd05.prod.outlook.com> <https://groups.google.com/d/msgi=
d/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurp=
rd05.prod.outlook.com <https://groups.google.com/d/msgid/jailhouse-dev/AM0P=
R05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.co=
m>> <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups.=
google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40A=
M0PR05MB6018.eurprd05.prod.outlook.com <https://groups.google.com/d/msgid/j=
ailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd0=
5.prod.outlook.com>>>
>>>> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663A=
BE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3D=
email&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/=
AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outloo=
k.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/m=
sgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.e=
urprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter <https://gr=
oups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A903=
9%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=
=3Dfooter>>>>.
>>>> >
>>>>
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB60182BDF701FD335A923BD42A90A9%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB60182BDF701FD335A923BD42A90A9AM0PR05MB6018eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi Ralf,<br>
<br>
Thanks again! It's working now!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The serial console is connected to the secondary&nbsp;<span style=3D"color:=
 rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">UART&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">on the machine. That's why I used 0x2f8 (I h=
ad to specify&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">-C&nbsp;</span><span style=3D"color: rgb(0, =
0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;=
">ttyS1&nbsp;</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibr=
i, Arial, Helvetica, sans-serif; font-size: 12pt;">in
 jailhouse config create).</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">I just prevented Linux from writing to the s=
erial console&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">(removed&nbsp;</span><span style=3D"color: r=
gb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt;">console=3DttyS1 from cmdline).&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Cell was created,&nbsp;</span><span style=3D=
"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; f=
ont-size: 12pt;">demo was executed, then
 shutdown and&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">destroyed all&nbsp;</span><span style=3D"col=
or: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-=
size: 12pt;">successfully.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">I appreciate your help a lot. Without you, I=
 wouldn't have been</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">able to make it work (or maybe I would end u=
p spending hours&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">reading every line of code and debugging).</=
span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">I will be using Jailhouse in the next few mo=
nths</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial,=
 Helvetica, sans-serif; font-size: 12pt;">.
 I would be glad&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">to&nbsp;</span><span style=3D"color: rgb(0, =
0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;=
">contribute any improvements (I'll take&nbsp;</span><span style=3D"color: =
rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">a
 look later to the sysfs&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">iomem&nbsp;</span><span style=3D"color: rgb(=
0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12=
pt;">parser and try to understand why it</span><span style=3D"color: rgb(0,=
 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt=
;">&nbsp;didn't
 add AMD&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">IOMMU leaf nodes).</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Cheers</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Karim</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ralf Ramsauer &lt;ral=
f.ramsauer@oth-regensburg.de&gt;<br>
<b>Sent:</b> 20 November 2022 22:37<br>
<b>To:</b> Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
<b>Cc:</b> jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;; Henning S=
child &lt;henning.schild@siemens.com&gt;; jailhouse-dev@googlegroups.com &l=
t;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
Hi Karim,<br>
<br>
On 20/11/2022 19:47, Karim Manaouil wrote:<br>
&gt; Hi Ralf,<br>
&gt;<br>
&gt; Thanks a lot for the help!<br>
&gt;<br>
&gt; The missing entries are for AMD IOMMU (they appear<br>
&gt; in /proc/iommu tree, but for some reason the jailhouse<br>
&gt; config script is not adding them to sysconfig.c).<br>
&gt;<br>
&gt; I also had to add amd_iommu=3Dfalse to the kernel cmdline.<br>
&gt; Now the jailhouse is correctly created with no issues, and<br>
&gt; the Linux on the root cell works perfectly.<br>
<br>
Perfect, sounds good! Yep, that's required. Afair, we don't have support<br=
>
for the AMD IOMMU yet.<br>
<br>
&gt;<br>
&gt; I wanted to try creating another cell using the demo provided<br>
&gt; by configs/x86/apic-demo.c (since it's very simple), but it always<br>
&gt; generates a PIO read error.<br>
&gt;<br>
&gt; The PIO address is for UART (0x2f9). This address exists in a<br>
&gt; PIO_RANGE in apic-demo.c and it also exists on the root cell's<br>
&gt; sysconfig.c, so it should work, but here we are.<br>
<br>
When you create a non-root cell, you take away that PIO_RANGE from the<br>
root cell. If the root cell now tries to further access that port,<br>
Jailhouse will stop that cell due to port access violation. This is<br>
exactly what happened and in fact it works as intended.<br>
<br>
What you need to do is to ensure that Linux won't claim that port, but I<br=
>
wonder why Linux actually accesses that port=E2=80=A6 0x2f8 is the secondar=
y<br>
UART (0x3f8 is the primary, also used by Jailhouse for its debug<br>
output). Maybe there's a TTY allocated on that port?<br>
<br>
There are two solutions to address your issue (you should do both, just<br>
to have your system under control):<br>
<br>
1. You can, limit the number of uarts with the nr_uarts<br>
&nbsp;&nbsp;&nbsp; kernel parameter, or/and, identify and stop the applicat=
ion that<br>
&nbsp;&nbsp;&nbsp; accesses the UART. 'lsof | grep ttyS1' or checking syste=
md's services<br>
&nbsp;&nbsp;&nbsp; (via systemctl) might be a good starting point.<br>
<br>
2. Don't assign PIO_RANGE(0x2f8, ...) to the non-root cell if you (a)<br>
&nbsp;&nbsp;&nbsp; don't have a secondary UART at all (which I would expect=
), and (b) if<br>
&nbsp;&nbsp;&nbsp; you don't need it inside that cell. You can use the prim=
ary UART for<br>
&nbsp;&nbsp;&nbsp; the non-root cell.<br>
<br>
As far as I remember, the non-root cell will use the primary UART in any<br=
>
case by default.<br>
<br>
&nbsp;&nbsp; Ralf<br>
<br>
&gt;<br>
&gt; Here is the log that I get after running:<br>
&gt; jailhouse cell create configs/x86/apic-demo.cell<br>
&gt; it shows both hypervisor and Linux output. I also<br>
&gt; attached apic-demo.c for reference.<br>
&gt;<br>
&gt; Page pool usage after late setup: mem 1934/7635, remap 65703/131072<br=
>
&gt; Activating hypervisor<br>
&gt; [&nbsp; 698.582280] jailhouse: enter_hypvisor called on every cpu<br>
&gt; [&nbsp; 698.587918] jailhouse: console unmapped<br>
&gt; [&nbsp; 698.591942] jailhouse: firmware released<br>
&gt; [&nbsp; 698.595998] jailhouse: root cell registered<br>
&gt; [&nbsp; 698.600313] jailhouse: pci virtual root device added<br>
&gt; [&nbsp; 698.604973] hpet_rtc_timer_reinit: 5 callbacks suppressed<br>
&gt; [&nbsp; 698.604977] hpet: Lost 5719 RTC interrupts<br>
&gt; [&nbsp; 698.605434] The Jailhouse is opening.<br>
&gt; [&nbsp; 733.204370] jailhouse: pci setup done<br>
&gt; [&nbsp; 733.283290] IRQ fixup: irq 789 move in progress, old vector 39=
<br>
&gt; [&nbsp; 733.289163] IRQ 789: no longer affine to CPU3<br>
&gt; [&nbsp; 733.294892] smpboot: CPU 3 is now offline<br>
&gt; Created cell &quot;apic-demo&quot;<br>
&gt; Page pool usage after cell creation: mem 1949/7635, remap 65703/131072=
<br>
&gt; AFATAL: Invalid PIO read, port: 2f9 size: 1<br>
&gt; RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d627c98 FLAGS: 6<br>
&gt; RAX: 0xffffffff999b2670 RBX: 0x0000000000000247 RCX: 0x000000000000000=
0<br>
&gt; RDX: 0x00000000000002f9 RSI: 0x0000000000000001 RDI: 0xffffffff9b3da9f=
8<br>
&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt; CR0: 0x0000000080050033 CR3: 0x0000003082bea000 CR4: 0x00000000003506a=
0<br>
&gt; EFER: 0x0000000000001d01<br>
&gt; Parking CPU 29 (Cell: &quot;RootCell&quot;)<br>
&gt; FATAL: Invalid PIO read, port: 2fa size: 1<br>
&gt; RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d450f08 FLAGS: 6<br>
&gt; RAX: 0xffffffff999b2670 RBX: 0xffffffff9b3da9f8 RCX: 0x000000000000000=
0<br>
&gt; RDX: 0x00000000000002fa RSI: 0x0000000000000002 RDI: 0xffffffff9b3da9f=
8<br>
&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt; CR0: 0x0000000080050033 CR3: 0x0000002085c36000 CR4: 0x00000000003506a=
0<br>
&gt; EFER: 0x0000000000001d01<br>
&gt; Parking CPU 64 (Cell: &quot;RootCell&quot;)<br>
&gt;<br>
&gt;<br>
&gt; Cheers<br>
&gt; Karim<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br>
&gt; *Sent:* 18 November 2022 20:18<br>
&gt; *To:* Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
&gt; *Cc:* jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;; Henning S=
child<br>
&gt; &lt;henning.schild@siemens.com&gt;; jailhouse-dev@googlegroups.com<br>
&gt; &lt;jailhouse-dev@googlegroups.com&gt;<br>
&gt; *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM<b=
r>
&gt; This email was sent to you by someone outside the University.<br>
&gt; You should only click on links or attachments if you are certain that<=
br>
&gt; the email is genuine and the content is safe.<br>
&gt;<br>
&gt; Hi Karim,<br>
&gt;<br>
&gt; On 18/11/2022 19:27, Karim Manaouil wrote:<br>
&gt;&gt; Hi Ralf,<br>
&gt;&gt;<br>
&gt;&gt; Thanks! I appreciate your help!<br>
&gt;&gt;<br>
&gt;&gt; I disabled MCE to get rid of the unhandled MSR read error. It work=
s.<br>
&gt;&gt;<br>
&gt;&gt; I also fixed the PCIe 04:00.0 invalid write to reg 0xb4 by manuall=
y adding<br>
&gt;<br>
&gt; Okay, take care that if you manually add an entry that you need to<br>
&gt; adjust the array size and their references.<br>
&gt;<br>
&gt;&gt; a capability entry to sysconfig.c giving it write permissions (btw=
, the<br>
&gt;&gt; entry<br>
&gt;&gt; for that register was not generated by the config tool).<br>
&gt;<br>
&gt; Not everything is covered by the generator, some parts require manual<=
br>
&gt; inspection.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Now, I am still getting the invalid MMIO/RAM read and write (see l=
og below).<br>
&gt;&gt; I first get the read error immediately after the page pool message=
<br>
&gt;&gt; is printed. Then after a little while, the write error follows up.=
<br>
&gt;<br>
&gt; Now we need to inspect /proc/iomem. You need to check what is behind<b=
r>
&gt; address 0x90482020, and add an appropriate memory region entry to your=
<br>
&gt; config.<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Always same case, immediate read error followed by a write error.<=
br>
&gt;&gt; it happens every time (but the addresses change).<br>
&gt;&gt;<br>
&gt;&gt; Here is below the last log from jailhouse copy pasted.<br>
&gt;&gt; I also attached the output of lspci -vvv as well as sysconfig.c.<b=
r>
&gt;&gt;<br>
&gt;&gt; Cheers<br>
&gt;&gt; Karim<br>
&gt;&gt;<br>
&gt;&gt; Page pool usage after late setup: mem 1927/7635, remap 65703/13107=
2<br>
&gt;&gt; FATAL: Invalid MMIO/RAM read, addr: 0x0000000090482020 size: 4<br>
&gt;&gt; RIP: 0xffffffff915d1735 RSP: 0xffffa9b08e97be18 FLAGS: 296<br>
&gt;&gt; RAX: 0xffffa9b080780000 RBX: 0xffff934f4262a7c0 RCX: 0x00000000000=
00000<br>
&gt;&gt; RDX: 0xffff934f47e32f10 RSI: 0xffff934f4004e800 RDI: 0x00000000000=
00021<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x00000020c2682000 CR4: 0x00000000003=
506a0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 7 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt; Ignoring NMI IPI to CPU 88<br>
&gt;&gt; Ignoring NMI IPI to CPU 88<br>
&gt;&gt; FATAL: Invalid MMIO/RAM write, addr: 0x0000000093a82008 size: 4<br=
>
&gt;&gt; RIP: 0xffffffff915ccce7 RSP: 0xffffa9b08db54da0 FLAGS: 2<br>
&gt;&gt; RAX: 0xffffa9b080380000 RBX: 0x0000000000000001 RCX: 0x00000000000=
01a70<br>
&gt;&gt; RDX: 0xffff9376c0004000 RSI: 0x3000004500000000 RDI: 0x7ffffffffff=
ff003<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x00000001267d0000 CR4: 0x00000000003=
506a0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 81 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt; Ignoring NMI IPI to CPU 88<br>
&gt;&gt; Ignoring NMI IPI to CPU 88<br>
&gt;&gt; Ignoring NMI IPI to CPU 88<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ------------------------------------------------------------------=
------<br>
&gt;&gt; *From:* Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br>
&gt;&gt; *Sent:* 18 November 2022 16:23<br>
&gt;&gt; *To:* Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; Henning Schi=
ld<br>
&gt;&gt; &lt;henning.schild@siemens.com&gt;<br>
&gt;&gt; *Cc:* jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;;<br>
&gt;&gt; jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.com&=
gt;<br>
&gt;&gt; *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOM=
EM<br>
&gt;&gt; This email was sent to you by someone outside the University.<br>
&gt;&gt; You should only click on links or attachments if you are certain t=
hat<br>
&gt;&gt; the email is genuine and the content is safe.<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On 18/11/2022 02:19, Karim Manaouil wrote:<br>
&gt;&gt;&gt; Hi Henning,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I spent some more time debugging the issue.<br>
&gt;&gt;&gt; I am getting a &quot;FATAL: Invalid MMIO/RAM write&quot;.<br>
&gt;&gt;&gt; Probably it's happening right after the first cpu that<br>
&gt;&gt;&gt; calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Not sure why, but maybe you have some pointers.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Here is the jailhouse output copy-pasted below.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) =
on CPU 6<br>
&gt;&gt;&gt; Code location: 0xfffffffff0000050<br>
&gt;&gt;&gt; Using xAPIC<br>
&gt;&gt;&gt; Page pool usage after early setup: mem 813/7635, remap 1/13107=
2<br>
&gt;&gt;&gt; Initializing processors:<br>
&gt;&gt;<br>
&gt;&gt; Ok, having read your log, you have (at the moment) at least two is=
sues:<br>
&gt;&gt;<br>
&gt;&gt; First:<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; &gt; FATAL: Invalid PCI config write, device 04:00.0, =
reg: 0xb4, size: 2<br>
&gt;&gt;<br>
&gt;&gt; For the moment, go to your config and allow write access to that<b=
r>
&gt;&gt; capability. I could maybe help you with this if you share your con=
fig.<br>
&gt;&gt; Please also attach lspci -vvv.<br>
&gt;&gt;<br>
&gt;&gt; I can send you the config diff, and in the long run, you need to<b=
r>
&gt;&gt; understand what the changes mean.<br>
&gt;&gt;<br>
&gt;&gt; Second:<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; &gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;&gt;<br>
&gt;&gt; That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine =
Check<br>
&gt;&gt; Events (MCE) in your kernel config or add appropriate parameters t=
o your<br>
&gt;&gt; kernel to disable them.<br>
&gt;&gt;<br>
&gt;&gt; Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=
=3Doff to<br>
&gt;&gt; your kernel parameters.<br>
&gt;&gt;<br>
&gt;&gt; HTH,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;&gt;<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 6... (APIC ID 48) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 64... (APIC ID 1) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 0... (APIC ID 0) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 16... (APIC ID 2) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 112... (APIC ID 7) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 104... (APIC ID 13) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 40... (APIC ID 12) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 72... (APIC ID 9) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 8... (APIC ID 8) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 56... (APIC ID 14) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 120... (APIC ID 15) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 110... (APIC ID 61) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 46... (APIC ID 60) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 14... (APIC ID 56) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 78... (APIC ID 57) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 94... (APIC ID 59) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 30... (APIC ID 58) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 126... (APIC ID 63) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 62... (APIC ID 62) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 2... (APIC ID 16) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 66... (APIC ID 17) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 18... (APIC ID 18) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 82... (APIC ID 19) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 114... (APIC ID 23) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 50... (APIC ID 22) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 98... (APIC ID 21) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 34... (APIC ID 20) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 12... (APIC ID 40) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 76... (APIC ID 41) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 60... (APIC ID 46) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 124... (APIC ID 47) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 44... (APIC ID 44) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 108... (APIC ID 45) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 92... (APIC ID 43) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 28... (APIC ID 42) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 26... (APIC ID 26) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 90... (APIC ID 27) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 74... (APIC ID 25) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 10... (APIC ID 24) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 106... (APIC ID 29) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 42... (APIC ID 28) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 58... (APIC ID 30) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 122... (APIC ID 31) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 20... (APIC ID 34) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 84... (APIC ID 35) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 36... (APIC ID 36) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 100... (APIC ID 37) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 116... (APIC ID 39) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 52... (APIC ID 38) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 4... (APIC ID 32) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 68... (APIC ID 33) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 96... (APIC ID 5) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 32... (APIC ID 4) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 88... (APIC ID 11) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 55... (APIC ID 118) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 119... (APIC ID 119) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 87... (APIC ID 115) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 23... (APIC ID 114) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 71... (APIC ID 113) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 7... (APIC ID 112) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 39... (APIC ID 116) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 103... (APIC ID 117) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 47... (APIC ID 124) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 111... (APIC ID 125) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 15... (APIC ID 120) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 79... (APIC ID 121) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 31... (APIC ID 122) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 95... (APIC ID 123) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 127... (APIC ID 127) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 63... (APIC ID 126) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 86... (APIC ID 51) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 22... (APIC ID 50) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 38... (APIC ID 52) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 102... (APIC ID 53) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 118... (APIC ID 55) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 54... (APIC ID 54) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 70... (APIC ID 49) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 109... (APIC ID 109) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 45... (APIC ID 108) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 93... (APIC ID 107) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 29... (APIC ID 106) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 13... (APIC ID 104) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 77... (APIC ID 105) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 61... (APIC ID 110) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 125... (APIC ID 111) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 5... (APIC ID 96) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 101... (APIC ID 101) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 37... (APIC ID 100) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 85... (APIC ID 99) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 21... (APIC ID 98) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 117... (APIC ID 103) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 53... (APIC ID 102) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 69... (APIC ID 97) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 49... (APIC ID 70) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 1... (APIC ID 64) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 65... (APIC ID 65) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 81... (APIC ID 67) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 17... (APIC ID 66) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 97... (APIC ID 69) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 33... (APIC ID 68) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 113... (APIC ID 71) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 25... (APIC ID 74) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 89... (APIC ID 75) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 41... (APIC ID 76) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 105... (APIC ID 77) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 9... (APIC ID 72) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 73... (APIC ID 73) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 121... (APIC ID 79) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 57... (APIC ID 78) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 3... (APIC ID 80) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 67... (APIC ID 81) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 35... (APIC ID 84) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 99... (APIC ID 85) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 115... (APIC ID 87) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 51... (APIC ID 86) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 19... (APIC ID 82) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 83... (APIC ID 83) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 107... (APIC ID 93) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 43... (APIC ID 92) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 11... (APIC ID 88) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 75... (APIC ID 89) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 123... (APIC ID 95) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 59... (APIC ID 94) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 27... (APIC ID 90) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 24... (APIC ID 10) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 80... (APIC ID 3) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 48... (APIC ID 6) OK<br>
&gt;&gt;&gt;&nbsp;&nbsp; CPU 91... (APIC ID 91) OK<br>
&gt;&gt;&gt; Initializing unit: AMD IOMMU<br>
&gt;&gt;&gt; AMD IOMMU @0xa1700000/0x80000<br>
&gt;&gt;&gt; Initializing unit: IOAPIC<br>
&gt;&gt;&gt; Initializing unit: PCI<br>
&gt;&gt;&gt; Adding PCI device 00:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:01.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:01.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:01.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:14.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:14.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:18.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:19.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1a.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1b.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1c.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1d.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1e.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.5 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.6 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 00:1f.7 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 01:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 01:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 02:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 03:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 04:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 04:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 05:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 05:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 05:00.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 06:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 06:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 06:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:01.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 20:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 21:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 21:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 22:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 23:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 24:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 24:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 24:00.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 25:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 25:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 40:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 41:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 41:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 42:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 42:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 43:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 43:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 60:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 61:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 62:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 62:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 63:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 63:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 80:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 81:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 81:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 82:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device 82:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a1:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device a2:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:03.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:03.3 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:03.4 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c3:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c4:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c5:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c5:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c6:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device c6:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e1:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Adding PCI device e2:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt;&gt; Page pool usage after late setup: mem 1927/7635, remap 65703/1=
31072<br>
&gt;&gt;&gt; FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: =
4<br>
&gt;&gt;&gt; RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6<br>
&gt;&gt;&gt; RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000=
000000030<br>
&gt;&gt;&gt; RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffff=
ffffff003<br>
&gt;&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt;&gt; CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x0000000=
0003506e0<br>
&gt;&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt;&gt; Parking CPU 76 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 76<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 76<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt;&gt; FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, si=
ze: 2<br>
&gt;&gt;&gt; RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46<br>
&gt;&gt;&gt; RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x0000000=
0000000b4<br>
&gt;&gt;&gt; RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xfffffff=
fa9401790<br>
&gt;&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt;&gt; CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x0000000=
0003506e0<br>
&gt;&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt;&gt; Parking CPU 24 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt;&gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;&gt;&gt; RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246<br>
&gt;&gt;&gt; RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x0000000=
0c0002001<br>
&gt;&gt;&gt; RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x0000000=
0c0002001<br>
&gt;&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt;&gt; CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x0000000=
0003506e0<br>
&gt;&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt;&gt; Parking CPU 68 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt;&gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;&gt;&gt; RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246<br>
&gt;&gt;&gt; RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x0000000=
0c0002001<br>
&gt;&gt;&gt; RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x0000000=
0c0002001<br>
&gt;&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt;&gt; CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x0000000=
0003506e0<br>
&gt;&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt;&gt; Parking CPU 44 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --------------------------------------------------------------=
----------<br>
&gt;&gt;&gt; *From:* Henning Schild &lt;henning.schild@siemens.com&gt;<br>
&gt;&gt;&gt; *Sent:* 14 November 2022 09:22<br>
&gt;&gt;&gt; *To:* Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
&gt;&gt;&gt; *Cc:* Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;;<b=
r>
&gt;&gt;&gt; jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;;<br>
&gt;&gt;&gt; jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.=
com&gt;<br>
&gt;&gt;&gt; *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM<br>
&gt;&gt;&gt; This email was sent to you by someone outside the University.<=
br>
&gt;&gt;&gt; You should only click on links or attachments if you are certa=
in that<br>
&gt;&gt;&gt; the email is genuine and the content is safe.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am Sun, 13 Nov 2022 22:24:45 +0000<br>
&gt;&gt;&gt; schrieb Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Ralf,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thanks for the reply!<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;Did you use jailhouse-config-create?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I am using `jailhouse config create` to generate the sysco=
nfig.c file.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;You can use the --mem-hv option to<br>
&gt;&gt;&gt;&gt; increate the memory. Try, for example, 32MiB and see if it=
 works.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I tried with 32MiB. It worked. I am not getting -ENOMEM an=
ymore.<br>
&gt;&gt;&gt;&gt; The driver prints &quot;The Jailhouse is opening&quot; on =
dmesg. However, right<br>
&gt;&gt;&gt;&gt; after that the CPUs get stuck, and I get rcu_sched detecte=
d stalls.<br>
&gt;&gt;&gt;&gt; The system is completely irresponsive.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I attached a text file containing the full output from dme=
sg. Here is<br>
&gt;&gt;&gt;&gt; the initial part:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I guess the output of the hypervisor might also be valuable he=
re.<br>
&gt;&gt;&gt; According to its spec that machine should have a serial port, =
and with<br>
&gt;&gt;&gt; that default config from the generate script you should see lo=
gs coming<br>
&gt;&gt;&gt; out of there. With the usual 115200 8n1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Henning<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; [&nbsp; 434.792008] The Jailhouse is opening.<br>
&gt;&gt;&gt;&gt; [&nbsp; 455.787315] rcu: INFO: rcu_sched detected stalls o=
n CPUs/tasks:<br>
&gt;&gt;&gt;&gt; [&nbsp; 455.793303] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 1-...0: (=
839 GPs behind)<br>
&gt;&gt;&gt;&gt; idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D18=
27 [&nbsp; 455.802292]<br>
&gt;&gt;&gt;&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 2-...0: (144 GPs behind) idle=
=3D812/1/0x4000000000000000<br>
&gt;&gt;&gt;&gt; softirq=3D905/905 fqs=3D1827 [&nbsp; 455.811276] rcu:&nbsp=
;&nbsp;&nbsp;&nbsp; 3-...0: (144 GPs<br>
&gt;&gt;&gt;&gt; behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 =
fqs=3D1827 [<br>
&gt;&gt;&gt;&gt; 455.820266] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 4-...0: (1 GPs be=
hind)<br>
&gt;&gt;&gt;&gt; idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D=
1827 [<br>
&gt;&gt;&gt;&gt; 455.829252] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 5-...0: (144 GPs =
behind)<br>
&gt;&gt;&gt;&gt; idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D18=
27 [&nbsp; 455.838238]<br>
&gt;&gt;&gt;&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 6-...0: (144 GPs behind) idle=
=3D912/1/0x4000000000000000<br>
&gt;&gt;&gt;&gt; softirq=3D777/777 fqs=3D1827 [&nbsp; 455.847218] rcu:&nbsp=
;&nbsp;&nbsp;&nbsp; 7-...0: (144 GPs<br>
&gt;&gt;&gt;&gt; behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/241=
0 fqs=3D1827 [<br>
&gt;&gt;&gt;&gt; 455.856404]&nbsp; (detected by 87, t=3D5253 jiffies, g=3D4=
8537, q=3D364) [<br>
&gt;&gt;&gt;&gt; 455.862170] Sending NMI from CPU 87 to CPUs 1: [&nbsp; 465=
.776884] Sending<br>
&gt;&gt;&gt;&gt; NMI from CPU 87 to CPUs 2: [&nbsp; 467.182686] watchdog: B=
UG: soft lockup<br>
&gt;&gt;&gt;&gt; - CPU#0 stuck for 23s! [kworker/0:1:7] [&nbsp; 467.189857]=
 Modules linked<br>
&gt;&gt;&gt;&gt; in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtyp=
e<br>
&gt;&gt;&gt;&gt; br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_RE=
JECT<br>
&gt;&gt;&gt;&gt; nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp =
[<br>
&gt;&gt;&gt;&gt; 467.189928]&nbsp; binfmt_misc configfs efivarfs ip_tables =
x_tables autofs4<br>
&gt;&gt;&gt;&gt; ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_ge=
neric<br>
&gt;&gt;&gt;&gt; async_raid6_recov async_memcpy async_pq async_xor xor asyn=
c_tx<br>
&gt;&gt;&gt;&gt; raid6_pq ] [&nbsp; 467.320567] CPU: 0 PID: 7 Comm: kworker=
/0:1 Tainted: G<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 5.10.0 #3 [&nbsp; 467.328767] Hardware name: De=
ll Inc.<br>
&gt;&gt;&gt;&gt; PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [&nbsp; 467=
.337154]<br>
&gt;&gt;&gt;&gt; Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper=
] [<br>
&gt;&gt;&gt;&gt; 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x=
2d0 [<br>
&gt;&gt;&gt;&gt; 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0=
f 83 0b fe<br>
&gt;&gt;&gt;&gt; ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a=
8 01 74 09<br>
&gt;&gt;&gt;&gt; f3 90 &lt;8b&gt; 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07=
 9d 4c 89 fe 44 7<br>
&gt;&gt;&gt;&gt; [&nbsp; 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 000=
00202 [<br>
&gt;&gt;&gt;&gt; 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RC=
X:<br>
&gt;&gt;&gt;&gt; 0000000000000001 [&nbsp; 467.385123] RDX: ffff964f1fa31280=
 RSI:<br>
&gt;&gt;&gt;&gt; 0000000000000000 RDI: 0000000000000001 [&nbsp; 467.393024]=
 RBP:<br>
&gt;&gt;&gt;&gt; 0000000000000000 R08: 0000000000000000 R09: 00000000000000=
01 [<br>
&gt;&gt;&gt;&gt; 467.400928] R10: 0000000000000002 R11: 0000000000000002 R1=
2:<br>
&gt;&gt;&gt;&gt; 0000000000000000 [&nbsp; 467.408836] R13: 000000000000007f=
 R14:<br>
&gt;&gt;&gt;&gt; ffff962f1f42c9c0 R15: 0000000000000080 [&nbsp; 467.416737]=
 FS:<br>
&gt;&gt;&gt;&gt; 0000000000000000(0000) GS:ffff962f1f400000(0000)<br>
&gt;&gt;&gt;&gt; knlGS:0000000000000000 [&nbsp; 467.425604] CS:&nbsp; 0010 =
DS: 0000 ES: 0000<br>
&gt;&gt;&gt;&gt; CR0: 0000000080050033 [&nbsp; 467.432127] CR2: 00000000000=
00000 CR3:<br>
&gt;&gt;&gt;&gt; 00000010987ea000 CR4: 00000000003506f0 [&nbsp; 467.440045]=
 Call Trace: [<br>
&gt;&gt;&gt;&gt; 467.443289]&nbsp; ? tlbflush_read_file+0x70/0x70 [&nbsp; 4=
67.448266]&nbsp; ?<br>
&gt;&gt;&gt;&gt; tlbflush_read_file+0x70/0x70 [&nbsp; 467.453242]&nbsp; on_=
each_cpu+0x2b/0x60 [<br>
&gt;&gt;&gt;&gt; 467.457437]&nbsp; __purge_vmap_area_lazy+0x5d/0x680 [&nbsp=
; 467.462679]&nbsp; ?<br>
&gt;&gt;&gt;&gt; _cond_resched+0x16/0x40 [&nbsp; 467.467224]&nbsp; ?<br>
&gt;&gt;&gt;&gt; unmap_kernel_range_noflush+0x2fa/0x380 [&nbsp; 467.473072]=
<br>
&gt;&gt;&gt;&gt; free_vmap_area_noflush+0xe7/0x100 [&nbsp; 467.478315]<br>
&gt;&gt;&gt;&gt; remove_vm_area+0x96/0xa0 [&nbsp; 467.482770]&nbsp; __vunma=
p+0x8d/0x290 [<br>
&gt;&gt;&gt;&gt; 467.486792]&nbsp; drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [&n=
bsp; 467.492299]<br>
&gt;&gt;&gt;&gt; drm_client_buffer_vunmap+0x16/0x20 [drm] [&nbsp; 467.49814=
4]<br>
&gt;&gt;&gt;&gt; drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [&nb=
sp; 467.505118]<br>
&gt;&gt;&gt;&gt; process_one_work+0x1b6/0x350 [&nbsp; 467.509912]&nbsp; wor=
ker_thread+0x53/0x3e0<br>
&gt;&gt;&gt;&gt; [&nbsp; 467.514361]&nbsp; ? process_one_work+0x350/0x350 [=
&nbsp; 467.519338]<br>
&gt;&gt;&gt;&gt; kthread+0x11b/0x140 [&nbsp; 467.523342]&nbsp; ? __kthread_=
bind_mask+0x60/0x60 [<br>
&gt;&gt;&gt;&gt;&nbsp; 467.528389]&nbsp; ret_from_fork+0x22/0x30<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cheers<br>
&gt;&gt;&gt;&gt; Karim<br>
&gt;&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt;&gt; From: Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt=
;<br>
&gt;&gt;&gt;&gt; Sent: 12 November 2022 17:47<br>
&gt;&gt;&gt;&gt; To: Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; jan.ki=
szka@siemens.com<br>
&gt;&gt;&gt;&gt; &lt;jan.kiszka@siemens.com&gt; Cc: jailhouse-dev@googlegro=
ups.com<br>
&gt;&gt;&gt;&gt; &lt;jailhouse-dev@googlegroups.com&gt; Subject: Re: Jailho=
use:<br>
&gt;&gt;&gt;&gt; enter_hypervisor returns -ENOMEM<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This email was sent to you by someone outside the Universi=
ty.<br>
&gt;&gt;&gt;&gt; You should only click on links or attachments if you are c=
ertain that<br>
&gt;&gt;&gt;&gt; the email is genuine and the content is safe.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 12/11/2022 18:15, Karim Manaouil wrote:<br>
&gt;&gt;&gt;&gt; &gt; Hi Jan,<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; I am trying to deploy Jailhouse on an AMD EPYC with 1=
28 CPUs (8 NUMA<br>
&gt;&gt;&gt;&gt; &gt; nodes), running Linux kernel v5.10 (same version used=
 by jailhouse<br>
&gt;&gt;&gt;&gt; &gt; CI with same patches applied).<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; `jailhouse hardware check` return that everything is =
ok and that<br>
&gt;&gt;&gt;&gt; &gt; &quot;Check passed!&quot;.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Memory was reserved via `memmap=3D0x5200000$0x3a00000=
0`<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; However, enter_hypervisor() [1] fails when entry() is=
 called on<br>
&gt;&gt;&gt;&gt; &gt; every cpu and return -ENOMEM as error_code.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Try to reserve more memory. Maybe the default size of 6MiB=
 for HV<br>
&gt;&gt;&gt;&gt; memory is insufficient for 128 CPUs.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Did you use jailhouse-config-create? You can use the --mem=
-hv option<br>
&gt;&gt;&gt;&gt; to increate the memory. Try, for example, 32MiB and see if=
 it works.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Do you possibly know where could the issue come from?=
<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Best<br>
&gt;&gt;&gt;&gt; &gt; Karim<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; [1]<br>
&gt;&gt;&gt;&gt; &gt; <a href=3D"https://github.com/siemens/jailhouse/blob/=
c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251</a> &lt;<a href=3D"https://github.com/siemens/ja=
ilhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">h=
ttps://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd=
99f9fc/driver/main.c#L251</a>&gt;
 &lt;<a href=3D""></a>https://github.com/siemens/jailhouse/blob/c7a1b6971ac=
15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a href=3D"https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251">https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251</a>&gt;&gt;
 &lt;<a href=3D""></a>https://github.com/siemens/jailhouse/blob/c7a1b6971ac=
15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a href=3D""></a>https=
://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9=
fc/driver/main.c#L251 &lt;<a href=3D"https://github.com/siemens/jailhouse/b=
lob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">https://gi=
thub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dr=
iver/main.c#L251</a>&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>https://github.com/siemens/jailh=
ouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<=
a href=3D""></a>https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be=
8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a href=3D""></a>https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251
 &lt;<a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be=
8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">https://github.com/siemens/jail=
house/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251</a>&=
gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; The University of Edinburgh is a charitable body, reg=
istered in<br>
&gt;&gt;&gt;&gt; &gt; Scotland, with registration number SC005336. Is e bui=
dheann<br>
&gt;&gt;&gt;&gt; &gt; carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =
=C3=88ideann, cl=C3=A0raichte an Alba,<br>
&gt;&gt;&gt;&gt; &gt; =C3=A0ireamh cl=C3=A0raidh SC005336.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt;&gt; &gt; You received this message because you are subscribed =
to the Google<br>
&gt;&gt;&gt;&gt; &gt; Groups &quot;Jailhouse&quot; group.<br>
&gt;&gt;&gt;&gt; &gt; To unsubscribe from this group and stop receiving ema=
ils from it,<br>
&gt;&gt;&gt;&gt; &gt; send an email to jailhouse-dev+unsubscribe@googlegrou=
ps.com<br>
&gt;&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>mailto:jailhouse-dev+unsubscribe=
@googlegroups.com<br>
&gt;&gt;&gt; &lt;<a href=3D""></a>mailto:jailhouse-dev+unsubscribe@googlegr=
oups.com<br>
&gt;&gt; &lt;<a href=3D""></a>mailto:jailhouse-dev+unsubscribe@googlegroups=
.com<br>
&gt; &lt;<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">mail=
to:jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;&gt;&gt;&gt;.<br>
&gt;&gt;&gt;&gt; &gt; To view this discussion on the web visit<br>
&gt;&gt;&gt;&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhous=
e-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.=
outlook.com">
https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C=
697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a> &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C69=
7CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">https://groups.google.=
com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05M=
B6018.eurprd05.prod.outlook.com</a>&gt;
 &lt;<a href=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com=
 &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60=
18F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697C=
A4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>&gt;&gt;
 &lt;<a href=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com=
 &lt;<a href=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com
 &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60=
18F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697C=
A4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>https://groups.google.com/d/msgi=
d/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurp=
rd05.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Dfooter &lt;<a hre=
f=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F16=
63ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter
 &lt;<a href=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter &lt;<a href=3D"https://groups.g=
oogle.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM=
0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Df=
ooter">https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663AB=
E61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3De=
mail&amp;utm_source=3Dfooter</a>&gt;&gt;&gt;&gt;.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
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
om/d/msgid/jailhouse-dev/AM0PR05MB60182BDF701FD335A923BD42A90A9%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60182BDF701FD335A923BD=
42A90A9%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB60182BDF701FD335A923BD42A90A9AM0PR05MB6018eurp_--
