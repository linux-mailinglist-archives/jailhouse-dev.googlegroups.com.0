Return-Path: <jailhouse-dev+bncBC44VTVY2UERBDWSTWCQMGQEIIIZM7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BD38C132
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:02:23 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id 1-20020adf93810000b029010fd5ac4ed7sf9126678wrp.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:02:23 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584142; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hawvd+wx4HEdITYiGybXYEa1S9wD0thXQ/3yGjDIaZnv79+MIqbAzCpqsxnRxqg8Zg
         suTZYURNdOIgBkYnmcCOwIi5c/F3CGTQ10Ft5dPO3BzWFstLKC1VdTHCf70tFQ1hKkEo
         hBI2M5drBcRtc0COAgaFHM9RNvRbGQxX3vt3vkUGDR1nYHoQzed9EWB7gbhHDN9c+2wX
         +e1NsdcQSFCe/YgoxS9GbthOWI1pmyDk3+PdKN8GOWDh0CMb6o69eMuDZ4UmgXZCu6Qo
         uXJsjZ7kPVXRnUwtZWKOjjtCWZRtEvnWIoMePI7FTks+la7kuSAuptRFo10ASCOLti18
         y5WQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DZoDGnKDyaKjIrfoyE8fvHvHYme69fdx+cYJHt+5G7Y=;
        b=Hb9rgolPpW3igUvP02asCXRDGj+DPDCL2t1TKo/Wj1SZN3qsxP1OaoDg/qyY3lKaJs
         wL5wp4TH7qv95uxAebTG1RImB694aPZGTIlOFNFbCkcLReNqLfYRTmMpGjszEC8pbGeG
         WJTfRzInsTkmy/QQPniKjB0vqYNQ079ktGd56dWYKuoIRX3Lv8V7eLSPbZqfOOOM4GHr
         3PI69fJMrqm2kO7bzw3Qkz6LwMPnzp0cNS8Ywp+M8XaMk9xatYK/lkhvry9os2PluOfS
         cPfm2WRFO69rv6BtUDWolBM8DZMbWEmxX0WTaXNh0S7GEgf7YR1KUmynoU67YKJzBEzY
         rjxg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MSv1uBXV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DZoDGnKDyaKjIrfoyE8fvHvHYme69fdx+cYJHt+5G7Y=;
        b=PqzEBK7rZQVAkJNwBwHyRQDanA8CA3Ho5E9vvWoKGkuUAUrq1GD049RXGB2DKr/97I
         zmWFJ9zN2VlMW6nzAbReo6MvYf0fpV4gzxQX2Wa8Cb2Oq6o+iXJtk+kZkS9VR8q7stzu
         e7iGUT2aumXPQv6paf/boXWyEHrexcgAqEO7K5221LiDOmcbIbJbs8MOFDTgiDRel6u8
         3AodEOe+KN5JKSLiJ96uViocDJrJCzlj1Pd05T+XiGmavuWQv8519x/YUu6D34eD5nCH
         NKFhZk4ErHVwfFxrfWJY0RqxUYRMKH5vpkvYb3LKOKtxTV8YszWYcIw0A2fn+i9mYm8Y
         eOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DZoDGnKDyaKjIrfoyE8fvHvHYme69fdx+cYJHt+5G7Y=;
        b=MiIOcWSxo88YdxEmEM7n/RSBDKui2lw79sgFkqu7+BNzTAFbAbNPvFeQLOjrVvj1QO
         zuQA1u2cfHtOJxm0FXdRrv3lwoC+XGwEF41ly2YJiyffFGZ0I+5jcDSpYqCOCEqp+xrc
         GAGiOLx76z470djw56+d6rkKYl1I0pNpHRCEMSH1IcJI+fxAPEu2W7FCFV2G6wJP4wGD
         H51Grg0xT4PMHMiwcRWX1QieBEwLBkEK301TpOxdojBq5lKJXRYdWM9NXTESdavZlo9Q
         9JzEkOrwEeYQDaDHWYXEUCKx9EbVNtTMCx/jElvt+LLPCDiDV8scww/FzQEt/Cp2FEDN
         wcmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ae3W/7MITF9KAgYOYOUS/lpn1lo9DU2sQjepMzwBDT34V8ZML
	MGyU7idL5ggt2ArS9CT8cXo=
