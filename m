Return-Path: <jailhouse-dev+bncBDGILGE54ELBBROERSDAMGQEVHB2UTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 981B83A3E36
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Jun 2021 10:43:50 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id d20-20020a0565123214b02902ee335ffed2sf1391720lfe.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Jun 2021 01:43:50 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623401030; cv=pass;
        d=google.com; s=arc-20160816;
        b=cDJ7/uWSxnQkiMdL9giiH0O144w78MAnbhgPf072NSEUhINsJdtxxxWOSm7DLTV96A
         eWCISTOJc07lV1raOzpdlOYPChEpTA7Pd9s/l3a3fXJO1SB496aiIXFBQ/8RZXSxSTwu
         QDTNFpkR1E/nNS2yhWfCO6lt9FOwhscy0Idh2aaRlKFGGpHygk1pAevkgRlpotEziB/L
         QQG5AZ/xfHtXh9ow0hypHwBYqmOr+RyDF+HCC2jxpWmwMUEo/ZuXMhDjZCgTGmLrbF/A
         AZgloMnd4rCyQl7LGJRjLRlcXZy7hNKw6PAlJDb4rSm3T9lqE/0n1DWWI7k+8OaA+zzX
         LVtQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=fDRVrPt2zQbgsbuoRtvIpHw05CWWb7/S3A6amIlI7/s=;
        b=Lkf7fiFxE094TZRlLC3OhlSy9LhkMQA8eRMXJKGxC/zeFUgi/I+SnEjlgQnfv5D+fW
         +sR/dv2lXGwucbo3lGPFgToN50ybzFveSmWa6KU1SurcnNIj4FB8eC+Sb9HvKHq/Kz+7
         wFd6c4jQr98wYhDEFbKmZnWG6R2o5ZrjwysD8GQ5KXqQZnDxq6FMrXcfV3keSq9YUOb+
         n9cwNiyj7EjtX8hq4488pRncS91cyKE22Ow9KnnFqrnUwj/UAqwlitnn3DjtegMehGIr
         DgL7h1emTaUXLzkolGFNsGOm1LsOTbJxogMP8Dn9ikmWtj1fqGYU5QxX1ij3c23v5qMq
         DXgA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=Xrc13Ht+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fDRVrPt2zQbgsbuoRtvIpHw05CWWb7/S3A6amIlI7/s=;
        b=Oq1lIIUh5PbTO4aiEbYQsLlNMx99LPE/j4MAu36eBkDs3rsSkbvAoQcslXsdYQ480x
         j7c9I4ftlcvcFWGkvkuPDx455hBOlehKbaw2Gcd7es7A78ylHYdBK4Akn4XBWavszu7j
         2PnXHSPfxZ1SyzAnX+hwTL28qq2lPOPJqw+AyK1r10fpzcCjXzHA8oFVDiSwL0tOrTLO
         EGFWO0sVqju0YOpzGeTrNoq2R874ay10x+fBvpQ2Zpv6qYGbypIH9cyD4EE0BKuM0KVZ
         vVvZp0PnR34WmVXaArdaRNkMmHvFagAk8+tMqoRxcWK2b7Ik7ufT4NfP8IDjO8Jj2QCa
         SPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fDRVrPt2zQbgsbuoRtvIpHw05CWWb7/S3A6amIlI7/s=;
        b=n0rcKL2ZpOOBCBEGrBXY6hL8MTfmJqf6hn6l/R31yzs+g/UZIoj3qTS6bqLMgzeLD7
         RQOsF8mDkc+wro5TYwIg4xuKbgTWyQiNQz8TQ+KKB5iC7oyVxV2lT/TouHcRZVqNX83a
         i4fqzCHkiJiia9+kC2WVcBhlIomCwaiBhh+vXpGMvNUfLszh+OqtEbnQvR+Me+grEx4J
         SqtQrJq71KMIZCvp73II5rkdxK+XSpjlUshLbMpPqzwjc9CBDhvRqxU68sFM0Ybrcfft
         bohwXC5AvU2Cd3E2PYqUwXb/MqEyxLy66UwwsiyQC/O5mdoaOSGsKKGfA0Yl+dHTRFnI
         D9mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OcryvRfCJuGangs3wYUa7NfyA9Eo4g6pqAJwKxPoomJxzVtV4
	L5+Fy5lBO1R/F22HCBe87+E=
