Return-Path: <jailhouse-dev+bncBAABBQFJX6NQMGQEY6BMWUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 24861626ABF
	for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Nov 2022 18:15:46 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id e15-20020a056402190f00b00461b0576620sf5410270edz.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Nov 2022 09:15:46 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668273345; cv=pass;
        d=google.com; s=arc-20160816;
        b=dEIh2/0ErS5bzOSI9p8LJmvLBQCvJUf5HpZBMoz4AIzfzW69vfol2bRHIIKRGxFatI
         PjKCZMzlkLMLhY5PyQx5B1vmc9h9x4fZgSW5XIGiFTRCHM0RuPzgJ52ncMII5shjWl8D
         UcEdJk/76HVflsyIWhR4ItJ3z6iSm3DNF3ZC3V7/u2UuKBPAqfQKioZjHv88a/da5T/g
         593HuLsYaab+IU9wlfW2mRc+10/txgbSVUkWzBJQRJhBhqzIs2C3evVhw+4+JpEqqsKj
         UEBB2haG4rxlNWokvHthnhqGg9r5kKbQ1BSuqkAl2u9c+leqgZcw/MrmGEPMZsijYL5O
         zL3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=cOU4u/xeKUIYHtmj185RaALgNulQOx0G2o6LVz12xq8=;
        b=Bl8satyrFE0kv3DyLDLimXZpobc9vQFLuA9C6OhlH0PFrNCI5x65XnTTQJC8sHGrxH
         vcPIcHmoWIHeYzI9K7Uixp55pv84Tsx4bXwC/VvVPyVgwjdHUeQaRGPSGzGtTRYJj3u0
         LRHdwKaWoJg0VE1rBpartaIO7OzpOkUjRgcfunERr6LIy3AOBOxYN64rtEVBOmoL0w4s
         XnCNQ7s1sAMRXRY4DY226OkGbS51lKVFerA615/UaSg8R+ER7jisycU17wbfut91VKBD
         nKYw07m3w9WjbhdVthMlhXDeB6EvQ1/tjat95HU+EFT8+ymU26sSleoh5d4hY6qQ6kPd
         GYwQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=eBIGadHD;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cOU4u/xeKUIYHtmj185RaALgNulQOx0G2o6LVz12xq8=;
        b=stZXKVhlAtM220MiDrbecuCJjnJc/3V++SA3wh1thAok1DnhOiEy4+wi5ltUDNexBs
         ufzcIlGGxDT7ZdFcyKcQw8iXLDXR5zGtmjBZO0TBHPajMiShVg23yCvoCMZJdcS7+O+1
         /ZdgPgjoGkh/2nduoUKujosiit2c1wcrt9v0bHmpMZmA6mtdEJOhn9xRgzrmYr+BTCES
         jHbdjQF6HLAagvuYH5/1dlTAeBLBH6UdCGuSrxUr1kwgqFICX0w9UFo9cqKTxZMMXVCe
         6QJplKMqENM98OYOq7S6tVOeeOiUV3l610GRS1qaul5bwvdkZWL3kdJPdJa38eh1VXE7
         4X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cOU4u/xeKUIYHtmj185RaALgNulQOx0G2o6LVz12xq8=;
        b=gqzTMNH0XWYtY1LEYr/eK9hmj/M9z5ys2RPR6PS5dJ9v9QaiFpCjAUGvBJQV/4l5Py
         XVf+IOiqUm7WjZLViCAndUByPSg3lexnsyR32+ok6CKov4vgWhF7vHGj6xiQ8mgezNHh
         mNiGprGGA/FV7eEj3ClenOrDlhD+WuCJ/qbDxmjxNkdynS3RNqimSmCtRPojDevWNZ3F
         Nfnepf3jOMIa4kgSObhu0H06eFKN8aWEiHJxVTFaN2ZNLbXBAaccgTzcJTB9CRkJoYKN
         oiVubmhhDUjbKffJVB08mNO5g12N1W2TI0GgxCAVALDJxPoEUgEgENWAhR3Wts8KRXoj
         FCWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkloH1td8WHCNJFrZElm2W732c1tTfpKl3FD38G8qV2h3sCR04M
	9kfuMUjbcVRlH1x3WhdFgSk=