X-Google-Smtp-Source: ABdhPJy1q91I69xXH15KR4XAQCZTC6AVSLv6FsCHl3JX5tv7g0QcdJ140PtpUgfcIPj8PK08Dchkxg==
X-Received: by 2002:a05:600c:4f15:: with SMTP id l21mr7379389wmq.37.1621584142805;
        Fri, 21 May 2021 01:02:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:2a8:: with SMTP id l8ls3326537wry.1.gmail; Fri, 21
 May 2021 01:02:22 -0700 (PDT)
X-Received: by 2002:a5d:6d83:: with SMTP id l3mr8171669wrs.241.1621584141976;
        Fri, 21 May 2021 01:02:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584141; cv=pass;
        d=google.com; s=arc-20160816;
        b=NobgMuH20Wv2yLjOHQsJJ4XO5SGvO0+Yx+ZSxbGXg0d5opzzvdEcYddbKcjD4xB21H
         4uXkwwwAqJHDycEuz7q7P0mZrGBmpQjzeIkYQJ8hfRpIhcqZso5Hdg82QarWmS1LGFuE
         s5AzNmPd60vpS/2CYx81yZzD0Yv4+j3yiMXNQn1JNDtY1L6Si3VVap6WdZ9rxBMgRjeC
         uQfa6OgF7BbR922kNG8F0sEJEG/ukYKn1eqgRMnq3OqfRn2EAzEVqkEO5V5YDNWKQuFI
         Z7Qc35g4RIcnZ2puKHGkAg2dzV9Md3vHbaTOZ3tqk9+wE+oqmXs6HO9Pw/SR8uvsZVH9
         //3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PIKF8caX+djoSX+mlhjZjMVnL5VM571hC7PiD1+MVm4=;
        b=npyRD1O4nJSDuR8yLuOm1cKnmO7ucx25Z5TgO1lZEKTAWW+Nw3V5qns0pm8icPKpYA
         ng86nK9wmgqRdMUZaqE1LiIGp2QEA2Ozm0i3fBJhFaY3EFHOjoOl3nkka6hu9i8UV8sQ
         Iik8xxxdCsoWhSNsPspEcIHHaylHVqZTc0uP7oNdWhjCVM5tqnhC0EscZF33yMaVGVH4
         GEeJF15ODKaB1bYae4byB8mBZPOQsjuB+pylUywKgx8z0z2A7nxyM1vdlThzgwLabpA/
         dH65Qms0LZOwPDVsaWSGgu2FuD19KioeZgr8p8V8cOvzif/KOBm5IR2tlDsQWUDBH+je
         WA0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MSv1uBXV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com. [40.107.8.83])
        by gmr-mx.google.com with ESMTPS id z206si363812wmb.1.2021.05.21.01.02.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:02:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) client-ip=40.107.8.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJmODWhcaC985TIAQhNz52tMOtM0ajsLeiiRrCrmoCoY6JeUeckTItpP/Tk6kn8v6w6PK7PqPuJ+zUNN0EJyC0bp8ru0G4l1nwiTH6sfI3QHJkdnbbxVFcweRgEsvOrBcKsuxE8C0FjBruLSwxPEP5lBhe3ApEunoQyX4eRUuQWHD9GXQegvrHy95z7sdIXro84kPizKMKEG8vTO1nOQNxNDD44oSbju7MuFrZGdEqsT2zeby33SOQJ0Lo+cxRHMvgc/FWXZ+v+9GB+O+c8tIyfYKBp/RXbmUEpzcofy+sZU9En18upHp7mPRTz+WweFacomtC5dOgiDP8FKs6doug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIKF8caX+djoSX+mlhjZjMVnL5VM571hC7PiD1+MVm4=;
 b=CJxzlrmGqpWUq2soQDNZtc3fi35tnNtuwKHN/AZCRrTdHfCKd9VmZ0wkchp3OzMiUW3BSXseD6oXGomQKsAG0OAkxmL8fTLTKdTlI3Y0gNfezh76nuv7aXmuhzH5BjsT2RZxV4eOdJ6cQKtpxQnfzKwLGt6lVYGwuxMbm3GjcUSY116mGS/OHXpvn7qskJ4V4mXElq5psv5e5gMz0Jkn/pAHbfe+Ha8gOjYZ3uOzliyLuya1nck2EcpFESyFwmoBWNfkuc15CS1/tEq4BneRaoMi+OMDYOZ9sQfs3fgmjcbi351paE0waLG1yWQ6+QE/u4D1NPfcSIwAKeVXg8Ic3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:02:20 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:20 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 2/4] tools: Update shebang from python to python3
