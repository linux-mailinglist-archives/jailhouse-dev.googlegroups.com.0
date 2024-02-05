Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB7UWQGXAMGQETJEL3RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B9849282
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Feb 2024 03:44:16 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id 5b1f17b1804b1-40fb74433ebsf20938735e9.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Feb 2024 18:44:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1707101056; cv=pass;
        d=google.com; s=arc-20160816;
        b=I6xPdDdCnwko532yY1KimpQSK4wkMpQVMcB7sbkLo93lYND0ZhXysnIKOSSlX8J3LS
         TU3kXmgHLrB28DLI1nKwHiHrshRAYYE+ZfGAadvLm+gkQm5ge5de1291O9p8kSTX7ZwN
         KQnMiedCD2M70dbbOS+z2WSmCk7fSLfkvZVb9jVnJs3ojqvyFTUsVioF3hWJ/hRVUu0m
         TChSqx45+ikyDN+orxaHn/S5GxtZNl5oTYNTiqWleUKc+82o35jAbfnLGz5KB0kpLZnU
         +rYRyLUcI0Jfnj540XoI9CePgUP+c7rfBoh7BqXJEn605sfvQ01qM81dv6CvWL8Y80zI
         R/eg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=rciwumNOcflptE41XzUFwmFldvaJhWA5C60EzVkb7y0=;
        fh=Bt9wDKwbnHK6J+AotzR1Kb6XkLAQW181OIEVrXd9zMk=;
        b=WjYo7pgU8C2UXszKXO1KMflk548nhcGwXIxpBnEE/BRHGg2aosDvdE++TvnFdeIav2
         lBFNy8xvKsyu19wst3IIvO8laDWTEbu95GOZI8jP+eSMJUcuF6AvLUOHop/Qd1EQ26fa
         /gIFX6tdwd54VRA5AiF+TCJnNKeVMrechL5s8WmS7yNbAchVsuph+YCLlDVOI4yWnoTa
         85XlZq+fjsaQONKiUFeVySibHTOi9Rv8dnFDM+RHJHnbdZjLKySPH9ObI4GIZBVYc+wh
         sz4EkrKUIOOWi7RdgrTKO9XbygINrOGglWNOAiq1nzVMRrOtJuM9xzl24eGHOEUV0V/t
         81Ig==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=phqVX+n0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1707101056; x=1707705856; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rciwumNOcflptE41XzUFwmFldvaJhWA5C60EzVkb7y0=;
        b=eiBuURwJ1S8f0ErVkSWHvE3P0Yokc342JJE8wSqwe5cwm2mzEIn+udcN3OrXGZg9oB
         po8k26q9b206lHFAESEWkOgg0d1zwim7XBm697PS+qRIYZDiSvxV/h4gEcxY4axLYbkN
         00mAe88PANEZU4PSX2wWMgXVUwi6QMhyZJxAvK7BCFO3jmjOs8moSfbH+QIbeA9EyGfg
         Ga21HGQkdjHpq/iCpU3u1YJEpF4m6EI5ObtB66v4IIvLS1bN/7miE92zalqmoFJjiOfz
         ZI5ZzSb0kTJ+TZYTLYqKfmNsfvaXjh3aKnFB1PrW4U0rnZ4Ny8L3hSvYn442zATPffgi
         1x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707101056; x=1707705856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rciwumNOcflptE41XzUFwmFldvaJhWA5C60EzVkb7y0=;
        b=WlHyOHur7mIhdfb9JpEo55ltuLrqK9bu71KNZlFxO80sLQNH98+0VbKv348UB1Xv/q
         4QJugmcgLpVxAwMKkMIp464O4fUuWARoJhSKP6txHhLGLLBYp8hU4Nu0eCrLV6QCZgd0
         VjSWKwMHQxmJR7YtdKVjDvqqZBlLpu7RT2i88YDa16P+7fbBwt8npjNODb5hetpkJzUx
         jpuR84naugZZXr43Drd84Og39v/sn/dixpksjzJwihKXiSVmpjVmUSeyDAPYe9BemPRy
         sJ0MJhkjFj4da2F5GogbB1xx7CGcTzkfNIXXVoMQGm2sX8UaIDwDZu1Gday8gx2hoBtd
         iiLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxTGtKRTNjgc3uWoApgY0+SK+yCnoannh0Uzn161iqXfrPmDQKR
	7dnIFN8mC/D0pgWQMcsRHON3o5aqqMGG4Izy82UGlhF6JDduWQGx
X-Google-Smtp-Source: AGHT+IGWncd7BwJjEfxaPztD8OtzL2ZwTvRgBqa+o9wR/qwSNmpzMwzkNSIgByJYFckV5/oK2h3aUg==
X-Received: by 2002:a05:600c:3147:b0:40e:fb8f:7186 with SMTP id h7-20020a05600c314700b0040efb8f7186mr3428574wmo.6.1707101055445;
        Sun, 04 Feb 2024 18:44:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3546:b0:40f:c631:de8e with SMTP id
 i6-20020a05600c354600b0040fc631de8els1174603wmq.0.-pod-prod-03-eu; Sun, 04
 Feb 2024 18:44:13 -0800 (PST)
X-Received: by 2002:a05:600c:600e:b0:40f:be53:79db with SMTP id az14-20020a05600c600e00b0040fbe5379dbmr3900073wmb.5.1707101052448;
        Sun, 04 Feb 2024 18:44:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1707101052; cv=pass;
        d=google.com; s=arc-20160816;
        b=zwRis4iMqUAouafJ5Xi21fua8EPClE8TyTVkhiq7mkHVfj5Gi7zdlUOspEH0MPcez6
         73v9a/TUKd5rvtp8dBTnJu9tNa7s9/SMQNawBKttuUv84eu5V4hFh1TcGpnvrZaKKZN+
         FZ5brKK9F95f0ZUjavdvG1t5MqUqPGLNtoxlp2N/n++NYu+GmLMIR3CoZhCA9x4mIgYk
         zO3WmQhcFaIpsRXkTCofbuPKceeoeVQtMpuqYTxf1qzuMAMjnCBLdmLnfRiyLhi3Z8fb
         tZAUnFTmipzjlzY5F6C9KX/EM0es69VrYoBAUB8LkXdHb4hEDftkA3b2ukyyKqk0V/Ec
         HgXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=y/qVhi7m+eQ7AZaGJFlFO8MUM5EM6JVPkpBpTFk98ew=;
        fh=Bt9wDKwbnHK6J+AotzR1Kb6XkLAQW181OIEVrXd9zMk=;
        b=L7gE4HXtFeOVJUeZFUlUK5ttSTF+KSxFv/VqYCnHUqji0dTKJo4HhCr2VXosPfPdfm
         SO34jrH3Xjb2k+CxHUJr9ygKtPf09bEty/rEZA0GcJPK/9nEOrBetcd+DVQTikjkHlSv
         FZKPeTjT4UoOBh8t71bmVMA359p9sXv1EcQSZ2BSAyokq7PTJUwYrogWK957+2PO815B
         CSI07c+ypHhEqxY6zfzZow/szsyjpNGMswhQ5lAjF7KormdRDEtUi1NPGLfkkhiUwN1Z
         CSOF3wEUtvJ7DP0SCCXod8pQgKsU8S1NpUg9z03hmCwjbH076bsWQmb7GKyZMt+/8K/t
         sl+Q==;
        dara=google.com
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=phqVX+n0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
X-Forwarded-Encrypted: i=1; AJvYcCWotlaeCeTsjqaxnxe3fKIGraYAwExO0hzYHfHpeqh1McgF4d2kUtVaagGQlLoMlhBGoXHpsuB3bXhPCB2ghqkrXopP3CHJMbbC0wuSUlw=
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com. [2a01:111:f403:260d::600])
        by gmr-mx.google.com with ESMTPS id l5-20020a05600c1d0500b0040eefde0707si106154wms.1.2024.02.04.18.44.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Feb 2024 18:44:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:260d::600 as permitted sender) client-ip=2a01:111:f403:260d::600;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSh7IU6y0oRbwjkpgPqqB9U/MBfQV3regeWFyumpZBkY+t/Du+IajsuoZF+NqTi036YICNTUjrGxa4ueyG5PWfde+J54VCDTOleMbrBs+P1AG7JXUxfAxhM9/i0g5+ebzjXWkVOlbVR41mpWEJjT7NKdkFO3x7IGAVxzevAPQ+3feG/mFHDrAuS7X8aG/JgrrnjU1kZIl/gceYGTIC1ojehpwUMcZ1S/vSRl18mfHJ37Nh7MxNFAdHw1ZuN84MMoIq/CG5jzfAPeKBsUj3Rh2+7dfWUfFSop4kvgXN4OC4Djsq191LyRNo0Lnfy7LezK6IYkAbywGvFr1goZlPEDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/qVhi7m+eQ7AZaGJFlFO8MUM5EM6JVPkpBpTFk98ew=;
 b=J8SuKTKBPfa+1NOCtCIkXFV9WJ2HYWUZMqtWEHS+JDo7MaPU56jovrXJD4Lk73jTnu9I1q5zlFW1xdIN04a1uyMBTjgYvckc4WF3EM4eDnoPyV+WFnb7wVHG3YKxn4zqu3gj4gJVY3oJK5whs4b/aUQ/wVPHy3Qka1thjNWukDLG/fNgYO/lmSsGS49zkmVFUB1AKV869Wv1v2Lrbslb01zS43XhRL7u5x0hWiUA4TOn/eKBthxSuOEpZuc0mZuvR6mx4JtPB/92HCvVOGsfZSSKXslKpES3Y7shS9N0YfD7vv5N92/JIAsq5aNkbTIA2WM0IP22D1mSOwkl4sn18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8232.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 02:44:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 02:44:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jerry Yang <prodigyyanng@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: Start Non-root Linux on IMX8MP