X-Google-Smtp-Source: AA0mqf4CWyXtfoyqVDRNemDJ2G73eB2yvkGpdkN0JHJ9jXcIsQiQHgMYgjVZmcK2rIDXU+dEQxayJQ==
X-Received: by 2002:a05:6402:28b0:b0:458:c66a:3664 with SMTP id eg48-20020a05640228b000b00458c66a3664mr5816154edb.79.1668273345632;
        Sat, 12 Nov 2022 09:15:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:35d0:b0:45c:bfd9:fb45 with SMTP id
 z16-20020a05640235d000b0045cbfd9fb45ls1213707edc.3.-pod-prod-gmail; Sat, 12
 Nov 2022 09:15:44 -0800 (PST)
X-Received: by 2002:aa7:c90c:0:b0:461:bacd:c85d with SMTP id b12-20020aa7c90c000000b00461bacdc85dmr5724322edt.278.1668273344306;
        Sat, 12 Nov 2022 09:15:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668273344; cv=pass;
        d=google.com; s=arc-20160816;
        b=xe5elbZQacQx5RniVOxC4/rOab4XYVv/I6IAYW0hv1Pa+QY4LA1EhrKGwhQJ0O54t4
         h2767AHyR5sgyFa7gYV+banXTcjU5hVNITEDZ/7mmwksFSt+FfeSwWjuHbjDyVHz5DCw
         4mzv8Ey/aQEASNhSHPutcrFrI3vtJ3mnVFbUTftBgMGnoyW+y7lfnht7e3UFHmKnligi
         K9fulmkmeWYrtIKyaWMj5aC08AMPl10GJceZGmHLMPA1oFE0irVC8EfTmsKQ47FBJK2E
         +ghFNHabZ6PjmgEDR3A+0FT/9AsKCX3mC5RKfl5AzyBMQ7+VKzs4ug/VWA62rzWjW4Gx
         QQlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :dkim-signature;
        bh=uUPsaE5aMrT3jKoOL7TiVykURYj6YHXIh5vcaAh+r1U=;
        b=yEifJrdqAZnENB4oChtrPP24bTsmS6ewEdEbPFkoMj6TGMobk0/DNcKden5JsU5SXW
         tm2skkMCdImEIZtG94MdIRixScz4qtLqJdo+kCQxePm9idj4liSw1upLEB0i9FrdKaas
         znaeZQKAQpwm7U/XcI8T2I7fUnN2kP2/JjDUHoyTVmrzOxi4kkJevh6dYkomq73rAu7I
         now6gI9pCkSt2P0jJK7r/EKPTbhPDPQTJhM+88r0IfUTrwwyfgqcVarotZtctbxVJRfu
         Coue7mDMTm+2QCqBIGZOm9zSJlC91kOwmsLMKY0lLwgGHAUUwbLqlX6Hs00nS0zVHLaX
         ym4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=eBIGadHD;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from loire.is.ed.ac.uk (loire.is.ed.ac.uk. [129.215.16.10])
        by gmr-mx.google.com with ESMTPS id bf28-20020a0564021a5c00b004621a13c733si195678edb.1.2022.11.12.09.15.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Nov 2022 09:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) client-ip=129.215.16.10;
