Return-Path: <jailhouse-dev+bncBAABBXEGQSFAMGQEQ6FM3UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC340B8DD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Sep 2021 22:17:33 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id g21-20020a17090adb1500b001976416d36bsf2130948pjv.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Sep 2021 13:17:33 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1631650652; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gc0ABmJ+LBd0Cw56nHwUo9wl/ovIE6uxi2j+9KaM6zuFFgbaBU5sjntMsNzCML+zUB
         6OA93hPYGKdPcw0RVO4AT5tIZdqSaF/9tM9bHbnxeNrOU1ZZ4SsrzFckgmol2iI2kJzg
         Ud8b1PGeUdkk1dgZ1LVxoLsjcHRmGYtN3ePswFW5Ub97RGYpIKnglAm34GZ5gC/hY48q
         Vrcp1NyLBe82mBTWcc1PeFosm5dPhylo4GpebH6zXLgGGPYVNeoiniRw8nWo8ilFugqS
         +Eha/UxYTkKhmv6S4OZos2qfEnqVb9heeSWPrkx4wfJSZYVJylfcwiwc7k4r4poj0sMy
         JEew==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:subject:to
         :from:date:sender:dkim-signature;
        bh=dlEbbLDfX9LxIYtt8VwkkS0grXv1tk2pzeTxIsuGMY4=;
        b=j37RP1bG8UHjzKnrkWpQbHIHIAivaNhsOeLU1OifaObGXB7CAsT9aZbMQ6d8b6o3gZ
         6udf7eh/3MILlMII8PGl6rntGaUnnXEirLt4ZBOEUU959wQsEB5ggEnhdHPzVQGHDff+
         vuRmTEpLtLuWMGCPP7RYit7cvDpWwhzob4ZzyGv2T+YQgrFBge3/wAq0yz767WM6jiJ0
         RG0863PRG6p/FrVqEF80K+fj3WQz+5W4CemZX+yEKwsAWpNZr2ix/dxpUe+jmFFrmoOl
         chuZpn76rvvqE697/7STAip8+G/c3L2OlNqhzrky8/kfaKr8u/dJ9/enGSSDLJfJqC07
         stBw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b="q1e3Sq/c";
       arc=pass (i=1);
       spf=pass (google.com: domain of bwvnfcp@hotmail.com designates 40.92.253.11 as permitted sender) smtp.mailfrom=bwvnfcp@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:subject:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dlEbbLDfX9LxIYtt8VwkkS0grXv1tk2pzeTxIsuGMY4=;
        b=LWmdQu3IMHMdBDD4FVZ5d8Fuy9h3i/jDBDnCNfJaCLKuX22q9BN4T80t2Go0qnZ2gQ
         EPlPRaZv277N6QWDzBTElrE0d9PnswH6i5JZv8EUi7qLm8ANadxbPMhNiWzPfreXLHjG
         qJqNjws+fDQgLVHgxZncfluNkt4my/BjKmTcXeU3ccAyOcIh7tXGEqp3C23b6bKnA+vX
         klyukucRYXNkXPis1TBNPIaz7hYcPzfjnd0a7QPjVT//Ye3aVo1vIK11py1+ZUs0f2/p
         cRVrRW2O4ABCBfhQiN96+Fdj3tidrOhWTaERZXgdhKtkew1rGytWI7o2rNDcEEjSRSwe
         Hteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:subject:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dlEbbLDfX9LxIYtt8VwkkS0grXv1tk2pzeTxIsuGMY4=;
        b=xhqU/s1st4hB9jl+7YrdVKDHSqcThNFyDeHKDYQrGgCNzYgaZS8tCgvgqt+Qis34L6
         92965ZzYkKosPMito3zPCgGfv1Lfk1E+wT0c5C5OurUe5cQQCnEuxYkLfRD4F/Xnq4qz
         GHgUsqm6KKJG17e3d6tJokgBQ1sJ/XiRlTvswKGXLrz55ODmbjgRbJ/gjmfpLyB2SLVN
         zGOeQhAu2zuUeJn0ALTVsJIPfoKo6+vTFZpQd3VaGLiekSjaWJHloO8GKAiEuo52VfWv
         yo20YA3aUtrtelok9QV5Vru0sxF2o09WaQ+c/RrYQLl132/lDWarZ+H3MpDyuOMyVXGn
         uKeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Vd1C7ehwqZVc9BECOryzQGgSN2+SsJ3S00mqgb5nGxEW6iPQv
	1xf9zUGl3AM5Dtbmv+dhaG0=
