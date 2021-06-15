Return-Path: <jailhouse-dev+bncBC44VTVY2UERBOHHUGDAMGQE2KJHXAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D03A7AAD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 11:32:40 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id a25-20020a1709064a59b0290411db435a1esf4278447ejv.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 02:32:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623749560; cv=pass;
        d=google.com; s=arc-20160816;
        b=rqumq6gPHv2aizUHxaxBu2ban60hKTQOMm9ucUq9q8LK7xKvGKlYyKEe5HXXg+TQEc
         RlXtfc+oaZj3ajLGyAtKhD/8TZqsNo01gn3/kJKc6I/70yVgkD9HN8sgrRj1iZqN+OxB
         xMYwjZz9ShstCEiejQRwGMjXVNP0GTZBEAvXYpSlw1QbCLlF9y5WQ5ZelFaLM1Xi8Xi0
         qVCCJwFGDFMeOBAiSwAtlg735EHMGIANr5A7sOsqzRa0GGbjp3BrAdepUXRstD1NAhv+
         JWgPbGBBKXdtFYOWbVTnAuyae7iyL4RpFWgyoZS4zA23Ne/eppfXp/Cc5Uuu/ehKE4TG
         xROA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uQtG3wQQbxAN9+PzDINj+x0yKxCB2kB65pa7sSjoVSY=;
        b=cEh693xhP5w7SozSUd8Bqlg3nV/IDXC/wboY24NB+bacS6B+fEHNsYaMgF3cVODASZ
         X7N66Z3RREHW9WhzSbt3RgAeOn8xbuNVBB5Www+TtzAjokuuURD7JwBqKcGPtfaGUcSA
         0l/2vA/8F7ncmp0QSLGIYKYIFlUVqnbv+NwjX7EKxDrIqYhkFBzqxBDVeHw0EHYtZdVT
         l+cQH8y80kQvz3QoVwUr22EhHZVVvT30w+a2s99DG3PnnS8hlutACq4XWIpIz8YlX/LP
         FxPJCmka1UgcpoditVGh9tDoW2YbKS0hBVbLa59BS84UbMl0GkjjDTWb9kfN1RVo/3Yh
         /E7Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=QF1UMZRl;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uQtG3wQQbxAN9+PzDINj+x0yKxCB2kB65pa7sSjoVSY=;
        b=E54J+iWEfGmbwOOPkPCRv/Yv7EZ8o/jwSKMXwH/XdoVWuMLb4XDprObIE7g/VaatQE
         DHHrNlJHE8d67mw36YJDLqryxltXQpCVtmNu2KhZzOvrv+ZcqW44m8qUHXzLPErEt3sS
         LdzS6oJjlTBD2Ul3uBoDSOcSYSmzm2hPGjhM+NZkRxQ4tyQMthQgPAa20o/R1v9+tHdB
         Lxm4EYJch1aGS1LP/xFbLqsMAsWdELej8pHAM5ZXzDE/mADtM+DQdHSDuEY7NYdH/hnS
         7fI9hGRBn4u6vUf46eqbS/Jn1oqOtiA7NrXpYwDi6UdPaGhCzGtc3JjArwbWSRjEfn9E
         RH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uQtG3wQQbxAN9+PzDINj+x0yKxCB2kB65pa7sSjoVSY=;
        b=nTTNmmCx8kksEn0WMZBdJuEEeV4080b5bKJ0whqz5uYA3lNTuKMVaR0jxiAfs+bvBm
         3/94uuFUY1+CqX4aGVCCZPmoC3liqv63sO9qe/4QH2XcAWxx9P3q8+1QIzqqEvI0EBvj
         20hRIAiLGRYITuy9ENyXt70wZcpSEOqHEhgtCDsWxv1Sccy2OhfFbW5BlY5ulc58Scr8
         s0Jm60suE91xuONKAgRrsZ4yTIlJQ1SEZid2q13ZZXPgYJyPYjH1Oz4ZkoQpea+fUhTU
         KneJvXtgUa1jFqHMq1oQr3fcbk36pG24rEbssG163vzSiN3k85nMGk13sC+9nIiyDvxp
         hCbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qPIA6DHEQyL86FzBmsk1ID2D7Pk5BCc8f6sf0VsIyjPe1yIRw
	w3XYumCCueadZKbs19rEaMM=