Received: from exseed.ed.ac.uk (hbdkb3.is.ed.ac.uk [129.215.235.37])
	by loire.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2ACHFhg0013946
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Nov 2022 17:15:43 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdkb3.is.ed.ac.uk
 (129.215.235.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Sat, 12 Nov
 2022 17:15:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.50) by
 hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13 via Frontend Transport; Sat, 12 Nov 2022 17:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgO8Qjh442SuXSudV7F/8/fXEubXzsHR9yXXWbMK7FvVVFrGTEUMvNcbRz7oTo8tsF0mytyoYTX2SXwM7Nb1s8Mtruu4PdxSlBc/CM7Ao8TMKw9qlkEnmnv3FLSJElE45d/U1ALHobOKUnjXFiiVIYacSNDmdIsBQI0ifZfNSAEjVOYhTj6iFiAbgWILBU0OfXCDQtGSpJKzcXFIp4Bm3aG2g40jRjN9ErlrVgOZzfdO+bz6fajdSZeyUKl68UrNFc0z0+LLQZKdaFtX3bGg3wr4VbSehC2v5Z9ABMZ3+FkjdRRarEfZE+zc7ZiT+gYJFoPSLD9F4hkZxtiHRc7P4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUPsaE5aMrT3jKoOL7TiVykURYj6YHXIh5vcaAh+r1U=;
 b=GAU4Aodc1ykeSEyxVE8f2peOX36LTG6ZtDCwjxry51m4k3BiidyYvX18h+2SAEFU4n6kFhfo6HsePlVwJlBBcP+MXmVK468CfkVYViJZtMWZDYPqhHZhh/TTI2MQNIatGK/H24gfnzeISb1Z1UTRqA5Vv+LqjDx02Vq4aFpWhHAuu+XZl9GPBE0FtbjdiudvX+h7mi2e3Cr4ygMmtHmZ/H7MyZItG6AaArDX8RGDzgHAoEmwJMUPYZhW5ORbcRgLGOEZg4vNhI0pFGs7NM/FjEUllCUtphtIlb0bdtiVU9MU/e7l4f1vwei6SLfVxQoy3SmhwKARudGjBxoCkstC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by PAXPR05MB8560.eurprd05.prod.outlook.com (2603:10a6:102:1a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Sat, 12 Nov
 2022 17:15:28 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e%5]) with mapi id 15.20.5813.013; Sat, 12 Nov 2022
 17:15:10 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCA==
