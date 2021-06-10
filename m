Return-Path: <jailhouse-dev+bncBDGILGE54ELBBLUCRGDAMGQE3UE632I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233A3A3128
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 18:43:27 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id o5-20020a05651c0505b02900e5a95dd51esf1355892ljp.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 09:43:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623343406; cv=pass;
        d=google.com; s=arc-20160816;
        b=PmsSU38D/aqIWl7XspyYcM2BPuIMPMmSdhM4LHvK3szL35UjfD3jJdP3bQjJ4eFiiu
         6I6X6bE/eD/gG8ks90T/BbF1HmZbBpnbwkiE3Z7l1gJUGlcC4skcAkavMl9D6QFuYn7U
         L2p4PnX4oNcnwJv/ve3g/Clk6Il7hADD+ZlEISq4GOdVeRd9MiMJ1OkRNjJ81XFo+Vr9
         ioSO8v3uxp8jQXaVZqOOBKLrJ9DhedFo4bi1sAQxmocvh0IU/dPEE6u7gKvQw+h2oU5a
         FJFd+R31FD/oK/Q+4fT1C9hLVWQ0uK7B1zgQONyfuZEajLt8CLGdLvmF4KA5+vFay14F
         eYwA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=Um1yOlPLpCNJE10b0TVgCkIcWZqQMPO0r8GV/07mYWo=;
        b=bFoUoty/ejVwu5kqj2nEJDrSM8Vz+wDYz/XFZrSVAtHFi0GLVM9MR15EVC4RTtoAMk
         FD0y7ZWOLuHWNPg7x9n+cCC1VaTTnS/pi/fVQzsgFIdmK+fT45yCn3W8RcRFaB0DV0CB
         qaxHy5OB0OGk9TcCq3WhxTzwX4da9sFtkUofNlR5/lfytLwd+OGoKOv279GicaIuSzVI
         eOy2TC3Zb5Bov2eCUThtfHE0OByzodwO2SipBMdk+8N483waMdH3X+4hZoqAHtbp8NyW
         rx9JtM2wihqFOYs5Dfwj8dI89YP1mObn8umnBXFyNOM/zlKWl2VnvEYMm5OtMRfI8CMw
         Q9Dg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=iFVskn6J;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Um1yOlPLpCNJE10b0TVgCkIcWZqQMPO0r8GV/07mYWo=;
        b=ljoT0WvsXrrOzyeA3jf1DKneMQUVMT0yzja1jSi+XU44gUGkvll0PYr+W+qP1kprZs
         KkKIGh9lg3zCI9tNFNIlxULFFUaWImq+CchpMyCc+LcWBlI1tpmAOP1/Fh6CW1WChivE
         Xw0/nui3jow/AiNz2O2RH84U7XvyUJ7J8koh9b+h1o3CYCdr+tZhoBEmKpMT83Q3iMFv
         eyCNhwMmnBjMzbAAf6A2QnfuiwsCUOZth0E4LFex9pdveXj8J3nBhPb991b40U3mDX3u
         KuIBMUU6AXd4IUyU2MD0Kyslmc7C5WynjNdciR7iOxxWeMRWTzxXhxpns/9uMyH+RxL5
         FfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Um1yOlPLpCNJE10b0TVgCkIcWZqQMPO0r8GV/07mYWo=;
        b=WO2IP6Sqd8PTnBDJDrMrQShr8h3W6bSEVcJ+C5w5geMFojjlD1jnAjn3YkW4VhJp1g
         zQme764uErurR1MmBvLm9dPyVRfQqkl3fLFD8YDt4eNjk3CC5/oMlkHZ6hvX+F9CMMrY
         WgN7ZESlpK6j9bEBCzdichLbF5SYuMU+PV3e3XPOSCnTPZqITZX/wVz3sfHLMnnhXsVR
         deCBjXKQIw429jIoJWHhusXvRoo01fVt/nORJbV0dk//bBJw5tg930VO4ShgptsZiMaS
         TrqG9SYjmO0FhPXVSQcxT1UMqUE/VlZnktcCrPVWLACtgf//wgh+UqF+MCyv13srpv4g
         haGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533a3Ab9AI8opRUvzVSGMQjcPoZc0osGNS5GE0/eOxkbC0zwOauH
	lJianot70N3vnkUYtgaDvao=