X-Google-Smtp-Source: ABdhPJwgKsWXgpToVD4yhdbDfeW6j5YV/vlTYv6Ew9HRux4M86Rha/jGD7Bhby6QY4FptBCdI15mkg==
X-Received: by 2002:a2e:2d11:: with SMTP id t17mr2183270ljt.56.1623401030093;
        Fri, 11 Jun 2021 01:43:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2041:: with SMTP id t1ls822610ljo.5.gmail; Fri, 11
 Jun 2021 01:43:49 -0700 (PDT)
X-Received: by 2002:a2e:8497:: with SMTP id b23mr2206546ljh.126.1623401029023;
        Fri, 11 Jun 2021 01:43:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623401029; cv=pass;
        d=google.com; s=arc-20160816;
        b=AsUQCNBn5P0F0oGWY5AUioJsKbnIFEDIN5XBC69C/ftKeK2O0DsvAvjWyEQ4A0WBo3
         DkZwAT0L/tS1+9kMsJoQ1Bb5/Xd2DIqlwrtrGK5zXgB2j2Zg6+DevBZuhJEwUwfeyHrm
         HHck+jqRrozIHOIEo9i3GVtBX5/UG1LmoPlA/JAiL8wlxW8LTNrqJ7NJpOJSzLX2fziU
         woJ58UV6pZnZeVIR9VB1k2KthuZ1yOuYSmbnKSdIG1w53hj8PWWveyrkUY0DSHCj7oD0
         yxLXomlJjs0tGsGEjJRGmzNgJ+E0Gg/xk6LZ46CL6VAcbITbTZ5r3FT1VzTHhPow//MA
         Jciw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=pkDkdGGmzhkCChgVWTHzGki4BuEwI8bd1Pu131eWQ58=;
        b=DFpS4M7OSM1tSuUTUuPdVm+Mu6a8TKBhsOcGYaX3YQxaNHj/PxkbhVeshZb4KXPh+j
         0NXamPDaLq3/wvrL19M1fPuvnhRkIIGO2s8IqRljaZXdpdLSboGn19LB8EIRREpeSwmA
         /xn9W8gM+T4dnbWg1SA9HdW5uQ0sgAVqNpodJAmYbCPdDqm/SBRKd723b3ZcNigA7SaB
         6wW4Zdpo4kAKKNgebXYAVOnosy7eiUzX+BHx3ajwWdDihhzbHF5810aUYp8cmmPO1DBm
         3faVKoZqTlUfMdK73Dz1CPKEz0g5Zrece8yIBktE/XS7j6d2hUYa0a+6LNMj78GCSCrh
         fIuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=Xrc13Ht+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150139.outbound.protection.outlook.com. [40.107.15.139])
        by gmr-mx.google.com with ESMTPS id 79si193622lfd.1.2021.06.11.01.43.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jun 2021 01:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.139 as permitted sender) client-ip=40.107.15.139;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDAj1PVad5HGrVz4AwzU3NER4sKqLZFv3C0ukYTjgS/dQBZBTervcV7/d0eNLgAJLmjhseoSR8GJJZjac9Ktfyt29BjG2RXAiqZddXhlpHQlJFBKxcHUxGxV4YMEkSxXddBQsm7jOwbJG5EzuJovyY8fvzKay9eY8nvtHlrQTv3ObkkjH5N+t/cyGI2a/nWfC318rE2wHfsIOvn3Y4VutJ5a3DQCBIe3nEodXP0oGjO3PHn7EQXlQytXuLv9XKado0G6hrVI0mRYTZKTyyCTiUwW3t478TgZehmYg6OS+D1Mirkw9XY/hFh811ugr3fJzRliPRvGCwALHYyCcQvbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkDkdGGmzhkCChgVWTHzGki4BuEwI8bd1Pu131eWQ58=;
 b=SuncNAmTzv2XsGaQIUfWyFOBOhGDTlkMob/tLmG3c61wA8Ix+RxD0VEo2wpE11A9XHLKKxwICajBRmroVeruScyEkrAZP1ZZSL/kAGQ7dfBwdVcB5Dv+TQRjp4nLIAZ2xd+4GKSadXqNq8ukiwLlX+OZ3c5DOtzrUXovrpGBG3StimRXIqEVEe4TntvmmeE6v+IHHIDD/EOZmmojfbUN2YwZIBavcV+39EejrvkcCE5no2rsM1lPE2oFME5Q0k8yzkuHSsbO1blERqV1CfJ7dTLDoS89XlmyunG8eFrIEX6qBcM1bS/WnChav+guHk0rPLpAnWvBAZGx431Mf1rUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM7PR02MB6019.eurprd02.prod.outlook.com (2603:10a6:20b:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 08:43:47 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.032; Fri, 11 Jun 2021
 08:43:47 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: RE: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Topic: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Index: AddeF5T5HE9bmdlrS1iCACliLynlxAAB2zwAAB9qMBA=
Date: Fri, 11 Jun 2021 08:43:47 +0000
Message-ID: <AS8PR02MB6663F0A20C8E0BBCB16AD7C2B6349@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB66634B43A4070BFE4AEEB902B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <335fc8fb-9e9e-eae0-a8ea-81976241468a@siemens.com>
In-Reply-To: <335fc8fb-9e9e-eae0-a8ea-81976241468a@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 311c3920-af59-4ce1-820f-08d92cb50761
x-ms-traffictypediagnostic: AM7PR02MB6019:
x-microsoft-antispam-prvs: <AM7PR02MB6019FD2F660FE84C3824EEF5B6349@AM7PR02MB6019.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyrlrpHPYLwWM7ZrldaizzTHc4vTlVd9MDLdf6ISTOEa5Fx7OqjNXFO2RzeqKW+7bOGgkoIABio9CcT5UApGLxI/7pIkstODceD5AQ4IiFn7EtWADrkbZM7xoRm/GwS9ciyUIC1HBcYDpqYAfdgOx6Z/Om3QjlxYFfrsKRKn+FX/PqSCtLheHoj+yUEbUMsiwwuwiLe7UxFo3X0AGL4G60UDvcRY24p+6TiiMeRp0muKqoym5pc/5ADNCm9y+HmDypa21fn7TOazUhrAyDYTeeimB64EdF95m7BiZYtyOPBGmxW/AUpBM91sLhhtSavio6Xh3TJLR6WKUMtKxq0LU8WgvLylz9+DCbVg/VMImfjNRfQgo1QYuedW15gGIN8sg89hk6tM8Tu98lgW+b33S5ykzLmqNt2o6kPD6SCJqnYjWtQN3LiFYDqTlDv9X9q/9/CEsAJEyfO/PGu5cdXmhO6ro8qi7zx5+s+sGFzvlRlO/eT89xCjF+kCW114QW8DqpNWDb/jDkluuAbcMDvJbQc4kX6WT5P8z17AzAf6f32ATjywNpVR998+6F+UJx4QgvEJ3QCmjXahknLWb0cS35Qwc3g+7Sz+iZAwqfvkroU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(71200400001)(55016002)(8676002)(7696005)(9686003)(2906002)(33656002)(26005)(4326008)(44832011)(52536014)(8936002)(478600001)(110136005)(83380400001)(66946007)(53546011)(86362001)(122000001)(38100700002)(186003)(5660300002)(6506007)(76116006)(66476007)(64756008)(66556008)(316002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTdTaU9jazNVRUl6OTdQUWZJWlVmWVMrNitsOSthRXNuOFpDSTRUYlZoZTY4?=
 =?utf-8?B?d0RPMVh3V01Fcm5tTVBVczkyaEE0Y05ibU1xZzlBcFUzaXR1MmMyT1VHbHFx?=
 =?utf-8?B?MnVRMEN6RkwwbEx2REE3NTRuVzY4Tjg3Mi9kVWord3hPem5adnpoWDlsaXIr?=
 =?utf-8?B?V2ticEtTUmJXSUVlMjR1aDhHN2Nad0dGQTArb2ZmYW9WR2lkQnkybFBrL2xw?=
 =?utf-8?B?OWNhTjVVNEE4MmRPbktaRHJaeFdjMHdFSnlXRjI3WEhqSXdzMk1lOGZlNkN1?=
 =?utf-8?B?MUZySTVwVmZ5bzN3cEtMZUJoaU15dDRkVHRvMFh6ZXoyQWl2ajBiZjNia3Y1?=
 =?utf-8?B?S1RiYVo2SzRYTnNxMldOaXpGUXI0aU9qZ0VxOHpER1d0S1NRc0s2NW0xZm9v?=
 =?utf-8?B?dzJwL3pXRGtDaE80Q2MvbWx1Rk54WVpld1R6UytHZ0d1QUpHZVo2T1BhS3Yv?=
 =?utf-8?B?VlRLUTd3Y2xYd3R3aWtBakZsclZudDZEc2tYd1F0NmlaL1gyVm1nMWQycEJE?=
 =?utf-8?B?dEpyL2NNYXlwZVJ1NUt4TGNoV3hpNmpDM2psemNyVmlkbG5qaVZLYngyZ0Jv?=
 =?utf-8?B?ZW5JaEJQSnVVdlFrYlNVcEFyUW5RbHFlZVJZS1NBZ1JBeHdBWjdwUkhTOWlI?=
 =?utf-8?B?cUx5NGpTODFVUUVQbXlqY0N4dFNJRjFBc2VlT1JiNWJ3SlpjN1B3MVduckhT?=
 =?utf-8?B?T0U2YmlSZWF2NmdHRXBlVUxNZkw3ZHY1VkxCeTc0ZEZiQklPNVA4TkRuWDFV?=
 =?utf-8?B?UGU5Ui83clpOb1hVUWRLelFLZWk4eUZKcUZxRjZJRk55VldrQXJWOGxkckN5?=
 =?utf-8?B?K2ZKTGtVRzgza2E3bTlacEw2Yis4M1dHdkRRWjdtNkU3UFV4UFR0WXh0ZSs2?=
 =?utf-8?B?ckkwTXZMVW1abi9RZGNMcVQ2cU9GNERhYXhzN2Z3cENEcUhlQlAvMkdGN09C?=
 =?utf-8?B?ZWNrNHJqeW9rTjFyT2V1cHQyZmI0YStXQXR1ODNsYXl0UDY5SkNIcG9pdkpH?=
 =?utf-8?B?T1ZMVHhtZDU1U3l1aW85L3FsYkV6enE3LzRXNG8rZ2ZGY003QW4zYnQvZG41?=
 =?utf-8?B?Z1BoemdmU25STnZ3andIUVZaSjB6VGxxZUd6amxrZjdmVTBFOVd4QXdreXRB?=
 =?utf-8?B?bkhqV2RiaGpCbW1GTExEUC9qVTVrNUs1dmVFMW9HeHRPcEVLeHVpY05wUmtD?=
 =?utf-8?B?R0ZhM2l2RC83YStEM04wZW8ycGNob29Pd1A5THNSbGoydmNqeFRMREhPMkN6?=
 =?utf-8?B?WVBBNjdWeHJzSTVTTlFOUFpHbXlpYXNYSXRxK1B5Y3VUTTd5M0xGTlRrbkZu?=
 =?utf-8?B?V3piTTVpQWwxRlpKY2loek1lSFUvS2JNbzFTOXBnOXEyMDE4QitUTW96V3p3?=
 =?utf-8?B?UHVLZzQwcFFyZGkraEkweXVZQnRjNnJKanhNNGc0bnBlbFE1ZVVJYWI0WWxx?=
 =?utf-8?B?TkUxRDF2RzFkQm9QbllNZzlFbVZUOWtBcnBDUmI1UjJFOWl6SC9HVG8wMnpJ?=
 =?utf-8?B?dXlpRVZUU0RUUEp2UjMvSzc2NFR5M2FQanZhWTFHMzhUbEIzbjU3REsyVG03?=
 =?utf-8?B?cEdjUjQ4R2JEQlc0Q3RUUmpuQXl5ZmxWRTFwVklIS0tXN0dXTy9YUTRVWXRl?=
 =?utf-8?B?V1drQ2xUR2cvQms5T09QZzZMQ2dEaU1HMHZ4TFVjNHo1YzhMNzFNWGMvbE5L?=
 =?utf-8?B?MC9sbmlkUXkwbGo0UzhVeGhXNjA0UEs4L0llcjR3UTV0Qk5zanFRcVViMGZr?=
 =?utf-8?Q?jWD1KRf18ZvYdqh/5uyEgsAy0KbYDqke/O82Qcr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311c3920-af59-4ce1-820f-08d92cb50761
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 08:43:47.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbd03GtIsYAtbblCFHp9pVAPCrXRZjxzLTkg5SknCgJS0BrczIxvhxpvSB3ogLhPRYl0/AqkAGeLtdVB0hEDwKbZP0uTeghjpZPwpT6e730893CuH01YkCX+ecHEW3hKc8VRawy0fS6G3slwJ1UQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6019
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=Xrc13Ht+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.15.139 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: donderdag 10 juni 2021 19:36
> To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>;
> jailhouse-dev@googlegroups.com
> Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Subject: Re: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in stop()
> 
> [EXTERNAL]
> 
> 
> On 10.06.21 18:43, Bram Hooimeijer wrote:
> > From c310558edba8441fcb017592d55cb0a09f7f196a Mon Sep 17 00:00:00
> 2001
> > From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> > Date: Thu, 10 Jun 2021 17:27:57 +0200
> > Subject: [PATCH V2 1/1] inmates/lib: Set cell-state to shutdown in
> > stop()
> >
> > Ensures that calls to stop(), defined in the inmate library, set the
> > cell-state to shutdown.
> >
> > This prevents the cell to be locked but unable to respond due to being
> > stuck in the halt() loop. It also ensures that a return to
> > inmate_main() shuts down the cell.
> >
> > Signed-off-by: Bram Hooimeijer
> > <bram.hooimeijer@prodrive-technologies.com>
> > ---
> >  inmates/lib/include/inmate_common.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/inmates/lib/include/inmate_common.h
> > b/inmates/lib/include/inmate_common.h
> > index 1c20a0af..56cef77d 100644
> > --- a/inmates/lib/include/inmate_common.h
> > +++ b/inmates/lib/include/inmate_common.h
> > @@ -93,6 +93,7 @@ typedef enum { true = 1, false = 0 } bool;  static
> > inline void __attribute__((noreturn)) stop(void)  {
> >       disable_irqs();
> > +     comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
> >       halt();
> >  }
> >
> >
> 
> Unfortunately, this overwrite the CELL_FAILED set in x86's exception_handler(),
> e.g.
> 
> Which call paths were you addressing? Either move into the paths that miss to
> set the state or add a test for CELL_RUNNING/_LOCKED before setting to
> SHUT_DOWN here.

Foremostly, the call to stop() from c_entry(). However, I would prefer the latter option
as that would allow the user to call stop() as well from their own exception handlers. 

I'll send a patch with the revision. 

Thanks for looking into it, 

Bram
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663F0A20C8E0BBCB16AD7C2B6349%40AS8PR02MB6663.eurprd02.prod.outlook.com.