X-Google-Smtp-Source: ABdhPJziF9WMm/0qaH+f4FRxniUZUqPWZBjTb3bzeuueXCuvZ5z2uWdeOrDGLZACOOC5OaqB60AgmQ==
X-Received: by 2002:a63:517:: with SMTP id 23mr17043272pgf.245.1631650652412;
        Tue, 14 Sep 2021 13:17:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:2c01:: with SMTP id m1ls3429pjd.2.gmail; Tue, 14 Sep
 2021 13:17:31 -0700 (PDT)
X-Received: by 2002:a17:90a:af92:: with SMTP id w18mr4108317pjq.98.1631650651735;
        Tue, 14 Sep 2021 13:17:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631650651; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wnznp4G5yecbadXRHjzV1PTB71qfJxsDwRWtRIyLvaH689N/AuIT/tBMGYmKBRp4Kd
         vgVpWhQazD4h44zp1bPm51xyfsZdQZI33a9tNrH2bh4SNK6duEcjnpFvqpKfQqB1dO6s
         uiWgA8ZLSMnaEb+IA758jhbMkH8iKgQC5MJ1xgynpO61imQsrR0Xeo7xfZA6KwBVwgIm
         V4gD1YDEIr11gkDFa3lmAxOID4ryQHi5Iga+a3nHFsPDamjrX33nDfON9C3DI7KngdKV
         G5D5L98Uoub/d8aSE3tbk91iLoLswwLyOG3bT8oZxoWgcJ9T0inq05F8RQmG8ME/KJXl
         SHUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=sUNLbbK4RSOKBwGggP40RtTiOliIO3mON87JKmP5zCg=;
        b=GCa90bLlI4C1O+ksXVRCEniLA/jNWh1n5LO6n0DlHkaN8NIH4lcoxt83GzVI8D7OHU
         PwD/eU3f1IRXXX3kzItzcPhIvOMtbFNeJ7aK/uujNPf5PVMOdV698KZm9cGJNqA15sLo
         kwPKaVDXQt1m5fDuVSbUFzBj+DPN8PCzq98UTQ8CCGmzOuZPY3DSTosR2t6UNECM+pds
         1I1CJENscQQkSCX2NYTqpy00YCfkPvYFKLEgmjpPGbTWWZzI9AENSzvIAQU3hh2VYxpk
         SLZfyOzUoiJroPGaECuPV2WDU5l5JnCHBxHaPUuBZs2ZE8LgnyYCpFvRzK4i+CmsChXY
         U6Ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b="q1e3Sq/c";
       arc=pass (i=1);
       spf=pass (google.com: domain of bwvnfcp@hotmail.com designates 40.92.253.11 as permitted sender) smtp.mailfrom=bwvnfcp@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-oln040092253011.outbound.protection.outlook.com. [40.92.253.11])
        by gmr-mx.google.com with ESMTPS id u127si1165130pfc.5.2021.09.14.13.17.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Sep 2021 13:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of bwvnfcp@hotmail.com designates 40.92.253.11 as permitted sender) client-ip=40.92.253.11;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVFcZY4h3KCnVV8892gPKHHnF5nSvs0WzncLQ/M0JGhancMFDIKWPoh9TolbPFZaOE42cnMMipTQQjhVd12uMN4wQjFD9Lk7L5cJYoA1bqfGczPcWQeKWhZGL1Xqqqa0MMBJ5NAkCF6MFIeRcgGsWrJ7SvvN/DhYiUfu+5OybzFEls+PH38EsEQz2yFirGR/885t64cCN6zxIVY1/W3Nr/zS9ZaX0I3KG8kdATNJyPZiIyXlPHH9Dli8Rn/o/NQsUfw0PQUhJHCCjT+WWnAPg9JAoyokQJxZQKmSKDrpwtYlTfWBxiVRwdLksl23in4vYnHXkxlisYaaCuorg3MXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sUNLbbK4RSOKBwGggP40RtTiOliIO3mON87JKmP5zCg=;
 b=Xs+FwLZYXrLXpYiQ3fDxVVxuKqFFFUnX94jy/lYjXwhw/8mmhSSEaB2Re3leWzeWeagJziFBO94TRtYndCj6UgG88eqQ3+/AE2GzIs9ok/XhqZqfZzSrT13dvW5dGix2ePUYWt7wo0lxwLyKQ59ipVy1vdmyRcXZwflwY0wZXt5nNobCzZLPLpZwoWCw9rEwWSBgnDk8+nsVJFZn6n5HSrrJlwYDWQ4GuSo2gtnAlX+UPujYtBMjGc9Pst8l3cUGSDO7XhXY5NcdVWsowCGIOZw2PM8ZLehDHb6QyjMlSzmOO1ivtq1pKrMfl5OKd6UEId0RzMgLGRNxrigOrrCY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SG2PR01MB2411.apcprd01.prod.exchangelabs.com
 (2603:1096:4:4f::14) by SG2PR01MB2030.apcprd01.prod.exchangelabs.com
 (2603:1096:3:1d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 20:15:51 +0000
Received: from SG2PR01MB2411.apcprd01.prod.exchangelabs.com
 ([fe80::70a1:f09c:ef52:54c]) by SG2PR01MB2411.apcprd01.prod.exchangelabs.com
 ([fe80::70a1:f09c:ef52:54c%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 20:15:51 +0000
Date: Wed, 15 Sep 2021 04:15:39 +0800
From: eiqmeep <bwvnfcp@hotmail.com>
To: 
Subject: =?UTF-8?B?bHNxdW9XZWxsIOengeWLn+acuuaehOmCgOivt+eggSBzbw==?=
	=?UTF-8?B?IGFuZCB0aGUgaXQ=?=
X-Has-Attach: no
X-Mailer: Foxmail 7, 0, 1, 91[cn]
Message-ID: <SG2PR01MB24117CAC388917DCC21F78E4B7DA9@SG2PR01MB2411.apcprd01.prod.exchangelabs.com>
Content-Type: multipart/alternative;
	boundary="=====001_Dragon673304507140_====="
X-TMN: [TZMSgiLs0wBqm8ha2fvFgoQKymwDsr0w]
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To SG2PR01MB2411.apcprd01.prod.exchangelabs.com
 (2603:1096:4:4f::14)
X-Microsoft-Original-Message-ID: <202109150415476252076@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tqapca (59.63.100.221) by HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 20:15:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92898d68-c307-4e30-cb21-08d977bc7001
X-MS-TrafficTypeDiagnostic: SG2PR01MB2030:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSTgbsSzwE3wBmDvveWfsCtzP4NPHYFgAkH9nwZvgpNXgNXcl8U0vkSmP0Dsb8l8dwXjj5e+/i0cUnRpz3Fv+ZhOB4mBUvPYW1UCmLVvmC98vJOjDGKr7C/guBfTXAIBWcnAbhBQOjyPVgkwsOeM+lTNig3SiaxCkYkO/dA8vj1wP6rUqTn7HlGY3j6DmLicRi9mhvNNCqeySIEy+02gXW1jq6yPBYATC4Ah06HeRJsDmZ49nsXg+IyfZ1HSjGot8zR6X2VUXm1LHCC+QZyeVhqx82vEoVfx2z0J6y6m6pAPTv0C3Gszh5YTyARM+Fi9Pm+fj5Az5QvRcXa+OQ984FVNrs4EMk7CP7EZ1vN3pyUXtaAa8q3mHixipP01Nfv0Rox6c+3yFxz38iUz4rmZmxwGpAW7vWbkOYBhrlzEnBP7wF3i2VsCiw0GWc2Rg2B8
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IhMOAIzubtFmAsxMzv3PqkxqkZGfA7Swb/gjGvGg1ktRqgD58Qbc3hVZG2NihdYCYWV+BW0SxyzE/wbNccEDRouU/Zd32mC1srUTItMhC4yXdLxCCleyI2uJp6NlN0J0AVDu/1XIOL/9ncyQyc6Huw==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-5c337.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 92898d68-c307-4e30-cb21-08d977bc7001
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2411.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 20:15:51.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2030
X-Original-Sender: bwvnfcp@hotmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@hotmail.com header.s=selector1 header.b="q1e3Sq/c";       arc=pass
 (i=1);       spf=pass (google.com: domain of bwvnfcp@hotmail.com designates
 40.92.253.11 as permitted sender) smtp.mailfrom=bwvnfcp@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
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

--=====001_Dragon673304507140_=====
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

DQrmgqjlpb3vvIENCuaVneS6uuaYr+engeWLn+acuuaehOeahOi/kOiQpeS4u+euoQ0K55uu5YmN
5oiR5Lus5oyB57ut5byA5pS+5omp5bGV5ZCI5L2cDQoNCuaguOW/g++8muS8mOi0qOeahOacjeWK
oeS7peiwi+axguaIkeS7rOengeWLn+WboumYn+eahOmVv+i/nOWPkeWxle+8jOWQjOaXtuaIkeS7
rOabtOazqOmHjeavj+S4gOS4quaTjeebmOS4ree7huiKguWkhOeQhu+8jOS4gOebtOenieaJv+S4
uuWQiOS9nOS4reeahOWuouaIt+aMgee7reWIm+mAoOaUtuebiuS4uuaguOW/g+OAgg0KDQrosIPn
oJTlm6LpmJ/vvJrkuJPmlLvkuIrluILkvIHkuJrlr7nigJzkurrigJ3mjpjlnLDkuInlsLrvvIzm
g7PopoHmjJbmjpjlhbbmoLjlv4Pmtojmga/lv4XlrprlsJHkuI3kuoblt6jlpKfnu4/otLnmlK/m
jIHlkozml7bpl7TnmoTmtojogJfjgIINCg0K6aOO5o6n6YOo77ya57uP6L+H55yf5a6e44CB5YeG
56Gu44CB5a6M5pW077yM5bm25oyJ54Wn5oiR5Lus5YaF6YOo5Yqe5rOV6L+b6KGM5pu05paw5aSH
5qGI44CC57uP6L+H5rK755CG57uT5p6E44CB57uE57uH57uT5p6E44CB6aOO6Zmp6K+E5Lyw5L2T
57O7562J5YGl5YWo5pyJ5pWI44CCDQoNCuaTjeebmOmDqO+8muWcqOe7j+i/h+S7peS4iueahOWk
hOeQhuWQjuagueaNruivpeS4iuW4guWFrOWPuOeahOWunuebmEvnur/nm5jpnaLnu5PmnoTliLbl
rprmnInmlYjnmoTlrp7mlr3kuqTmmJPmlrnmoYjjgIINCg0K5pyb5pyJ5py65Lya5LiO5pyL5Y+L
5ZCI5L2c77yM6ZmE5Lu25Li65oiR5Lus5Zui6Zif6K+m57uG55qE5pON5L2c5pa55qGI566A5LuL
77yM5o+Q5L6b5a2m5Lmg5Y+C6ICD44CC5aaC5pyJ5Lu75L2V6Zeu6aKY6K+35LiN5ZCd6ZqP5pe2
5LiO5oiR5Lus6IGU57O777yM6Z2e5bi45oSf6LCi77yBDQoNCueJueWKqeiBlOezu1FR77yaNTE0
Mjk3MzUyICAgICAgICDpgoDor7fnoIHvvJo2OTnvvIgg5re75Yqg54m55Yqp5YWN6LS56I635Y+W
55+t57q/56Wo5bm256Gu5L+d6I635Y+W55uI5Yip5ZCO5YaN6YKA6K+36L+b5YWl5oiR5Lus5YaF
6YOo5ZCI5L2c576k77yJDQoNCiANCg0KIA0KDQogDQoNCg0KDQogDQoNCiANCg0KIA0KDQogDQoN
CiANCg0KIA0KDQogDQoNCiANCg0KIA0KDQogDQoNCiANCg0KIA0KDQogDQoNCiANCg0KDQoNCiAN
Cg0KDQoNCg0KDQpXaHkgdGhlIGlzbiBicmFpbiBjb25jbHVkaW5nIGZpdmUNCg0KIA0KDQoNCg0K
DQoNCg0KDQoNCg0KDQpzd2VhciB0aGUgcnNxdW9zIGluIGJlaG9sZCBkYW1zZWwNCg0KIA0KDQoN
Cg0KDQoNCm9mIHdhcm0gdW5kZXIgY2FsbCBmZWx0IHN0cnVjaw0KDQogDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCml0cyBwdWJsaXNoIGJldHdlZW4gZWR1Y2F0aW9uIGRpcmVjdGlvbiBjYW5vZXMNCg0K
LS0gCllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQg
dG8gdGhlIEdvb2dsZSBHcm91cHMgIkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4g
ZW1haWwgdG8gamFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgpUbyB2
aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L1NHMlBSMDFNQjI0MTE3Q0FDMzg4OTE3RENDMjFG
NzhFNEI3REE5JTQwU0cyUFIwMU1CMjQxMS5hcGNwcmQwMS5wcm9kLmV4Y2hhbmdlbGFicy5jb20u
Cg==
--=====001_Dragon673304507140_=====
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keT4NCjxwPuaCqOWlve+8gTxi
cj4NCuaVneS6uuaYr+engeWLn+acuuaehOeahOi/kOiQpeS4u+euoTxicj4NCuebruWJjeaIkeS7
rOaMgee7reW8gOaUvuaJqeWxleWQiOS9nDwvcD4NCjxwPuaguOW/g++8muS8mOi0qOeahOacjeWK
oeS7peiwi+axguaIkeS7rOengeWLn+WboumYn+eahOmVv+i/nOWPkeWxle+8jOWQjOaXtuaIkeS7
rOabtOazqOmHjeavj+S4gOS4quaTjeebmOS4ree7huiKguWkhOeQhu+8jOS4gOebtOenieaJv+S4
uuWQiOS9nOS4reeahOWuouaIt+aMgee7reWIm+mAoOaUtuebiuS4uuaguOW/g+OAgjwvcD4NCjxw
Puiwg+eglOWboumYn++8muS4k+aUu+S4iuW4guS8geS4muWvueKAnOS6uuKAneaOmOWcsOS4ieWw
uu+8jOaDs+imgeaMluaOmOWFtuaguOW/g+a2iOaBr+W/heWumuWwkeS4jeS6huW3qOWkp+e7j+i0
ueaUr+aMgeWSjOaXtumXtOeahOa2iOiAl+OAgjwvcD4NCjxwPumjjuaOp+mDqO+8mue7j+i/h+ec
n+WunuOAgeWHhuehruOAgeWujOaVtO+8jOW5tuaMieeFp+aIkeS7rOWGhemDqOWKnuazlei/m+ih
jOabtOaWsOWkh+ahiOOAgue7j+i/h+ayu+eQhue7k+aehOOAgee7hOe7h+e7k+aehOOAgemjjumZ
qeivhOS8sOS9k+ezu+etieWBpeWFqOacieaViOOAgjwvcD4NCjxwPuaTjeebmOmDqO+8muWcqOe7
j+i/h+S7peS4iueahOWkhOeQhuWQjuagueaNruivpeS4iuW4guWFrOWPuOeahOWunuebmEvnur/n
m5jpnaLnu5PmnoTliLblrprmnInmlYjnmoTlrp7mlr3kuqTmmJPmlrnmoYjjgII8L3A+DQo8cD7m
nJvmnInmnLrkvJrkuI7mnIvlj4vlkIjkvZzvvIzpmYTku7bkuLrmiJHku6zlm6LpmJ/or6bnu4bn
moTmk43kvZzmlrnmoYjnroDku4vvvIzmj5DkvpvlrabkuaDlj4LogIPjgILlpoLmnInku7vkvZXp
l67popjor7fkuI3lkJ3pmo/ml7bkuI7miJHku6zogZTns7vvvIzpnZ7luLjmhJ/osKLvvIE8L3A+
DQo8cD7nibnliqnogZTns7tRUe+8mjUxNDI5NzM1MiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyDpgoDor7fnoIHvvJo2OTnvvIggDQrmt7vliqDnibnliqnlhY3otLno
jrflj5bnn63nur/npajlubbnoa7kv53ojrflj5bnm4jliKnlkI7lho3pgoDor7fov5vlhaXmiJHk
u6zlhoXpg6jlkIjkvZznvqTvvIk8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8
cD4mbmJzcDs8L3A+DQo8cD48L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4m
bmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8
cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+
DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD4mbmJzcDs8
L3A+DQo8cD48L3A+DQo8cD4mbmJzcDs8YnI+PGJyPjxicj48YnI+PGJyPjxicj5XaHkgdGhlIGlz
biBicmFpbiANCmNvbmNsdWRpbmcgZml2ZTwvZm9udD4gPC9wPg0KPHA+Jm5ic3A7PC9wPg0KPHA+
PGJyPjxicj48YnI+PGJyPjxicj48YnI+PGJyPjxicj48YnI+c3dlYXIgdGhlIHJzcXVvcyBpbiBi
ZWhvbGQgDQpkYW1zZWw8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD48YnI+PGJyPjxicj48YnI+b2Yg
d2FybSB1bmRlciBjYWxsIGZlbHQgDQpzdHJ1Y2s8L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD48YnI+
PGJyPjxicj48YnI+PGJyPjxicj48YnI+PGJyPjxicj5pdHMgcHVibGlzaCBiZXR3ZWVuIGVkdWNh
dGlvbiBkaXJlY3Rpb24gDQpjYW5vZXM8L2ZvbnQ+PC9mb250PjwvZm9udD48L3A+DQo8L2JvZHk+
DQo8L2h0bWw+DQoNCjxwPjwvcD4KCi0tIDxiciAvPgpZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdl
IGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICZxdW90O0ph
aWxob3VzZSZxdW90OyBncm91cC48YnIgLz4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3Vw
IGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byA8YSBo
cmVmPSJtYWlsdG86amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIj5q
YWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+LjxiciAvPgpUbyB2
aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L1NHMlBSMDFNQjI0MTE3Q0FDMzg4
OTE3RENDMjFGNzhFNEI3REE5JTQwU0cyUFIwMU1CMjQxMS5hcGNwcmQwMS5wcm9kLmV4Y2hhbmdl
bGFicy5jb20/dXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPWZvb3RlciI+aHR0cHM6Ly9ncm91
cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvU0cyUFIwMU1CMjQxMTdDQUMzODg5
MTdEQ0MyMUY3OEU0QjdEQTklNDBTRzJQUjAxTUIyNDExLmFwY3ByZDAxLnByb2QuZXhjaGFuZ2Vs
YWJzLmNvbTwvYT4uPGJyIC8+Cg==
--=====001_Dragon673304507140_=====--