Date: Sat, 12 Nov 2022 17:15:10 +0000
Message-ID: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|PAXPR05MB8560:EE_
x-ms-office365-filtering-correlation-id: 77962729-88e9-4695-4e75-08dac4d1746f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +jib/5YXHTYKsHmDM48mhhfRyvkE5SM3AKjJYwDZanyKB+sVZA1iioM2Ht+9HrYplaAOArwWCiaAmxGgLQ82S+aqaukyQ8OSUc9F0OZvB5idadyP5PvMppETm48JBGpQCrzVT39vqFcBXU+NlTC2aIKlFHMxXq94PF40IqzP9vmLM3LGuy7qqR4L3DO3Sk/5teFsq5zVcO/i+eHywzR+AkAa3HXathFCd+NVY7lqoFL5o8jVA4pdcpLB+fyrKWo0TG31Ut7LTNBRQsFKLEjX9D8L+L6xt/E7/E/fW73rLpRlOdlig83G8RKOepsrrDiTi7ZtJFdGxhZ2pnx+5gBWvBs1TV7NJejIydHcVvjp6aiHrp4T1VCioJjH16/pwZx6wdiczsQJ4cmWy2jY28Dcd26w2pNvt6PvXTTDMT+B8dJhI/GQxTF2BpnufhMe8paI5USSOcpJVSNhaOpmNGXedFoLh3/eMt9BR+JURrpxLPn1dyuuLb6XVTrRBbbjZAPrV/6GJFVWO/LFukMM35psykVVQfDFd6MR6zkr9PYhuSl/awYWLaG/AmiWlXqu5C1V+iFmGzcwCgeDySqK8MnruJDGW6trTLTpUYttXoiiVZAf5ujQnYF/AGdALiu9oHF+etlFQ4RWyXiXcGVLuVQDN3BnhFEhlI/rig6KHRYRGY2jHGAbQgJcU5n9HKs54gec4YJVjEUZRkeKddKsw9oeaLsmsS9LeXis63ARiBJm0Cn3H6VRJAN+PJNj3KgFaOjonIyLZaRaiTwa2X/VHkC0+TDMGLKa261Jgl9gBthqms4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(6506007)(7696005)(26005)(9686003)(122000001)(186003)(38100700002)(2906002)(4744005)(5660300002)(41320700001)(55016003)(76116006)(71200400001)(966005)(6916009)(478600001)(4326008)(66556008)(8676002)(66476007)(316002)(41300700001)(52536014)(786003)(8936002)(66446008)(64756008)(66946007)(166002)(91956017)(33656002)(86362001)(38070700005)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AnWVkhXQLSVN/QD916jQgopgczbraqAkvjbQKFR2nWRqwhB+JpDQ2DDYva?=
 =?iso-8859-1?Q?g/vIDPbL1tomykllxetSyuxEOsVkNI8Jbz7XasQ74EBV4QMMq12AcpBMcV?=
 =?iso-8859-1?Q?h6aCPI5eqvzze9IfgzEq0SKSk1cEkb1tESlyVsXUDyp5/GVPodaNqqsm5X?=
 =?iso-8859-1?Q?lcU8wPOWctxmBLLtLJuY2A1ZCMJEe/g7tM46p1naVeV+ef0DgLlZiTBknG?=
 =?iso-8859-1?Q?Y/yHo3sGWX9ecfpCzPa4u7LdD5gKMWMAKmTEN4z6ZMHUlOig9W2/xkvl2g?=
 =?iso-8859-1?Q?Di2EwurFbiVq8RgpOI1PA9D/eO/ReR84IKSm8wYa7FtZvKQRhZzmUsKa8b?=
 =?iso-8859-1?Q?Dy1HGtS3A4y6uDk0wIOUe3S61qT5aYsK/jSZ7/Myke0dqZIX3ff+MVE9Hu?=
 =?iso-8859-1?Q?OZbzEA2Mlaq2/zhXAsJG3es+zFTpYld+wXk+WaNqnIezqXfXwWa8h83pUu?=
 =?iso-8859-1?Q?oahhfYBG7eXaYnTXMHFyazaUDgeXpexQcz1s0Yy1B5/BWdvRgpMsnoutKl?=
 =?iso-8859-1?Q?NO0JA7iiXvTwAL/fWBJyy4/xk+WXvo1cMsycWZiUTTrMu9CNV5GGYKifch?=
 =?iso-8859-1?Q?8S1L+kTnLD15HC+KG93mhwsSA1vf3ko6zJgyDn7+Gk/+/M7rj7XVA/HAuf?=
 =?iso-8859-1?Q?W3qyXCw018EapravVmIqPDaA5XkfxXLgeXC3VPkGEqxdskSIVmFCokmGI+?=
 =?iso-8859-1?Q?dQAyJj5jY91O2yZ9/t9WUK3XRYp9IX4n6XZFqq/WXWt+Wt5hw0WIoXSIHU?=
 =?iso-8859-1?Q?DkU1aH2NydUgtDZKaAd1EWR9ZUde/c4K1FjDuO30taD1kd7tuzypas6OEN?=
 =?iso-8859-1?Q?f1WrIwlO6EEX4yo4cp/Z1KigC9ubj6WC80alh7v+EIPncq+CexpsaJdOk/?=
 =?iso-8859-1?Q?58a0oOJV9ap3zVYvAmTdkvFqyPWJUXrjSg/m8wgBbRHpuq9lhskSHCJJYH?=
 =?iso-8859-1?Q?j2E9HXS6lbBabiimwDw6If6Oq8saSDAs/jCD7PuFAHVPsh6Su3FyZDTw9F?=
 =?iso-8859-1?Q?aYYv+RoQ0MMWUa/BuTQ377KcrV2C6u9dxVQutwwvJnCd4BCA6YJQcvR0Eh?=
 =?iso-8859-1?Q?xnhno3jn/YNusHk52CEHF/DS7b+97WDV01E011aCvpxMwn8oOD70pSAewm?=
 =?iso-8859-1?Q?G+/9Y1AZcG0n1QDtb/u80Dntn+yGzy79ciiENLjUMn7qtg8IpgAJrcZF9s?=
 =?iso-8859-1?Q?h0bjzAuwqIFr+qJG3HJFqLLWBfhf/kuy9DXslCy8UG7Be6jOsQ54U+Ha63?=
 =?iso-8859-1?Q?HPANJR9tjhreGuXIhKTvrqLkXvg/MDQg+S8yWT+azyEYMo5WtsFVTSYl4E?=
 =?iso-8859-1?Q?BOOBBr15QnqBQiekTvqQD35Bi6w6VHu5vThkSZXFZpwL6cOa/Lrv2Z/qvv?=
 =?iso-8859-1?Q?Gn4a5DOLyURDkBFft1OOuaBkUupzlPylaQ6qBiKHGsXWqonmVFwV1a0ug+?=
 =?iso-8859-1?Q?7gB86sxR/Ez3I2FJ4omVWjkZ8XEqqvWwBXGB3kw/uPVeAVyN3nYRig+aKo?=
 =?iso-8859-1?Q?l4Schm62IdFUZIZXyXsmroeTAvnmF/9mdVS3fsS6ITHGWyyz80oR7Gu71+?=
 =?iso-8859-1?Q?rm9OvftLVtZXmvArTrevyJx//gHzlvoiCKM5crh692Quv2pSlfI+WX8Ovl?=
 =?iso-8859-1?Q?rS1ZZpP4W1PL4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB6018F1663ABE61DA3C697CA4A9039AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77962729-88e9-4695-4e75-08dac4d1746f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2022 17:15:10.6850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5NPq8gFidF1ErsOxewY6rsjrhjiACLYyQBYZe++un7rdQ+qTmgJF5/S1QSYTcVi0bcW7cplm3GfmWdxwyCeDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR05MB8560
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at loire.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=eBIGadHD;       arc=pass (i=1
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

--_000_AM0PR05MB6018F1663ABE61DA3C697CA4A9039AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA nodes)=
, running Linux kernel v5.10 (same version used by jailhouse CI with same p=
atches applied).