Thread-Topic: Start Non-root Linux on IMX8MP
Thread-Index: AQHaTc6chq3KrfR+vUK9wcXUEPtxwrDnAx0AgBQbNVA=
Date: Mon, 5 Feb 2024 02:44:08 +0000
Message-ID: <DU0PR04MB9417D458F6E0FBAA6F08355F88472@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <94af8176-06ff-4427-8403-6589ab3bbc09n@googlegroups.com>
 <9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn@googlegroups.com>
In-Reply-To: <9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn@googlegroups.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB8232:EE_
x-ms-office365-filtering-correlation-id: 7df4975a-2957-48db-78f2-08dc25f45369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f5lrpPHsEYhEvRNMyeD4WeIAZeXMXxID1QNWzi84Bgu/4vWCymfIn4iWBvGy4MpgMLiR5co6koTuh36jP0DB74E4bWGiBUbTNm8ASySb716S4mXuN8EN70PNrHQw7wULnYkzRijSyEAs+QpJ8zgTJMuaO59KisFOCjeuKzLkXC7f0O7fsnW8yA7AiWYO+PinNdl+7/ag25bhtEfW5mExvN7souddEYNJwkeDHXfJeUnbVLf+INtguND1oLvxZ7ogLF3mqR+qjBup4i6AnoGOeOgzbqROhJbVwH2RfrMRPAJi2qA7vUcmNLeg2RvU7RsrXgP1jIjbOVd3VYo9WECz5BAXC5aR4xovmMjMPfhouX3s1ecHv190KpX/qwLYisIi88YWwombodvPDdX4Jr2Dg14XODiBETIMbtX2WEG6SINEaWzZ3TS0CbhEOBxSXvJYzuL8q5yXlpDLBOTNs3H534zPW6nxC1dOEO9pp4fdhCIG/PShvgn0AShNssy7b4zLIq7NQ1G+bT7QHVwe6ssW2RdR7jWT6O0jsCi45Y5tt9M0BWmUvlhTIisRnMgxatFVyB7rBdAlchHsn2qaUXKlSdP0Wd31KAQNZgHxzj4XQRM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(66899024)(8936002)(8676002)(44832011)(5660300002)(52536014)(33656002)(478600001)(86362001)(66946007)(966005)(316002)(66556008)(64756008)(66476007)(110136005)(76116006)(66446008)(38070700009)(30864003)(2906002)(38100700002)(71200400001)(99936003)(166002)(9686003)(7696005)(53546011)(6506007)(83380400001)(26005)(122000001)(55016003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?V1d3TFlGbmtQZitXWU8yVjN3VmVQRXY2SVFWYTUvOSs5NDFTdFNuYXM2UHNX?=
 =?gb2312?B?U1M2NzdBUU1SWU1qM0RPbnVuV1JsY2ZpWk16bnU1VjY3RVY0K0VBNVJ0Nm9I?=
 =?gb2312?B?MjlTN3RSRWNUakF6bFNCVkRqZTRsWUpQQXlhN3F0d1J1VC82VEpjVFVxYUsz?=
 =?gb2312?B?UWRvWm9YRC8xUEhlcmxuRU8yUU91ZHJXOFEyc3pIM2hRNTJIejF4TkRId2dp?=
 =?gb2312?B?VEkwS2ttSWFtNTVLbzcvcHBiaDJDdWZwNzk4QXZJQlozTlova1p6Z0dsN3pC?=
 =?gb2312?B?RmkyYkpSd1JiMTNzTmdjdzZhcXpUWEp4dG9aV2lJeWR0TS9lb3U2VlJ0ZEVH?=
 =?gb2312?B?UTBZbG5BUnVKcTlqUktGUnBIejQxVW5kRXFNYUNSVi9ZN2dxWlh2Ym8xekU5?=
 =?gb2312?B?cDN2RHNCL2JFRXdQT3BYK0pEUWVVdlNFUU9sUUNJejNkcFpoc0REbmZkdThs?=
 =?gb2312?B?VWVqdmMrT1NoUUlPZXM2dXdWcHRTWFVZWHJzU1FpbEs5Q1M1UTRnTmpTTksz?=
 =?gb2312?B?RzZqUWQ0MWtiT2dTSElDYjZYclZ0dGJreDlCQVhEMWgzUUMvWXp6bXRZZ2Ir?=
 =?gb2312?B?WmZrR0c1T0tRMmhqQXVuc2pkaHo4VmdxUis3Vm5kT1ptNzM2OGFVV0hSeVVY?=
 =?gb2312?B?YUVibGRsdmw2Nm4vRkFrWnlkd29WaUVYSXdPNVNwTzhZeWhXNEg3MFpTdC9x?=
 =?gb2312?B?d2dtdmw1NCtYYS9iUXZpT3NVM25aejJLdWxqTHFwZHR1dFpkOU8yMU4xaHRt?=
 =?gb2312?B?YWIwVGRXQ3F3YWtJdlVIVzB1SkVsNzUzUmNDVFlvcjZiNVJ2eVlQcjRhR0VH?=
 =?gb2312?B?cHVoVEYzSUxpUEJvclFUZ1VxZXRDeHBVUU5NSnZKcDVrTGJvVmFWMWNzMFFr?=
 =?gb2312?B?bTBIOUdRbXhZeFduY2pKbmNvRnQrYm1PejN2ZllBakRmczJGOWMzNno4eEhG?=
 =?gb2312?B?bmkzLzBXRElKY3hobndlcXU5c0FiTUh1dHZERjcyVC9QUTRlVEU0VVdXTlM4?=
 =?gb2312?B?WnBxdGc2YjM1blR0ajN1S2NZSlJsZUdFWmk5Z1BOSEpKa3NiNDJ2SUlDKzll?=
 =?gb2312?B?UDhJelVWZXdzYUwwTG0rMG1XM1VjN2FaUlk1WVZkeXFUbDFhajh4UmRGR3la?=
 =?gb2312?B?NXQySHVNQVdxK3lmeXJ5eUl5Q3dQenR4YzNXaFZwM3FsWVhvSXh2bm5ZOFpT?=
 =?gb2312?B?S016NnpRSWx0TXAyMVNWK0M5ekNSTEtVb0JPVjVuYXQ3MVRpRkdCRXJ2Mmd2?=
 =?gb2312?B?U0I0RHJBTGdEU3JqQXhSZ2pnS3JYSXJ6MFZrd3pWaVI1ZE5hTmRycXA1TURV?=
 =?gb2312?B?Ymw5cms5RGl1SXpqek05TzVpU045ODFYQm5KVUFid1BLaEI1dStUWjB2VGp2?=
 =?gb2312?B?dFN5OVZwc0VRY3ZRckxab08vamxoK0NPbDE4VVNoT09GT29tRlpCaVYzRGZ5?=
 =?gb2312?B?MWk5WEN4a0JhOUd6eWRuRjdtWnRFM3hKZmlNK0pGTUcyMTFrVWJLK2lVWkVl?=
 =?gb2312?B?dUg5d2x2M05xRkhYa0VqL1JjdGJSTDA5SHJpVFluQldHVmFoMkk0ZXBHdUUv?=
 =?gb2312?B?bzNGckRDaXhIdThhZTdQSFZxZW9JUWlsbXF0V0lJZ0dWcTlGQlQzUFEvVWVN?=
 =?gb2312?B?VWxKZmYwK3hCNnBzZmRYZ21GUXdhWC90VXZPQ0c0dUVWL2FuSlhKMXgvN0h0?=
 =?gb2312?B?R3c5Mzl4UnhFcEJOcGZKTHU3ZHB0dzkvOUJOdXJ6eHJRTEtDUkNNTXRaRThy?=
 =?gb2312?B?VVpsSG9yVGIzMmNoeFkwWUN3RHk4TW1xUnREUFk3cW9wZGdQNW5rcUdFeE9V?=
 =?gb2312?B?Z1pOMFMzOE40THBFS1IrSkpsVGxQUDdtcm1nZklvTUdXRFlwZ01tV0xpTFdU?=
 =?gb2312?B?cTBJVHhwSkc0c3BUblVNYyt4L3R6L2V2VERXb09ncWFTdzNRd1VsUXExZC9k?=
 =?gb2312?B?bXV2WFFlaWpuQ2RPY3lvS1UxWXBpa3RzOHpXM01zeFhnVkRYblBweUdQSTRJ?=
 =?gb2312?B?UGdNZXJseVhkTTNLVVdmZDZYMFlyNDFxSGhZbWpHRXZKSmU4dHpGSXVNKzR6?=
 =?gb2312?B?dys2RjYwRHJnaUF4bzZidmVPbmZRVGx1MXpQSFBTZy9RbXFON29SVzk4N2sx?=
 =?gb2312?Q?ew0g=3D?=
Content-Type: multipart/related;
	boundary="_004_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df4975a-2957-48db-78f2-08dc25f45369
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 02:44:08.0889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJKAVW7u5YBTChalVeYbeofkOCzeE57hNHL3dofbyi7pnVG6wAHpAQlkMIywK/5bzytzJzvSXdRvJOIT/uHrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8232
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=phqVX+n0;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f403:260d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

--_004_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_
Content-Type: multipart/alternative;
	boundary="_000_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_"

--_000_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please check whether your root linux uart is using address
0x30890000.

The inmate linux using the root linux uart as earlycon, so
If your root linux is not using 0x30890000, your inmate
will not have output. You need update your cmd.

Regards,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of Jerry Yang
Sent: 2024=E5=B9=B41=E6=9C=8823=E6=97=A5 15:40
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Start Non-root Linux on IMX8MP

My cmd is :
jailhouse enable imx8mp.cell
export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/tools/
jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb =
-c "clk_ignore_unused console=3Dttymxc3,115200 earlycon=3Dec_imx6q,0x308900=
00,115200  root=3D/dev/mmcblk2p2 rootwait rw"
=E5=9C=A82024=E5=B9=B41=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 15:34:28<Jerry Yang> =E5=86=99=E9=81=93=EF=BC=9A
Hello,

I'm practicing start the nonroot linux on okmx8mp.
I booted root Linux from the SD card and then planned to boot non-root Linu=
x from the EMMC.
I'm stuck booting non-root Linux and I really don't know what the problem i=
s.
 [cid:~WRD0806.jpg]
Below are my root dts, cell files, nonroot dts, cell files

OK8MP-C-root.dts:
// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
/*
* Copyright 2019 NXP
*/

/dts-v1/;

#include "OK8MP-C.dts"

/ {
    interrupt-parent =3D <&gic>;

    resmem: reserved-memory {
        #address-cells =3D <2>;
        #size-cells =3D <2>;
        ranges;
    };
};

&cpu_pd_wait {
    /delete-property/ compatible;
};

&clk {
    init-on-array =3D <IMX8MP_CLK_USDHC3_ROOT
             IMX8MP_CLK_NAND_USDHC_BUS
             IMX8MP_CLK_HSIO_ROOT
             IMX8MP_CLK_UART4_ROOT
             IMX8MP_CLK_OCOTP_ROOT>;
};

&{/busfreq} {
    status =3D "disabled";
};

&{/reserved-memory} {
    jh_reserved: jh@fdc00000 {
        no-map;
        reg =3D <0 0xfdc00000 0x0 0x400000>;
    };

    loader_reserved: loader@fdb00000 {
        no-map;
        reg =3D <0 0xfdb00000 0x0 0x00100000>;
    };

    ivshmem_reserved: ivshmem@fda00000 {
        no-map;
        reg =3D <0 0xfda00000 0x0 0x00100000>;
    };

    ivshmem2_reserved: ivshmem2@fd900000 {
        no-map;
        reg =3D <0 0xfd900000 0x0 0x00100000>;
    };

    pci_reserved: pci@fd700000 {
        no-map;
        reg =3D <0 0xfd700000 0x0 0x00200000>;
    };

    inmate_reserved: inmate@c0000000 {
        no-map;
        reg =3D <0 0xc0000000 0x0 0x3d700000>;
    };
};

&iomuxc {
    pinctrl_uart4: uart4grp {
        fsl,pins =3D <
            MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX    0x49
            MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX    0x49
        >;
    };
};

&usdhc3 { // emmc: mmc2=EF=BC=8C=E5=8D=B3=E4=BB=8Eemmc=E5=90=AF=E5=8A=A8=E7=
=9A=84Linux
    status =3D "disabled";
};

&uart4 {
    /delete-property/ dmas;
    /delete-property/ dma-names;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&pinctrl_uart4>;
    status =3D "disabled";
};

&uart2 { // uart1=3Dttymxc0 uart4=3Dttymxc3 default for ttymxc1
    /* uart4 is used by the 2nd OS, so configure pin and clk */
    pinctrl-0 =3D <&pinctrl_uart2>, <&pinctrl_uart4>;
    assigned-clocks =3D <&clk IMX8MP_CLK_UART4>;
    assigned-clock-parents =3D <&clk IMX8MP_CLK_24M>;
};

&usdhc2 {
    pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gp=
io>;
    pinctrl-1 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2_100mhz>, <&pinctrl_us=
dhc2_gpio>;
    pinctrl-2 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc2_200mhz>, <&pinctrl_us=
dhc2_gpio>;
};


imx8mp.c
/*
* i.MX8MM Target
*
* Copyright 2018 NXP
*
* Authors:
*  Peng Fan <peng...@nxp.com>
*
* This work is licensed under the terms of the GNU GPL, version 2.  See
* the COPYING file in the top-level directory.
*
* Reservation via device tree: reg =3D <0x0 0xffaf0000 0x0 0x510000>
*/

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
    struct jailhouse_system header;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[15];
    struct jailhouse_irqchip irqchips[3];
    struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config =3D {
    .header =3D {
        .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
        .revision =3D JAILHOUSE_CONFIG_REVISION,
        .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
        .hypervisor_memory =3D {
            .phys_start =3D 0xfdc00000,
            .size =3D       0x00400000,
        },
        .debug_console =3D {
            .address =3D 0x30890000,
            .size =3D 0x1000,
            .flags =3D JAILHOUSE_CON_TYPE_IMX |
                 JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
            .type =3D JAILHOUSE_CON_TYPE_IMX,
        },
        .platform_info =3D {
            .pci_mmconfig_base =3D 0xfd700000,
            .pci_mmconfig_end_bus =3D 0,
            .pci_is_virtual =3D 1,
            .pci_domain =3D 0,

            .arm =3D {
                .gic_version =3D 3,
                .gicd_base =3D 0x38800000,
                .gicr_base =3D 0x38880000,
                .maintenance_irq =3D 25,
            },
        },
        .root_cell =3D {
            .name =3D "imx8mp",

            .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
            .cpu_set_size =3D sizeof(config.cpus),
            .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
            .num_irqchips =3D ARRAY_SIZE(config.irqchips),
            /* gpt5/4/3/2 not used by root cell */
            .vpci_irq_base =3D 51, /* Not include 32 base */
        },
    },

    .cpus =3D {
       0xf,
    },

    .mem_regions =3D {
        /* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
            .phys_start =3D 0xfd900000,
            .virt_start =3D 0xfd900000,
            .size =3D 0x1000,
            .flags =3D JAILHOUSE_MEM_READ,
        },
        {
            .phys_start =3D 0xfd901000,
            .virt_start =3D 0xfd901000,
            .size =3D 0x9000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
        },
        {
            .phys_start =3D 0xfd90a000,
            .virt_start =3D 0xfd90a000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
        },
        {
            .phys_start =3D 0xfd90c000,
            .virt_start =3D 0xfd90c000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ,
        },
        {
            .phys_start =3D 0xfd90e000,
            .virt_start =3D 0xfd90e000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ,
        },
        /* IVSHMEM shared memory regions for 00:01.0 (networking) */
        JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
        /* IO */ {
            .phys_start =3D 0x00000000,
            .virt_start =3D 0x00000000,
            .size =3D       0x40000000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* RAM 00*/ {
            .phys_start =3D 0x40000000,
            .virt_start =3D 0x40000000,
            .size =3D 0x80000000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* Inmate memory */{
            .phys_start =3D 0xc0000000,
            .virt_start =3D 0xc0000000,
            .size =3D 0x3d700000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* Loader */{
            .phys_start =3D 0xfdb00000,
            .virt_start =3D 0xfdb00000,
            .size =3D 0x100000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* OP-TEE reserved memory?? */{
            .phys_start =3D 0xfe000000,
            .virt_start =3D 0xfe000000,
            .size =3D 0x2000000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
        },
        /* RAM04 */{
            .phys_start =3D 0x100000000,
            .virt_start =3D 0x100000000,
            .size =3D 0xC0000000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
        },
    },

    .irqchips =3D {
        /* GIC */ {
            .address =3D 0x38800000,
            .pin_base =3D 32,
            .pin_bitmap =3D {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
            },
        },
        /* GIC */ {
            .address =3D 0x38800000,
            .pin_base =3D 160,
            .pin_bitmap =3D {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
            },
        },
        /* GIC */ {
            .address =3D 0x38800000,
            .pin_base =3D 288,
            .pin_bitmap =3D {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
            },
        },
    },

    .pci_devices =3D {
        { /* IVSHMEM 0000:00:00.0 (demo) */
            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
            .domain =3D 0,
            .bdf =3D 0 << 3,
            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
            .shmem_regions_start =3D 0,
            .shmem_dev_id =3D 0,
            .shmem_peers =3D 3,
            .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
        },
        { /* IVSHMEM 0000:00:01.0 (networking) */
            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
            .domain =3D 0,
            .bdf =3D 1 << 3,
            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
            .shmem_regions_start =3D 5,
            .shmem_dev_id =3D 0,
            .shmem_peers =3D 2,
            .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
        },
    },
};


imx8mp-evk-inmate.dts:
// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
/*
* Copyright 2019 NXP
*/

/dts-v1/;

#include <dt-bindings/interrupt-controller/arm-gic.h>

/ {
    model =3D "Freescale i.MX8MP EVK";
    compatible =3D "fsl,imx8mp-evk", "fsl,imx8mp";
    interrupt-parent =3D <&gic>;
    #address-cells =3D <2>;
    #size-cells =3D <2>;

    aliases {
        serial3 =3D &uart4;
        mmc2 =3D &usdhc3;
    };

    cpus {
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        A53_2: cpu@2 {
            device_type =3D "cpu";
            compatible =3D "arm,cortex-a53";
            reg =3D <0x2>;
            clock-latency =3D <61036>; /* two CLK32 periods */
            next-level-cache =3D <&A53_L2>;
            enable-method =3D "psci";
            #cooling-cells =3D <2>;
        };

        A53_3: cpu@3 {
            device_type =3D "cpu";
            compatible =3D "arm,cortex-a53";
            reg =3D <0x3>;
            clock-latency =3D <61036>; /* two CLK32 periods */
            next-level-cache =3D <&A53_L2>;
            enable-method =3D "psci";
            #cooling-cells =3D <2>;
        };

        A53_L2: l2-cache0 {
            compatible =3D "cache";
        };
    };

    psci {
        compatible =3D "arm,psci-1.0";
        method =3D "smc";
    };

    gic: interrupt-controller@38800000 {
        compatible =3D "arm,gic-v3";
        reg =3D <0x0 0x38800000 0 0x10000>, /* GIC Dist */
              <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
        #interrupt-cells =3D <3>;
        interrupt-controller;
        interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-parent =3D <&gic>;
    };

    timer {
        compatible =3D "arm,armv8-timer";
        interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL=
_LOW)>, /* Physical Secure */
                 <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
, /* Physical Non-Secure */
                 <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
, /* Virtual */
                 <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
; /* Hypervisor */
        clock-frequency =3D <8333333>;
    };

    clk_dummy: clock@7 {
        compatible =3D "fixed-clock";
        #clock-cells =3D <0>;
        clock-frequency =3D <0>;
        clock-output-names =3D "clk_dummy";
    };

    /* The clocks are configured by 1st OS */
    clk_400m: clock@8 {
        compatible =3D "fixed-clock";
        #clock-cells =3D <0>;
        clock-frequency =3D <200000000>;
        clock-output-names =3D "200m";
    };

    clk_266m: clock@9 {
        compatible =3D "fixed-clock";
        #clock-cells =3D <0>;
        clock-frequency =3D <266000000>;
        clock-output-names =3D "266m";
    };

    osc_24m: clock@1 {
        compatible =3D "fixed-clock";
        #clock-cells =3D <0>;
        clock-frequency =3D <24000000>;
        clock-output-names =3D "osc_24m";
    };

    pci@fd700000 {
        compatible =3D "pci-host-ecam-generic";
        device_type =3D "pci";
        bus-range =3D <0 0>;
        #address-cells =3D <3>;
        #size-cells =3D <2>;
        #interrupt-cells =3D <1>;
        interrupt-map-mask =3D <0 0 0 7>;
        interrupt-map =3D <0 0 0 1 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
                <0 0 0 2 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
                <0 0 0 3 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
                <0 0 0 4 &gic GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
        reg =3D <0x0 0xfd700000 0x0 0x100000>;
        ranges =3D <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>=
;
    };

    soc@0 {
        compatible =3D "simple-bus";
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges =3D <0x0 0x0 0x0 0x3e000000>;

        aips3: bus@30800000 {
            compatible =3D "simple-bus";
            reg =3D <0x30800000 0x400000>;
            #address-cells =3D <1>;
            #size-cells =3D <1>;
            ranges;

            uart4: serial@30a60000 {
                compatible =3D "fsl,imx8mp-uart", "fsl,imx6q-uart";
                reg =3D <0x30a60000 0x10000>;
                interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
                status =3D "disabled";
            };

            usdhc3: mmc@30b60000 {
                compatible =3D "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
                reg =3D <0x30b60000 0x10000>;
                interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
                fsl,tuning-start-tap =3D <20>;
                fsl,tuning-step=3D <2>;
                status =3D "disabled";
            };
        };
    };
};

&uart4 {
    clocks =3D <&osc_24m>,
        <&osc_24m>;
    clock-names =3D "ipg", "per";
    status =3D "okay";
};

&usdhc3 {
    clocks =3D <&clk_dummy>,
        <&clk_266m>,
        <&clk_400m>;
    clock-names =3D "ipg", "ahb", "per";
    bus-width =3D <8>;
    non-removable;
    status =3D "okay";
};


imx8mp-linux-demo.c:
/*
* iMX8MM target - linux-demo
*
* Copyright 2019 NXP
*
* Authors:
*  Peng Fan <peng...@nxp.com>
*
* This work is licensed under the terms of the GNU GPL, version 2.  See
* the COPYING file in the top-level directory.
*/

/*
* Boot 2nd Linux cmdline:
* export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/tools/
* jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dt=
b -c "clk_ignore_unused console=3Dttymxc3,115200 earlycon=3Dec_imx6q,0x3089=
0000,115200  root=3D/dev/mmcblk2p2 rootwait rw"
*/
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
    struct jailhouse_cell_desc cell;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[15];
    struct jailhouse_irqchip irqchips[2];
    struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config =3D {
    .cell =3D {
        .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
        .revision =3D JAILHOUSE_CONFIG_REVISION,
        .name =3D "linux-inmate-demo",
        .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,

        .cpu_set_size =3D sizeof(config.cpus),
        .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
        .num_irqchips =3D ARRAY_SIZE(config.irqchips),
        .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
        .vpci_irq_base =3D 154, /* Not include 32 base */
    },

    .cpus =3D {
        0xc,
    },

    .mem_regions =3D {
        /* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
            .phys_start =3D 0xfd900000,
            .virt_start =3D 0xfd900000,
            .size =3D 0x1000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
        },
       {
            .phys_start =3D 0xfd901000,
            .virt_start =3D 0xfd901000,
            .size =3D 0x9000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
        },
        {
            .phys_start =3D 0xfd90a000,
            .virt_start =3D 0xfd90a000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
        },
        {
            .phys_start =3D 0xfd90c000,
            .virt_start =3D 0xfd90c000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
        },
        {
            .phys_start =3D 0xfd90e000,
            .virt_start =3D 0xfd90e000,
            .size =3D 0x2000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
        },
        /* IVSHMEM shared memory regions for 00:01.0 (networking) */
        JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
        /* UART2 earlycon */ {
            .phys_start =3D 0x30890000,
            .virt_start =3D 0x30890000,
            .size =3D 0x1000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
        },
        /* UART4 */ {
            .phys_start =3D 0x30a60000,
            .virt_start =3D 0x30a60000,
            .size =3D 0x1000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* SHDC3 */ {
            .phys_start =3D 0x30b60000,
            .virt_start =3D 0x30b60000,
            .size =3D 0x10000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* RAM: Top at 4GB Space */ {
            .phys_start =3D 0xfdb00000,
            .virt_start =3D 0,
            .size =3D 0x10000, /* 64KB */
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        },
        /* RAM */ {
            /*
             * We could not use 0x80000000 which conflicts with
             * COMM_REGION_BASE
             */
            .phys_start =3D 0xc0000000,
            .virt_start =3D 0xc0000000,
            .size =3D 0x3d700000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                JAILHOUSE_MEM_LOADABLE,
        },
        /* communication region */ {
            .virt_start =3D 0x80000000,
            .size =3D 0x00001000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_COMM_REGION,
        },
    },

    .irqchips =3D {
        /* uart2/sdhc1 */ {
            .address =3D 0x38800000,
            .pin_base =3D 32,
            .pin_bitmap =3D {
                (1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
            },
        },
        /* IVSHMEM */ {
            .address =3D 0x38800000,
            .pin_base =3D 160,
            .pin_bitmap =3D {
                0xf << (154 + 32 - 160) /* SPI 154-157 */
            },
        },
    },

    .pci_devices =3D {
        { /* IVSHMEM 00:00.0 (demo) */
            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
            .domain =3D 0,
            .bdf =3D 0 << 3,
            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
            .shmem_regions_start =3D 0,
            .shmem_dev_id =3D 2,
            .shmem_peers =3D 3,
            .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
        },
        { /* IVSHMEM 00:01.0 (networking) */
            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
            .domain =3D 0,
            .bdf =3D 1 << 3,
            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
            .shmem_regions_start =3D 5,
            .shmem_dev_id =3D 1,
            .shmem_peers =3D 2,
            .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
        },
    },
};


I really need help.
--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+uns=
ubscribe@googlegroups.com>.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn%40googlegroups.com<http=
s://groups.google.com/d/msgid/jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70=
b783cn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB9417D458F6E0FBAA6F08355F88472%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.

--_000_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=E7=AD=89=E7=BA=BF;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Please check whether your root linux uart is using =
address<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">0x30890000.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">The inmate linux using the root linux uart as early=
con, so<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">If your root linux is not using 0x30890000, your in=
mate<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">will not have output. You need update your cmd.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Peng.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> jailhouse-dev@googlegroups.com=
 &lt;jailhouse-dev@googlegroups.com&gt;
<b>On Behalf Of </b>Jerry Yang<br>
<b>Sent:</b> 2024</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=E5=
=B9=B4</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">1</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=E6=
=9C=88</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">23</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=E6=
=97=A5</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">
 15:40<br>
<b>To:</b> Jailhouse &lt;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: Start Non-root Linux on IMX8MP<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">My cmd is :<br>
jailhouse enable imx8mp.cell<br>
export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/tools/<b=
r>
jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb =
-c &quot;clk_ignore_unused console=3Dttymxc3,115200 earlycon=3Dec_imx6q,0x3=
0890000,115200 &nbsp;root=3D/dev/mmcblk2p2 rootwait rw&quot;<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"ZH-CN">=E5=9C=A8</span>2024<span lang=
=3D"ZH-CN">=E5=B9=B4</span>1<span lang=3D"ZH-CN">=E6=9C=88</span>23<span la=
ng=3D"ZH-CN">=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C</span> UTC+8 15:34:28&lt;=
Jerry Yang&gt;
<span lang=3D"ZH-CN">=E5=86=99=E9=81=93=EF=BC=9A</span><o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">Hello,&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I'm practicing start the nonroot linux on okmx8mp.<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I booted root Linux from the SD card and then planne=
d to boot non-root Linux from the EMMC.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I'm stuck booting non-root Linux and I really don't =
know what the problem is.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<span style=3D"border:solid windowtext 1.0pt;p=
adding:0cm"><img width=3D"100" height=3D"100" style=3D"width:1.0416in;heigh=
t:1.0416in" id=3D"Picture_x0020_1" src=3D"cid:~WRD0806.jpg"></span><o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal">Below are my root dts, cell files, nonroot dts, cell=
 files<br>
<br>
OK8MP-C-root.dts:<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">// SPDX-License-Identifier: (GPL-2.0+ OR MIT)</span><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">/*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Copyright 2019 NXP</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">/dts-v1/;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#CE9178"> &quot;OK8MP-C.dts&quot;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p><=
/span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">/ {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;gic&gt;;<o:p></o:p></sp=
an></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; resmem: reserved-memory {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;</span=
><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#=
B5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;</span><s=
pan style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5C=
EA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;cpu_pd_wait {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; /delete-property/ compatible;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;clk {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; init-on-array =3D &lt;</span><span style=3D"font-size=
:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">IMX8MP_CLK_USDHC3=
_ROOT</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_NAND_USDHC_BUS</span><span style=3D"font-size:9.0p=
t;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_HSIO_ROOT</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_UART4_ROOT</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_OCOTP_ROOT</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;{/busfreq} {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;disabled&quot;</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;{/reserved-memory} {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; jh_reserved: jh@fdc00000 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdc00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x400000</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; loader_reserved: loader@fdb00000 {<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdb00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00100000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; ivshmem_reserved: ivshmem@fda00000 {<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfda00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00100000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; ivshmem2_reserved: ivshmem2@fd900000 {<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd900000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00100000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pci_reserved: pci@fd700000 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00200000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; inmate_reserved: inmate@c0000000 {<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x3d700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;iomuxc {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl_uart4: uart4grp {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fsl,pins =3D &lt;<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX</span><span style=3D"fon=
t-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&nbsp;&nbsp=
;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x49</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX</span><span style=3D"fon=
t-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&nbsp;&nbsp=
;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x49</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;usdhc3 {
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">// emmc: mmc2</span><span lang=3D"ZH-CN" style=3D"font-size:9=
.0pt;color:#6A9955">=EF=BC=8C=E5=8D=B3=E4=BB=8E</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#6A9955">emmc</span><sp=
an lang=3D"ZH-CN" style=3D"font-size:9.0pt;color:#6A9955">=E5=90=AF=E5=8A=
=A8=E7=9A=84</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier=
 New&quot;;color:#6A9955">Linux</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;disabled&quot;</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;uart4 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; /delete-property/ dmas;
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;/delete-property/ dma-names;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;default&quot;</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_uart4&gt;;<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;disabled&quot;</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;uart2 {
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">// uart1=3Dttymxc0 uart4=3Dttymxc3 default for ttymxc1</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D=
4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* uart4 is used by the 2nd OS, so configure pin and clk */</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_uart2&gt;, &lt;&amp;pi=
nctrl_uart4&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; assigned-clocks =3D &lt;&amp;clk
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_UART4</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; assigned-clock-parents =3D &lt;&amp;clk
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IMX8MP_CLK_24M</span><span style=3D"font-size:9.0pt;font-fami=
ly:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;usdhc2 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_usdhc3&gt;, &lt;&amp;p=
inctrl_usdhc2&gt;, &lt;&amp;pinctrl_usdhc2_gpio&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-1 =3D &lt;&amp;pinctrl_usdhc3&gt;, &lt;&amp;p=
inctrl_usdhc2_100mhz&gt;, &lt;&amp;pinctrl_usdhc2_gpio&gt;;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pinctrl-2 =3D &lt;&amp;pinctrl_usdhc3&gt;, &lt;&amp;p=
inctrl_usdhc2_200mhz&gt;, &lt;&amp;pinctrl_usdhc2_gpio&gt;;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">imx8mp.c<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">/*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* i.MX8MM Target</span><span style=3D"font-size:9.0pt;font-family:&quot;=
Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Copyright 2018 NXP</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Authors:</span><span style=3D"font-size:9.0pt;font-family:&quot;Courie=
r New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*&nbsp; Peng Fan &lt;<span class=3D"MsoHyperlink">peng...@nxp.com</span>=
&gt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* This work is licensed under the terms of the GNU GPL, version 2.&nbsp;=
 See</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* the COPYING file in the top-level directory.</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Reservation via device tree: reg =3D &lt;0x0 0xffaf0000 0x0 0x510000&g=
t;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;=
;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&lt;jailhouse/types.h&gt;</span><span style=3D"font-size:9.0p=
t;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&lt;jailhouse/cell-config.h&gt;</span><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></spa=
n></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_system header;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; __u64 cpus[</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#B5CEA8">1</span><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">];<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_memory mem_regions[</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA=
8">15</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_irqchip irqchips[</span><span =
style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8"=
>3</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;=
;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_pci_device pci_devices[</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B=
5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">} __attribute__((packed)) config =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .header =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .signature =3D JAILHOUSE_SYST=
EM_SIGNATURE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .revision =3D JAILHOUSE_CONFI=
G_REVISION,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D JAILHOUSE_SYS_VIRT=
UAL_DEBUG_CONSOLE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hypervisor_memory =3D {<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdc00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00400000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .debug_console =3D {<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30890000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x1000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_CON_TYPE_IMX |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_CON_ACCESS_MMIO |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_CON_REGDIST_4,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type=
 =3D JAILHOUSE_CON_TYPE_IMX,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .platform_info =3D {<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pci_=
mmconfig_base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pci_=
mmconfig_end_bus =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pci_=
is_virtual =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pci_=
domain =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .arm =
=3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; .gic_version =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; .gicd_base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; .gicr_base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38880000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;.maintenance_irq =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">25</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .root_cell =3D {<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;imx8mp&quot;</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_=
pci_devices =3D ARRAY_SIZE(config.pci_devices),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cpu_=
set_size =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">sizeof</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">(config.cpus),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_=
memory_regions =3D ARRAY_SIZE(config.mem_regions),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_=
irqchips =3D ARRAY_SIZE(config.irqchips),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gp=
t5/4/3/2 not used by root cell */</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vpci=
_irq_base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">51</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">,</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#6A9955"> /* Not include 32 base
 */</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .cpus =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0xf</span><span =
style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"=
>,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .mem_regions =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IVHSMEM shared memory regi=
on for 00:00.0 (demo )*/</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd900000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd900000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x1000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;},<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd901000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd901000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x9000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90a000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90a000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90c000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90c000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90e000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90e000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IVSHMEM shared memory regi=
ons for 00:01.0 (networking) */</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_SHMEM_NET_REGIONS(<=
/span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;co=
lor:#B5CEA8">0xfda00000</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IO */</span><span style=3D=
"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x40000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_IO,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* RAM 00*/</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x40000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x40000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x80000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Inmate memory */</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4=
D4">{<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x3d700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Loader */</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">{<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdb00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdb00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x100000</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* OP-TEE reserved memory?? *=
/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;=
color:#D4D4D4">{<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfe000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfe000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000000</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* RAM04 */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">{<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x100000000</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x100000000</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xC0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .irqchips =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GIC */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
bitmap =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GIC */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">160</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
bitmap =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GIC */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">288</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
bitmap =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xffffffff</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .pci_devices =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#6A9955"> /* IVSHMEM 00=
00:00:00.0 (demo) */</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type=
 =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doma=
in =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bdf =
=3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &lt;&lt;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bar_=
mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_regions_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_dev_id =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_peers =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#6A9955"> /* IVSHMEM 00=
00:00:01.0 (networking)
 */</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type=
 =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doma=
in =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bdf =
=3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &lt;&lt;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bar_=
mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_regions_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">5</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_dev_id =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_peers =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">imx8mp-evk-inmate.dts:<o:p></o:p></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">// SPDX-License-Identifier: (GPL-2.0+ OR MIT)</span><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">/*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Copyright 2019 NXP</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">/dts-v1/;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#CE9178"> &lt;dt-bindings/interrupt-controller/arm-gic.h&gt=
;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;=
color:#D4D4D4"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">/ {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; model =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;Freescale i.MX8MP EVK&quot;</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx8mp-evk&quot;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx8mp&quot;</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;gic&gt;;<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;</span><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">2</span><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&=
gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;</span><span style=3D"font-size:9=
.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">2</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;=
;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; aliases {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; serial3 =3D &amp;uart4;<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmc2 =3D &amp;usdhc3;<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; cpus {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;</span=
><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#=
B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;</span><s=
pan style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5C=
EA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A53_2: cpu@2 {<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devic=
e_type =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;cpu&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;arm,cortex-a53&quot;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =
=3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#B5CEA8">0x2</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock=
-latency =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#B5CEA8">61036</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* two CLK32 periods */</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next-=
level-cache =3D &lt;&amp;A53_L2&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabl=
e-method =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;psci&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #cool=
ing-cells =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A53_3: cpu@3 {<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devic=
e_type =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;cpu&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;arm,cortex-a53&quot;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =
=3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#B5CEA8">0x3</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock=
-latency =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#B5CEA8">61036</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* two CLK32 periods */</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next-=
level-cache =3D &lt;&amp;A53_L2&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabl=
e-method =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;psci&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #cool=
ing-cells =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A53_L2: l2-cache0 {<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;cache&quot;</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; psci {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;arm,psci-1.0&quot;</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; method =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;smc&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; gic: interrupt-controller@38800000 {<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;arm,gic-v3&quot;</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0x0=
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">&gt;,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* GIC Dist */</span><span style=3D"font-size:9.0pt;font-fami=
ly:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-fami=
ly:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38880000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xC0000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">&gt;;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* GICR (RD_base + SGI_base) */</span><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #interrupt-cells =3D &lt;</sp=
an><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color=
:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-controller;<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CE=
A8">GIC_PPI</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">9</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_LEVEL_HIGH</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp=
;gic&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; timer {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;arm,armv8-timer&quot;</span><span style=3D"font-size:9.=
0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CE=
A8">GIC_PPI</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">13</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> (</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#B5CEA8">GIC_CPU_MASK_SIMPLE</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4=
D4">(</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#B5CEA8">6</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">)
 | </span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#B5CEA8">IRQ_TYPE_LEVEL_LOW</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">)&gt;,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* Physical Secure */</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#B5CEA8">GIC_PPI</span><span style=3D"fon=
t-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">14</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> (</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#B5CEA8">GIC_CPU_MASK_SIMPLE</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4=
D4">(</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#B5CEA8">6</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">)
 | </span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#B5CEA8">IRQ_TYPE_LEVEL_LOW</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">)&gt;,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* Physical Non-Secure */</span><span style=3D"font-size:9.0p=
t;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#B5CEA8">GIC_PPI</span><span style=3D"fon=
t-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">11</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> (</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#B5CEA8">GIC_CPU_MASK_SIMPLE</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4=
D4">(</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#B5CEA8">6</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">)
 | </span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#B5CEA8">IRQ_TYPE_LEVEL_LOW</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">)&gt;,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* Virtual */</span><span style=3D"font-size:9.0pt;font-famil=
y:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#B5CEA8">GIC_PPI</span><span style=3D"fon=
t-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">10</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> (</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#B5CEA8">GIC_CPU_MASK_SIMPLE</span><sp=
an style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4=
D4">(</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#B5CEA8">6</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">)
 | </span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#B5CEA8">IRQ_TYPE_LEVEL_LOW</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">)&gt;;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* Hypervisor */</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency =3D &lt;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#B5CEA8">8333333</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clk_dummy: clock@7 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fixed-clock&quot;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #clock-cells =3D &lt;</span><=
span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5=
CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency =3D &lt;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier N=
ew&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-output-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;clk_dummy&quot;</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#6A9955">/* The clocks are configured by 1st OS */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p=
></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clk_400m: clock@8 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fixed-clock&quot;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #clock-cells =3D &lt;</span><=
span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5=
CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency =3D &lt;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#B5CEA8">200000000</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-output-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;200m&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clk_266m: clock@9 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fixed-clock&quot;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #clock-cells =3D &lt;</span><=
span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5=
CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency =3D &lt;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#B5CEA8">266000000</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-output-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;266m&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; osc_24m: clock@1 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fixed-clock&quot;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #clock-cells =3D &lt;</span><=
span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5=
CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency =3D &lt;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#B5CEA8">24000000</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-output-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;osc_24m&quot;</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; pci@fd700000 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;pci-host-ecam-generic&quot;</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_type =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;pci&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus-range =3D &lt;</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA=
8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;</span=
><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#=
B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;</span><s=
pan style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5C=
EA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #interrupt-cells =3D &lt;</sp=
an><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color=
:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-map-mask =3D &lt;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courie=
r New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">7</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-map =3D &lt;</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B=
5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &amp;gic
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">GIC_SPI</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">154</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_EDGE_RISING</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#B5CEA8">0</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &amp;gic
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">GIC_SPI</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">155</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_EDGE_RISING</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#B5CEA8">0</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &amp;gic
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">GIC_SPI</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">156</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_EDGE_RISING</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#B5CEA8">0</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">4</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &amp;gic
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">GIC_SPI</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">157</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_EDGE_RISING</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">0x0=
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x100000</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges =3D &lt;</span><span s=
tyle=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">=
0x02000000</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier N=
ew&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; soc@0 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;simple-bus&quot;</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;</span=
><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#=
B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;</span><s=
pan style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5C=
EA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges =3D &lt;</span><span s=
tyle=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">=
0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x0</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x3e000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aips3: bus@30800000 {<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;simple-bus&quot;</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =
=3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#B5CEA8">0x30800000</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x400000</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #addr=
ess-cells =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size=
-cells =3D &lt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
s;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uart4=
: serial@30a60000 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx8mp-uart&quot;</span><span style=3D"font-size:9.=
0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx6q-uart&quot;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#B5CEA8">0x30a60000</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; interrupts =3D &lt;</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#B5CEA8">GIC_SPI</span><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">29</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_LEVEL_HIGH</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;disabled&quot;</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usdhc=
3: mmc@30b60000 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; compatible =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx8mm-usdhc&quot;</span><span style=3D"font-size:9=
.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;fsl,imx7d-usdhc&quot;</span><span style=3D"font-size:9.=
0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; reg =3D &lt;</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#B5CEA8">0x30b60000</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; interrupts =3D &lt;</span><span style=3D"font-size:9.0pt=
;font-family:&quot;Courier New&quot;;color:#B5CEA8">GIC_SPI</span><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">24</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">IRQ_TYPE_LEVEL_HIGH</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; fsl,tuning-start-tap =3D &lt;</span><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">20</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; fsl,tuning-step=3D &lt;</span><span style=3D"font-size:9=
.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">2</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;=
;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;disabled&quot;</span><span style=3D"font-size:9.0pt;fon=
t-family:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;uart4 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;osc_24m&gt;,<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&amp;osc_24m&gt;;<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clock-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;ipg&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;per&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;okay&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&amp;usdhc3 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;clk_dummy&gt;,<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&amp;clk_266m&gt;,<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&amp;clk_400m&gt;;<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; clock-names =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;ipg&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;ahb&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;per&quot;</span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; bus-width =3D &lt;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">8</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">&gt;=
;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; non-removable;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; status =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;okay&quot;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#D4D4D4">;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">imx8mp-linux-demo.c:<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">/*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* iMX8MM target - linux-demo</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Copyright 2019 NXP</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Authors:</span><span style=3D"font-size:9.0pt;font-family:&quot;Courie=
r New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*&nbsp; Peng Fan &lt;<span class=3D"MsoHyperlink">peng...@nxp.com</span>=
&gt;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* This work is licensed under the terms of the GNU GPL, version 2.&nbsp;=
 See</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quo=
t;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* the COPYING file in the top-level directory.</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">/*</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* Boot 2nd Linux cmdline:</span><span style=3D"font-size:9.0pt;font-fami=
ly:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* export PATH=3D$PATH:/home/comet/OK8MP_linux_kernel/extra/jailhouse/too=
ls/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">* jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate=
.dtb -c &quot;clk_ignore_unused console=3Dttymxc3,115200
 earlycon=3Dec_imx6q,0x30890000,115200&nbsp; root=3D/dev/mmcblk2p2 rootwait=
 rw&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">*/</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&lt;jailhouse/types.h&gt;</span><span style=3D"font-size:9.0p=
t;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">#include
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&lt;jailhouse/cell-config.h&gt;</span><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></spa=
n></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#569CD=
6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:#D4D4D4"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_cell_desc cell;<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; __u64 cpus[</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#B5CEA8">1</span><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">];<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_memory mem_regions[</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA=
8">15</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&qu=
ot;;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_irqchip irqchips[</span><span =
style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8"=
>2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;=
;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">struct</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4"> jailhouse_pci_device pci_devices[</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#B=
5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:#D4D4D4">];<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">} __attribute__((packed)) config =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .cell =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .signature =3D JAILHOUSE_CELL=
_DESC_SIGNATURE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .revision =3D JAILHOUSE_CONFI=
G_REVISION,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#CE9178">&quot;linux-inmate-demo&quot;</span><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D JAILHOUSE_CELL_PAS=
SIVE_COMMREG,<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cpu_set_size =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#569CD6">sizeof</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">(config.cpus),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_memory_regions =3D ARRAY=
_SIZE(config.mem_regions),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_irqchips =3D ARRAY_SIZE(=
config.irqchips),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_pci_devices =3D ARRAY_SI=
ZE(config.pci_devices),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vpci_irq_base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">154</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">,</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#6A9955"> /* Not include 32 base
 */</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .cpus =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .mem_regions =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IVHSMEM shared memory regi=
on for 00:00.0 (demo )*/</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">
 {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd900000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd900000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x1000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd901000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd901000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x9000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90a000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90a000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90c000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90c000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90e000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfd90e000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x2000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IVSHMEM shared memory regi=
ons for 00:01.0 (networking) */</span><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_SHMEM_NET_REGIONS(<=
/span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;co=
lor:#B5CEA8">0xfda00000</span><span style=3D"font-size:9.0pt;font-family:&q=
uot;Courier New&quot;;color:#D4D4D4">,
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">),<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UART2 earlycon */</span><s=
pan style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D=
4D4"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30890000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30890000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x1000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UART4 */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30a60000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30a60000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x1000</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_IO,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SHDC3 */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30b60000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x30b60000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_IO,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* RAM: Top at 4GB Space */</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#D4D4D4"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xfdb00000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x10000</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4">,</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#6A9955"> /* 64KB */</span><span s=
tyle=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* RAM */</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*</s=
pan><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;colo=
r:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 * We could not use 0x80000000 which conflicts with</span><span style=3D"fo=
nt-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"><o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 * COMM_REGION_BASE</span><span style=3D"font-size:9.0pt;font-family:&quot;=
Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 */</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xc0000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x3d700000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_LOADABLE,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* communication region */</s=
pan><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;colo=
r:#D4D4D4"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt=
_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x80000000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size=
 =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x00001000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_COMM_REGION,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .irqchips =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uart2/sdhc1 */</span><span=
 style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4=
"> {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.pin_=
bitmap =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; (</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#B5CEA8">1</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:#D4D4D4">
 &lt;&lt; (</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#B5CEA8">24</span><span style=3D"font-size:9.0pt;font-famil=
y:&quot;Courier New&quot;;color:#D4D4D4"> +
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> -
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">)) | (</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:#B5CEA8">1</span><span style=3D"fo=
nt-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
 &lt;&lt; (</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:#B5CEA8">29</span><span style=3D"font-size:9.0pt;font-famil=
y:&quot;Courier New&quot;;color:#D4D4D4"> +
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4"> -
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#D4D4D4">))<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#6A995=
5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IVSHMEM */</span><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4"> {=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr=
ess =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0x38800000</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
base =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">160</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pin_=
bitmap =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0xf</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4"> &lt;&lt; (</span><span style=3D"font-size:9=
.0pt;font-family:&quot;Courier New&quot;;color:#B5CEA8">154</span><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D4">
 + </span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#B5CEA8">32</span><span style=3D"font-size:9.0pt;font-family:&quot;=
Courier New&quot;;color:#D4D4D4"> -
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">160</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#D4D4D4">)</span><span style=3D"font-size:9.0pt;font-=
family:&quot;Courier New&quot;;color:#6A9955"> /* SPI 154-157 */</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; .pci_devices =3D {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#6A9955"> /* IVSHMEM 00=
:00.0 (demo) */</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type=
 =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doma=
in =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bdf =
=3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &lt;&lt;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bar_=
mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_regions_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_dev_id =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_peers =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><span style=3D"font-s=
ize:9.0pt;font-family:&quot;Courier New&quot;;color:#6A9955"> /* IVSHMEM 00=
:01.0 (networking) */</span><span style=3D"font-size:9.0pt;font-family:&quo=
t;Courier New&quot;;color:#D4D4D4"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type=
 =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doma=
in =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">0</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bdf =
=3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4"> &lt;&lt;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">3</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bar_=
mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_regions_start =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">5</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_dev_id =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">1</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_peers =3D
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#B5CEA8">2</span><span style=3D"font-size:9.0pt;font-family:&quot;Cour=
ier New&quot;;color:#D4D4D4">,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shme=
m_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4">};<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#1E1E1E"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#D4D4D=
4"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I really need help.<o:p></o:p></p>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailhouse-dev=
+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-8594c70b783cn%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter">
https://groups.google.com/d/msgid/jailhouse-dev/9d0f81ec-4d3e-47cd-b9dc-859=
4c70b783cn%40googlegroups.com</a>.<o:p></o:p></p>
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
om/d/msgid/jailhouse-dev/DU0PR04MB9417D458F6E0FBAA6F08355F88472%40DU0PR04MB=
9417.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB9417D458F6E0FBAA6F0835=
5F88472%40DU0PR04MB9417.eurprd04.prod.outlook.com</a>.<br />

--_000_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_--

--_004_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_
Content-Type: image/jpeg; name="~WRD0806.jpg"
Content-Description: ~WRD0806.jpg
Content-Disposition: inline; filename="~WRD0806.jpg"; size=823;
	creation-date="Mon, 05 Feb 2024 02:42:35 GMT";
	modification-date="Mon, 05 Feb 2024 02:44:05 GMT"
Content-ID: <~WRD0806.jpg>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a
HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAGQDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigD//2Q==

--_004_DU0PR04MB9417D458F6E0FBAA6F08355F88472DU0PR04MB9417eurp_--