X-Google-Smtp-Source: ABdhPJz5fpcGnsceKedGsc/1TZ4GpObXrCZl7NSI4NGvCgKyf4qTpJtC3vcqYTL5PbktfjAs4BZE7g==
X-Received: by 2002:a17:906:430f:: with SMTP id j15mr19452535ejm.445.1623749560290;
        Tue, 15 Jun 2021 02:32:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1293:: with SMTP id k19ls7793002ejb.9.gmail; Tue, 15
 Jun 2021 02:32:39 -0700 (PDT)
X-Received: by 2002:a17:906:6d97:: with SMTP id h23mr19380257ejt.467.1623749559446;
        Tue, 15 Jun 2021 02:32:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623749559; cv=pass;
        d=google.com; s=arc-20160816;
        b=r5nveg1nuq9TwsfBxDKI7zIrymPMHF+WOIxTdUDoo/cTzoKmem3giOn3S/GBy2otj9
         dV7D6//ShGT8u4yuzDyqYolac6X5NhwpKwMCrxT1xwjY7vKS7eWIq9MTE25zOJZAxpsf
         gFUBiFBGIwLy9Om8UALD5PaO3r9UbMte7rS4fXQviEUVLxFZQlz20TIgGkpNzHwWUuqz
         GMMa9CXPAM8fR+kBHwkqvtPZkWEwLLysKtPRoOO97RpnNCW12ZLFsfDsfvD36swtfKVx
         1omeYZof9jtVBJ8bkj/Lg023a+zzU4UZTwAEW8b/P/RAkcpAcRIkW0uo1IvvJHWaoN7S
         NN2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
        b=ZUSuvuWsA2hrg8BL33QzC3gYKkTHcNsxWYJsM2wL/Q2VO8T79CERcIsTO/LYbhLvHz
         9JiW0U11iDid6fdpaxvsnszlWQpV6l1eI8qmZnIfjRyqJ6lShFGCa/REDoqHLY1wivYa
         ucpxXjVyx9dr/GVDnhwtvW5e8aQ6pVWcK81smD5x8WxiT+1xO+CYuA+G0BmE8VsT5ozf
         Gm60uRVhi0BQA5izLJDLDMUdkDAFhJYQHXrULobmmtNnLmPtGLEDHZcIkEST5rho9x1+
         0wKTtTwYNR8ZXYMak6Omu1eWoMCdavecW56sWe1g9yAAe9XiZXDCnnfIAZ6ahRJyPVyf
         e5xA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=QF1UMZRl;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com. [40.107.8.83])
        by gmr-mx.google.com with ESMTPS id e6si59393edz.1.2021.06.15.02.32.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) client-ip=40.107.8.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3iDhlLUTnx0IOjV5aaLzoHtuW13tpf/T9nEcKOHHcmwbmt1igHmYFHTxQ4C2bKpY11U41b1aK5OvzDpJShG9tDpPN9UqTC9UysvtYTvfs5KjoZuf8gWmKXB0pe40CxvYXscAQzVVr8WECzI4BP4yjM/q/gOljmN3iupF0mcRbCgXi6qaJjvHPgEUTLgEFOoJMVCQ1x1B1uZybMMY0JHnDuog3wvhmDQRQBckOmCO81S9BBJVwqXoYP5PXeOlZaNY32C6zjShEoKwKeP1NN7kBtW0PyHEPxDGNEk65lvvRmiYHuKfTJFb8DAKiT6MfgGlJgbNuE3kM/+jCNivDpGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
 b=VcRBUmbq2wkJwH6vb8pdCs3tGgP6qtHSzPbscPpJR81ppgopRFyvWugGakUlmYCgbw1gb8Y2LBEJx1g8HjUxlhiPTx5x+N+cBXAqjPouPePDrX+E8Y9Vm1BY1+ALmUs94nz+PzbYjuBwrHJaJhmj41UkBDEA2x1VCbIgyMQlOfu6Y8duKgVOP6U2eMlPYWBnweGrKOZhgkke85ympUtYfl1WAabpE5BMSV17Xc2uupvaC+VBhCwUSk4n1RdnqMrDCzeapfFjQqhl9he5UOo4LefHUmoz2uGrPcobGrKHREF9EUdXWjj0kfT0AGS6sJL2vJqWAjIh/3hEbk4hXCXFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM4PR1001MB1235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 09:32:32 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 09:32:32 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 2/4] tools: Update shebang from python to python3