`jailhouse hardware check` return that everything is ok and that "Check pas=
sed!".

Memory was reserved via `memmap=3D0x5200000$0x3a000000`

However, enter_hypervisor() [1] fails when entry() is called on every cpu a=
nd return -ENOMEM as error_code.

Do you possibly know where could the issue come from?

Best
Karim

[1] https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6=
e2cbd99f9fc/driver/main.c#L251

The University of Edinburgh is a charitable body, registered in Scotland, w=
ith registration number SC005336. Is e buidheann carthannais a th' ann an O=
ilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an Alba, =C3=A0ireamh cl=C3=
=A0raidh SC005336.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB6018F1663ABE61DA3C697CA4A9039AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
i Jan,</span><br>
<br>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I am t=
rying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA nodes), runn=
ing Linux kernel v5.10 (same version
 used by jailhouse CI with same patches applied).</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">`=
jailhouse hardware check` return that everything is ok and that &quot;Check=
 passed!&quot;.</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">M=
emory was reserved via `</span><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-col=
or: rgb(255, 255, 255);">memmap=3D0x5200000$0x3a000000`</span><br>
</div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
owever, enter_hypervisor() [1] fails when entry() is called on every cpu an=
d return -ENOMEM as error_code.</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">D=
o you possibly know where could the issue come from?</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">B=
est</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">K=
arim</span></div>
<div style=3D"font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(2=
55, 255, 255);" class=3D"elementToProof">
<font face=3D"monospace"><br>
</font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted1">
[1]&nbsp;<a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b6971ac15=
e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251" id=3D"LPlnk965293">https://=
github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/=
driver/main.c#L251</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
The University of Edinburgh is a charitable body, registered in Scotland, w=
ith registration number SC005336. Is e buidheann carthannais a th&#8217; an=
n an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an Alba, =C3=A0ireamh=
 cl=C3=A0raidh SC005336.
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
om/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697C=
A4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB6018F1663ABE61DA3C697CA4A9039AM0PR05MB6018eurp_--