X-Google-Smtp-Source: ABdhPJwihnTPu702kiwrltglSrSdsBnd5h87GHMHtRqht1tYUOlkUxuM2xY2bI0U0Q2hpBKDg6zMZA==
X-Received: by 2002:a2e:9f06:: with SMTP id u6mr2996152ljk.460.1623343406824;
        Thu, 10 Jun 2021 09:43:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6a03:: with SMTP id u3ls4707067lfu.1.gmail; Thu, 10 Jun
 2021 09:43:25 -0700 (PDT)
X-Received: by 2002:a05:6512:1152:: with SMTP id m18mr2535941lfg.559.1623343405763;
        Thu, 10 Jun 2021 09:43:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623343405; cv=pass;
        d=google.com; s=arc-20160816;
        b=qGuH+mKN11DPqtvwZj5kuJL5551lChszQqZBnmEaQdbBniQiwDnFTcUBEfncpZJGS5
         DBbpbsSB7TJ684QTvmyTanYojOjrIi1n2e/B3KO23L4q+YVQd76Qc2Ew9b7TTuHl6X+i
         US87MBeEpb5JG4h72nbeVOldZUihXT+SB1wAF2/WcTr3PnTAblwCK/Dmtxnk2M2Ssfj5
         nnSFA88+JtCOKjISOIVtrOYAZw0z4Pl0dICm+wdz6kTkA7fbzp63g132oCjKKGAFcIsX
         aVPW7AKv2zd91t9PNlQHt7lOe8F02uhuIpDPt3dhYFYEP40Q+do+dBKwVbLGV8oyeZuy
         h4rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=0crr4Kpl8A6k/ztOeQ4h0o1VJrhlReekMbBkcElc3r4=;
        b=J0Er2joCtHySNRnitObKf010/0onRtWXQgBz9Kmn8XodVB7WBsUlG7rXOkn9rkGAQX
         tfB/+mpJJgcxWgkfBUiTQkG/ccuITtfle2CNmDUTMPwJ4WLr0uNUaUR74cBxfXybZBcM
         nhqbDxMbq5W7kdlGzdu9SFSxvS3NA/yqSt3VK2xHJ2tjJrg+jI2stLJ+pZXnhMVKmJ1N
         nCUf+jOKGc5mu8Y39lRjYFc1B/ovxO66jqvBVQJ7cNQxP/XY8q19paEsffxMU9G15/Pb
         20fQQkoS3opnEzzHwMLuUWC7VLV4PW384wcPF1IZarRvRiJnOt3a0eBnwMfcPfopNgNu
         Pn4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=iFVskn6J;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60092.outbound.protection.outlook.com. [40.107.6.92])
        by gmr-mx.google.com with ESMTPS id j2si121985lfe.8.2021.06.10.09.43.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 09:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.92 as permitted sender) client-ip=40.107.6.92;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMXwBxJ5y60+uWG1aYPL2OqYEeURzUVU2munTcALU/byMBwqaWThxx1T4IdNjOwHRYW0FPz4Mvk8cTP9MO/8jpF6/ekCk56Vm7P1gT1cI4V9SGApvVTEVWVethTxT1dmCxwn8nD4Nq5Mbn9HiDanj5uRzAAwLe5+UfSH0X2ufdfj0zXt+lw9zImzhCoj/ZsVj6IoIaHj/RUXVnlBDM0s/EJYkOukJnBE8FOw7A6PBcjTwR7HPkInFpjmB4GxC2rDFfxOGf7+8RQH45q2ewMgh3DG8U6/OAcZIa5yQc5tnIXsdMtP2zy/JwHVgI84O1s5ob3u6nGkINE9Cfhvxd9HZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0crr4Kpl8A6k/ztOeQ4h0o1VJrhlReekMbBkcElc3r4=;
 b=HhJg8akA9NCVVjLBi7Z5hisjAJEEyMd2EVYg51e7pcbCtmAZHziVVb/UgVF+uXgr3HZD8SWq7/H5TXhymjLkTp29e9V87aX2rTeppusZfetwmmxtgVe4DdJ5B00XB9S4s6qlyrVfAWDy4XxD852Fne0TWkSGg9GVrm7ASAszfb/BRWlG1s+Al/WcJUcPfeYoFnY5yv/PJrABIYtjQv8x1I8QPcP2E75AA5x0tfoFRIZmYIh+q/oq3Yl42yofMF1oI+zvy2grhuF7SIwY/NgpBiDrmD7M5a+/iOO5j94D5i1nAvdeytUTgQSXGV/m59uE74toWvG6skPJEKzeb+F0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB7368.eurprd02.prod.outlook.com (2603:10a6:20b:3b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 16:43:24 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 16:43:24 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Topic: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Index: AddeF5T5HE9bmdlrS1iCACliLynlxA==
Date: Thu, 10 Jun 2021 16:43:24 +0000
Message-ID: <AS8PR02MB66634B43A4070BFE4AEEB902B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dd91119-f094-44d5-8521-08d92c2edd64
x-ms-traffictypediagnostic: AS8PR02MB7368:
x-microsoft-antispam-prvs: <AS8PR02MB736825A8DFABD750D49EF86AB6359@AS8PR02MB7368.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:184;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mrc8llOxlvAQHnHVdNh20wrnH8iwtdsOR+v4BJ8ShMMiq3d64ysAzdthnU6GIxckzBk3z0hqYH0dsl10OyQQy7py9b2ieCey2RwFjrC9fgGOydP7sGBamLctF9ohrzH+fMp5YQiMfR+rwpse3a8mP1M4+9Pog5pPsIctf8agwrWuDw9TS5qqNTv4oFIreJzsmlbFkvZJlgAlym3U2rPsGGucq+y5eMQk22ACkxBwTNXkAcc0VGoTMJoNLEQxJQDN1h0wEd8HYno5mbzTaYfoLS5RVASDLb0d0k8DxdECu0oEL7QDM7IlSCSGVI6WR7adLd1vxoc6k/Lt8Jii720uFy1BYGyWv1ct82EInMaxZ6NCrriD3i+/yPsQ1sM8Bh1RNtGgIekSNKYF0Bb9owVQc/jE3fteLLG/hr4BM/OTRW/qk01e0qQt5LonoQrRPlkwvRxGanZOf6HEJ0kvwfhWhNaSky52KRhqYhHgOdXj3A2if/PZD8xnC/iPnoZXKmNXrm0p8x5QoHy6uhcIcXG4Tzcy80B6TTPNRO6LwQCnfsMBhZtTyAqc98jMR6A1QcFqmEZ7pZh2dHp0rD/1LID0N6sKP7+1UXyw2pi1n+qsCuE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(316002)(53546011)(33656002)(83380400001)(71200400001)(6506007)(7696005)(2906002)(26005)(478600001)(186003)(8676002)(8936002)(66556008)(44832011)(66946007)(76116006)(122000001)(6916009)(4744005)(66476007)(52536014)(66446008)(5660300002)(38100700002)(55016002)(9686003)(86362001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rmiwRditVTS9d1iD5sfvOcWc2lRj+B8rcA42b3EjP6yT/GHsinUBubcpWtc6?=
 =?us-ascii?Q?WkvU2rLlYGGreMPT0rRESVBxo1w7Ew5riY0Xev7iUYScl9JrVoV1TdWdZJJP?=
 =?us-ascii?Q?kzwNrCaEb48qynUHsaxcFMQ4dpkexKK7vFp+TZQJLjYgxOGSs+wJIKpzfHJl?=
 =?us-ascii?Q?9bROO+ouL3wI4vE5EkYVKa9BQljJ7WF+6FhMKAM3g736vPMEv9iH5vvpR8e9?=
 =?us-ascii?Q?Ll4jF0pF5AUbo6dtHUA7DlwY2FFKW7GMi4gDRb4gQTZdtdlfNGC2l5fJxmA9?=
 =?us-ascii?Q?VqM73Nes3sR6Emjxjh+1unNqguEyADZXwQXDdWrHqMj1OwSDH84Ke67MAk6Z?=
 =?us-ascii?Q?2F0aaT61e6oeH2qirU+IGSmWuICkOnIYKpYfIahyfDOx93DNL8PXYHwVpn+O?=
 =?us-ascii?Q?M+QOvdBL3DMo5eBfnP6dLXfha4reC0Az+pZPRPMc2ojEujo5dkVFxfUIpYTm?=
 =?us-ascii?Q?8CqTD9UVoA/GvH14bs0L7iJf5gtsOpXYCjnXqo5bXsFViY96qoE1cTWiAG/o?=
 =?us-ascii?Q?JmEyjl75ogaaXIUxcWBViv4dHAYUz5aLO9bSW/ATaLCKsGLOEThsfleVdW61?=
 =?us-ascii?Q?A9V0HkABzVUvH6th4a7ZKaDwYo465aCUTVyYlqn2JkzmfM4JkjEj8sEhrBGo?=
 =?us-ascii?Q?afe3XT/5KLyL9OXt81jt8DwDbtzW5CA5/1BtnKict2Q+fu2beG/uI+6vwWM2?=
 =?us-ascii?Q?rfjlDD9Rf9r4eHPUKoIejgzhF31rUvCOMOVyI6X5dNsdEe2pXQHQ+rHPM4U2?=
 =?us-ascii?Q?82kgBcZ138CsIhsmIEtE/6Xf3m/JVbr+zuLm1R/j23Ht0Fp2FEUv+EugG6b7?=
 =?us-ascii?Q?GRB+nxunrt+CSFC3csvZ13WJSZs2V8Nb4cc5JoiRSiLgUmfSzOY4e5c3ekXg?=
 =?us-ascii?Q?/VVeVJEw/Olv2qAVSKQIFIlSYVTiuT1Mv9+Ol0u8hMiti0MmbJfnl8RfaEAS?=
 =?us-ascii?Q?uD7ZxVd2VAPDgn7XV5I2oOu4jnD9XnuytiHv+3RZI4+q+4UZDONNBWxYWVlq?=
 =?us-ascii?Q?hn5ATay+75QhRAbi8azVZCKivok4IrH8TydKOppPNZX/8AETGidGyEDHHix3?=
 =?us-ascii?Q?aHg+OeOyr/ARr9ob6wg3vd5w/RU7tfdn+PlRi1Qb1NUJl2reo2MzmoiCvAVK?=
 =?us-ascii?Q?v1m5Bl/XM7FgKUI4n14jHIBsBwL3VGVjaalL0jnNeoUX8Nc3q2NDC4w+jPuy?=
 =?us-ascii?Q?xunKumVhkLrgz4qjp1u4Crj1TWJGbCSyPTWNx1HXO9WKCM3hkNOs098kvzDb?=
 =?us-ascii?Q?GZJyfWZ/51qQap2dWthN+icgCzmZWw6LpVS52NSKh6CHwf9NzXFuzdeI1i9X?=
 =?us-ascii?Q?60WmGgOje6WAnlR4ZxiYKP+C?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd91119-f094-44d5-8521-08d92c2edd64
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 16:43:24.2572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NsHY6OGUcIrC80fGBf/MxuBdgSq/6F9Uk+IbL6IqaP6lMxWG+G2XVWSUAEP3JUEBXCmBfjrTFRatbg6U/LHhcAWTiCnXwbQ3SPfYvlCxhSa0a7uPSm4kg+ZrsiPcA5G2KKAbnAGJdDt2Izw3w1GyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7368
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=iFVskn6J;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

From c310558edba8441fcb017592d55cb0a09f7f196a Mon Sep 17 00:00:00 2001
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Date: Thu, 10 Jun 2021 17:27:57 +0200
Subject: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()

Ensures that calls to stop(), defined in the inmate library, set the
cell-state to shutdown.

This prevents the cell to be locked but unable to respond due to being
stuck in the halt() loop. It also ensures that a return to inmate_main()
shuts down the cell.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/include/inmate_common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 1c20a0af..56cef77d 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -93,6 +93,7 @@ typedef enum { true = 1, false = 0 } bool;
 static inline void __attribute__((noreturn)) stop(void)
 {
 	disable_irqs();
+	comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
 	halt();
 }
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66634B43A4070BFE4AEEB902B6359%40AS8PR02MB6663.eurprd02.prod.outlook.com.