Date: Fri, 21 May 2021 10:02:09 +0200
Message-Id: <20210521080211.487380-3-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR06CA0160.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::17) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR06CA0160.eurprd06.prod.outlook.com (2603:10a6:803:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:02:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa15c466-4f76-4c68-457f-08d91c2ec260
X-MS-TrafficTypeDiagnostic: AM0PR10MB2418:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2418A01E9E0A3CD47ADA7257F6299@AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QD858AEnaNKd2ITD0vfyundkrrPuitJomdjMS+0Q0SpenygqWdJvruycTFAmv9Fcz2NPUye6AUvMCfvUeXY45oWFfdP4KVRJZjgYTpzTxFcvj6Y6FbKwd6Jk+ky2iFrUnhNv2k1Eoq7lwDGQd4gBoxeQxJ2fOVR4h8OBfpU7+mzcRnV25LCL71OB2FrcVz9ywgcSPW3yj0Y/g9OMuYSiaJJy0gjXCGt64CwNDaP74bs0NPV3xnB7tDTW/kzc1LLHWZNBwtPV+7xfsOAjoQK3KrBO3l45itFcsAswb1XAjCJEWMyzKZrZG0bS8oajbkD547sxv0hM8akXnXfrEKeXkS+x9qN1ImVECuRFCKIZbPOD1NlqqrfWDO3NBBBrxR3QK8+UIhzPXwSLi/lq/Iei6T+Eyzs1xN9CniM6vOmM0+U/3H5BA4EgPZkUvmq4Wgc/MpCQi9JPNVEVSaa9/IN+VDGD8DyBLCpR/C31ducM1GwfYMBpLwLs+eJtRMmANwn7qXh1/Td8f7fTuJ2URWIg8hWa2tnLJIa723W+QvoilKDhNZL9cZvwV54MwUVFdGwW+ie2HrsCmEIasa6uWpaXA8xA7/mTsXrMecSLjDz6G4lK40i5QxQcYSe+T704AgmAuunDHdzwgwxcoa9bVa+pPY5hVUXhZHnIXZzrzbLRXMwK8qOWYVjMvww0GFWkdbNPRLsmjg2x2kTO3t/tY8A+SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(44832011)(66476007)(66946007)(6916009)(5660300002)(8936002)(6496006)(107886003)(966005)(16526019)(6666004)(2616005)(316002)(478600001)(2906002)(66556008)(186003)(8676002)(4326008)(86362001)(38100700002)(36756003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YZtjU9AGKhTqdsqwKD/wu7n4pRwPe+rXPmOQbg0f8vdkL8rUUizUhxguNFIf?=
 =?us-ascii?Q?dE0CTOYapYPSprzposdBUP5RD2Ljt98RB2H9PHDZllU4ECz9yOLRWeIw7xGb?=
 =?us-ascii?Q?M194Qa//AF702+a7A9KOSq5OqjTbCgdfbb0wm2TiGVhUAXYNRe/mUnXO4SZq?=
 =?us-ascii?Q?6uq8heiQWy2izIpdZuxUBZB2ExFUF4uR8ZF1JN1eH9mh1EmJ9JfCf5v39kmH?=
 =?us-ascii?Q?DE8pkuGAoco1Wr1Hx4Z++Qyh1D4Lpj9mxKvVkSlQFeci77e6/9PF0zK+SlVl?=
 =?us-ascii?Q?gY+cnbd9HRCNGCEMlewOEv2S/BKT1M0TcWpco1tL46SXbLFyxC4FuaX6ZOiQ?=
 =?us-ascii?Q?Lcv1hs86FmysIbuH8PFF4XBQ63N1TmeDBSH6QzwgxOfar1EJck95vycJ4N4m?=
 =?us-ascii?Q?gLiGxWdFbocDibXn9Cm7u6j49hHS9VuzhG/UgoI1RXLw8TRh7DjH3JZO4vx7?=
 =?us-ascii?Q?BNm7ByA6FFkIri2ViitbBE4sJd94EjU+soJOvDfeT2G7txpgWPF3yBzWrqzU?=
 =?us-ascii?Q?cOCeABsN7+wrI57oOekoOPOT8UfQ6M0nNx18xrJ+///V/708oKeuf7S6W9bG?=
 =?us-ascii?Q?Kzg8gJEJAsI8LwYU2PBLcPnL8AEk0+1+f2x45Z1gMSn3Hk0L/7K8j3TSpbdv?=
 =?us-ascii?Q?1i0HiA87FTgZpaMaU9pNcZGevaShjgWPNCHE1XPhBnigbfblB8aAloUpAyRi?=
 =?us-ascii?Q?miEZlqG0sI4iY04VOHI89sJuZcNsry767nhlTbQnwFFntNAkXTvHiFRVqKrZ?=
 =?us-ascii?Q?8rAEsfjqrgBSLdMvtf5YCnk2xuMJ53+31tSRV9wfyTK1VRTw92vIdVakezRx?=
 =?us-ascii?Q?UhVYrAB9bJqbtEsOlQst2aH7wgp5rMji/pglvOE5p7BZ2GzRGTUQ8VTQQQC7?=
 =?us-ascii?Q?VfDtj1F1/k1VKlYiZkGe+DYop8+DVl38MwIVo/h12VrNZ5upE2EegLRaMBAS?=
 =?us-ascii?Q?N9f0JB9H8kE8Xti1bxg4XHFPScn/DLcptxKU2olud9rNTGv/9xBSI6xS0bCE?=
 =?us-ascii?Q?AoCd2KUcN3vSCz2T4Ti7dnnZFDeUONWl/zA/PkwDK/0WoTnYEEeG7MsZGidi?=
 =?us-ascii?Q?8/EtQvEoiqNWEVOw5pBDOO2dXxWmsiiAheILJnyovnODcGMgRZQHEuCOYPPr?=
 =?us-ascii?Q?P/r2OFM2hvisv6Juf0CodZU69vpHDU4LDsziRGeljmCYbk3Sd8YICGJJTLCL?=
 =?us-ascii?Q?NzV+vl5vP1u7nX9UwfnJJb7WTrYsOzM1hApmPVBqNhKmgJzKPu11od5rP+nH?=
 =?us-ascii?Q?UT35nH8IOhw5MNYiA/fYWGA+SGSGy/NnZ0yTfgxKfJOTFBqTLgSoZHf/CHO/?=
 =?us-ascii?Q?yXyRvXdjXu1LvUGQJ9j5SiQ5qCjbPfBuj0AMromFJHRHfmfBNXdAjH+49T1b?=
 =?us-ascii?Q?FMRmUISn13RaU2vK9eH8ePblQL3f?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa15c466-4f76-4c68-457f-08d91c2ec260
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:02:20.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNctDXIHwzs8bnbeng8NlOs72Yuwm2HakjRxe+IjhSZ9KWupXeuAQa8zztjKWNGqUP8HkuMMfbVzFoOgCinYtB+sMKTqmWdSiDFnUxacAWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=MSv1uBXV;       arc=pass (i=1 spf=pass spfdomain=siemens.com
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
 tools/jailhouse-cell-linux     | 2 +-
 tools/jailhouse-cell-stats     | 2 +-
 tools/jailhouse-config-check   | 2 +-
 tools/jailhouse-config-create  | 2 +-
 tools/jailhouse-hardware-check | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080211.487380-3-florian.bezdeka%40siemens.com.