Date: Tue, 15 Jun 2021 11:32:23 +0200
Message-Id: <20210615093225.162909-3-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615093225.162909-1-florian.bezdeka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR0102CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::24) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR0102CA0047.eurprd01.prod.exchangelabs.com (2603:10a6:803::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 09:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aa928b5-5bcf-421b-d3b9-08d92fe0809d
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1235:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB12353A02DDFB3C3E03A22A5CF6309@AM4PR1001MB1235.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vk6cOGL/AHPhRR18F2QnyDUxz27H0NVXc722/TgRVfUzEuJ2/edr9qi4vhBP2la0318w1sUbiYJc5ugVPur4sTZQKXp2gHYdsSnmJ8xVb+waBhP2Uh2O0JwprRC4n7+SSMRB0AQYDJgYzPmIHLJJYM5II+68+XhEw7pSfwInkTBkrlwhOiR3s7+8VQaMPhUTCrd+NnJYuXbOqdh8+6Z+Dz7k+TyiqRsiif+ZG3oIFemW4o3L/WwpVLoeKjyVWVFJyzA7X67uYkfHB5Vo2lX5NoItNCNsJDZ9BGqz2tnjUkja7GGU2ZE7F0MN/ZUCjhPqX1rW4tOf0CYoMGyq8kXx5b9wHBJGGNaZqzNMpSVqoDjFtk+4JZpKMcKqydY4Df147xpz1J2Z0+XGgwqtM1DnFRecnjCS3XQjsZD18FbsI+2H/EWAiRVIqch8fXoeVlRTFbc+4wQtAZ4riq5G/exlVUUzNErSS8x+97QWsU2RpUrASoNuLCQcFTRPjHIF3/ggyL/wW02ziGt47c42ofa7lF/l8aSpC00HyFf+sQo6Pvh1aJoTwKVKB9JTl3lIKDwL9SFAN5NptjUXPuMMmMVqCrlxRk0pGx3tVkX7t3RHqQE+PSyfX2sTOoBHaBNEpl16IfMmKbPcbvPsQjoCA2R9h3bgdNc9fsFRJDc07wfELKE4o7aHNwq3eoOmIyAwRCfA26wNJ27Q1Qx8gi88rPtGHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(44832011)(8676002)(2616005)(86362001)(6666004)(107886003)(26005)(956004)(478600001)(16526019)(186003)(66556008)(1076003)(6486002)(54906003)(6496006)(5660300002)(83380400001)(66946007)(66476007)(6916009)(36756003)(966005)(4326008)(2906002)(38100700002)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4AGGB563fIxnXV/mys6OVFJIN6bojfZDmkjCQq+xxctJ/ZccL4mXSKVfDt8u?=
 =?us-ascii?Q?fbvj2QB8FcMxjLK5hJ1UKEmzn+NiOHsBPb+3L2ZeDvGepv4o4I+a2TC7Y6Cf?=
 =?us-ascii?Q?wpuNoTJgxFfVdegI+5woEmonM9rWTsqUMFN7GbcIuL0CkzSwsD4FOS7Dcje+?=
 =?us-ascii?Q?YBBUhs9IH4Xegqi9SGG6JB6KLPHS3lwyHxTU733ArocXHpWHyDZf18ifZ11w?=
 =?us-ascii?Q?0E8LiFmvlv9p8FZzhk6ixdnlEnj3ZCzluqE9jKy59CUuEJhCxoyRvwSdnnqv?=
 =?us-ascii?Q?/Epsojcmr2c+Dok69BYzeu+qARBIwokeKSo2R20077P5r+s+8aMZl8ikcc8X?=
 =?us-ascii?Q?5Dvg4SBeYNPm4/b2W0rWykjmAOzJwcRIAG18SE6q/YebzNshZDFc0lR87Ked?=
 =?us-ascii?Q?og0TUcih6OBfHPdkvfvjTXOgj26ikHis1zypXKjFZ2kGDKdEvVWQZETd9uSE?=
 =?us-ascii?Q?VLJ2P+Gt7CLjMTrUStUn9Cj+s7IRM4c1n76DbTWlDGwVjStZSWAC589cChkY?=
 =?us-ascii?Q?EXuFJGlgvp6HuBLN3UBGafiAkngdn5HZUQeIIzUj6FxvD3LkqH8dz4AdqJTX?=
 =?us-ascii?Q?isEwc7uauRUg2OMlioW2Z0pd+jeihR0eJ2VCTM4K/PJWPKrCvqRKZwjjBJCA?=
 =?us-ascii?Q?ekODjiTN74ZcUx4mhIMtUEWQtQRK7QXI1NA9RocinP2ER0ioHIb9MxydybnE?=
 =?us-ascii?Q?8X/HxuR0N+JZo16yaiQY7MGBClr98qCaAFaKiwV6MYPce9bKyK/kmIlEo3kT?=
 =?us-ascii?Q?P+mx7BxhWRSL39QLe3sBGm0jVUTQVO2BaBXyRKjC2C6GDoHlvKb+KHy9wgFZ?=
 =?us-ascii?Q?8lAjVdsK65bQe1169o4VYRzGQZ4exKKryi0p3s3s42WrTbfzHezO1OjsvLOC?=
 =?us-ascii?Q?i8qd9c6pqisRtC5oo6Z6f9nqGhrQjPqMwqT2vF8a1btPGBzVpAdnMgQKRLjK?=
 =?us-ascii?Q?BoIgf6Ypm4txa3pgxEtdNQENX9LjADNy9KYY/T62r0BZlzjidLkV1mptfGOp?=
 =?us-ascii?Q?yOfBguVqNMrh4Z947mfMYAvDyi6IYj9EDxhr6LO5tOXylAXln7yOzOYL/OHC?=
 =?us-ascii?Q?m/BWdGLnoGNNGrZRMaRCkZqG0yKkP6/gFZlXklXuoS2OSIK/HUN7fNaLKUN3?=
 =?us-ascii?Q?9oN9S28npJrL2XdwvDzZ5NzwiMjzr3plLkO7r/qg83iWkPlAVIzVrdBDYAX+?=
 =?us-ascii?Q?gs8BYGEj9DblhGN5KhSPuFmFYyBwJJSBb7RWghcWkWfX4v+BlAMhg8bd4QmP?=
 =?us-ascii?Q?NuWGEI5S0cBWM+CrWuD9qQtXA+onegrhrnL20X2UJHF3NmEjXB65jOzmhT6Q?=
 =?us-ascii?Q?RC0LX4NKiiSM0EbAl9X05Y3Y?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa928b5-5bcf-421b-d3b9-08d92fe0809d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:32:32.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imAqgDYo85y+9dPX8h0IYkBYamAH/l9jWOXGGMfBlXzm6CBy/9yhUvbhRUZq4e01a1lFoRNwTrNuU0bnWzXQ/ZB2KFHKGkCxsMchq8JO8pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1235
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=QF1UMZRl;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On Debian 11 systems /usr/bin/python will no longer exist due to the
deprecation of Python 2. According to [1] the unversioned python
packages must not be used as build dependencies, dependencies,
recommendations or suggestions. So moving to the versioned python3 seems
the only remaining option.

[1] https://www.debian.org/doc/packaging-manuals/python-policy/#unversioned-python-commands

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/arm64-parsedump.py     | 2 +-
 tools/jailhouse-cell-linux     | 2 +-
 tools/jailhouse-cell-stats     | 2 +-
 tools/jailhouse-config-check   | 2 +-
 tools/jailhouse-config-create  | 2 +-
 tools/jailhouse-hardware-check | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index 9519eb5e..c695706f 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 4178d4e0..6d1743f3 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 2f7e9661..4c5289fb 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 5294967e..62db24c3 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 3005c2e7..2095f4e2 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index f9b2cf58..7a41b48e 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615093225.162909-3-florian.bezdeka%40siemens.com.
