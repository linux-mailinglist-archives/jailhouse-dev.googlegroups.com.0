Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBOUXRKLAMGQENPBWJCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 954D4564DD3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jul 2022 08:42:03 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id m20-20020a05600c4f5400b003a03aad6bdfsf3639081wmq.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Jul 2022 23:42:03 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1656916923; cv=pass;
        d=google.com; s=arc-20160816;
        b=zisy9tcRfkK/8HIQZJYeyVJeIdQ2GYt04jZGH/r0momPo7ulAeOWEx3hSFjQE1z4z8
         YPzsDgCgdDEkGF5jJmhFzgtdLvkGO8CMGkqR3DXuGfOiYP8LWqQ98UYGQnlOZ0CiRj64
         8pMTDZ6q1HIQ72t5tLekausxkDkQad1Y+RZyMv2K+/YWeWBLxU9zt0a544pfXvxeQ6nw
         8fe7J7SB9EoggDvllVUWi5RIim4fhgv/rZNQmMd/WBoRZkkr16Zk23BGmXyvlLUabDMH
         J0EBRlzOy3j0PO6t+DyRu+aXnHnMvplRHmARXJvPgR1pYs0CfgvXVNCizzV5QaXGi40G
         /Lcw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=wG09Oj10UH1Yf6xIQFDF4vH62tus2GOTod5XY0y+sPA=;
        b=xXIw8wuUmvYI2bQSd8fqCKQ1tf1XFNA0jU8Vqkrme7UlxtMCikCPSJAJ7Pbm9N33J+
         tHJ2o0/pu8lh9nPgt4RqJWJGOnViS3HN+T5h3/Pz8Y+2dhetaOkelZTt+cmGN8K0psBU
         MlVCsxRD+OLN9m3RizsnQkPQJfUdXGPSkRjtxXA7D1LmSNy06+cCDb3VbNtm5A0SaH48
         2RNpr8Pea4AbCpMFkzvWVlrXuh3KjN8FCEltEEDzib3dcQAGHHVluHGsvLqwKD3zp6fC
         OhQFPfNjXsU0OfjcOK3mrh5V2vUUVBM5z5PTmZkxqApvjmpk1bq5cHlmRstiVsrKnM6O
         7xig==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NlBoHBGg;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wG09Oj10UH1Yf6xIQFDF4vH62tus2GOTod5XY0y+sPA=;
        b=D7yKc5Vzs2ZwkPR6ZjcVg1mPlzqM2EA+67K7TsFCez6wdDmvWzB7VX2FTQ7WrkKPm3
         Png0TsiiIi7NTtob45ZK55FDsD9Q2vfSieIxCllP7bGEzqVVORR7ylx9AXpnYXm4qi0S
         d+2Pz7poUzCbBS84lhjMjkceV/9wSnK8ss62q4mc96Hftr04W7TEx0kWXdtRA7jG01ma
         CzLeTaZ8W4+naqFTYTP32yAD1xa+MQExI71JpOqRdVsgFFYioYF9Jp9K0Ud3xQJvl9aV
         7AipDIsyWIxinSJzD+/pMPaQmRQyrQcdgc49GpD2vtzjG3hCSOvY4NBi1CGjVF1iUJ/6
         T2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wG09Oj10UH1Yf6xIQFDF4vH62tus2GOTod5XY0y+sPA=;
        b=hJAy55SYXvp1PifzY+yLrmb3Scmrd5sTgk3IlgUgXr+yjpWHN1pbzXpj4BcxSzde4a
         +p/VVbzs5rqwky0bTJvR1OPYrOT3yEtJ4519RsYdM20wCGLiMd47seNU9KsLCoi48Grl
         2PXHTDROjPQ2/bMac2QFDDI3ogPJB1sWI4M/4JyvLmJnuTCttMYFCxND/+P7IkVr8KEl
         y2TDqZAF93DNdjf/Wz8VmImOWASasih0fj8RmhMQ+7CjNxJ3QDHvAuqHnFGFf6AY8wyX
         SOyx7grxizyj5aagthiZPJZpGvMtU2wJBn13aVK9oFyArIgXLERzKisPhgq6c17Ipmw6
         GYkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/sHcJBKpPufQWRYDTgyOfqaBjrQ/1GNBW2BYFk+0nmJwbfFhXT
	PFwTCCtaotqzFGOIdLRloDI=
X-Google-Smtp-Source: AGRyM1seAmA8TTos4dtVlmFwYgy4D2x2b1eCnyZjxabRV6CiUoINQC8Q6bXS8c4WhN6KJL6wB9jd9Q==
X-Received: by 2002:a5d:6487:0:b0:21b:983c:5508 with SMTP id o7-20020a5d6487000000b0021b983c5508mr25040378wri.185.1656916923021;
        Sun, 03 Jul 2022 23:42:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:184a:b0:21d:2802:2675 with SMTP id
 c10-20020a056000184a00b0021d28022675ls20713153wri.1.gmail; Sun, 03 Jul 2022
 23:42:01 -0700 (PDT)
X-Received: by 2002:a05:6000:70b:b0:21b:a816:85c6 with SMTP id bs11-20020a056000070b00b0021ba81685c6mr25015864wrb.639.1656916921365;
        Sun, 03 Jul 2022 23:42:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656916921; cv=pass;
        d=google.com; s=arc-20160816;
        b=rrdK2Wjv31Em8OXRV/uo2CjDDLuiWH9DVfCHjH/T/KUki4BrNWjsfz8EShGkEg3FTI
         aptykyIZEEzDKnxGZVm9MJRNIzmLUHXUBlDQAdRn2zQszu+CvZ70QzSKSZhtoVJ5LpZG
         2dWAz0fD+QD27QnYWpooRFAK6Zcz5+d7DT1S47ZuQKj5UVYiqUJfMuwEBJPDOPcxdSQW
         tB9RDH5w23I4A5fh9h9bDz0A2d0ZrUDptZAtS4fn7raEgmO7OpAMK8AhVoJJ/jD8h0n+
         w8CmZ62ewLtz0A74ZGiqsHKUmqs4EFPNOCLEbFyC4ldLa+lxAaH/1QiVqCfkggIXRMMj
         FUrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=LQ/zqiTdrJhItmG9a1Li0yGLGC41IamkRGpDtxDavWs=;
        b=NO5h9jwPvzYPnZBOHDdL/uYZkwQHEeJ26VEMPAImO2YHuud2EXL27HY516OJgZyfFY
         ae4gHdz6aQhLzRFkAlGa0XdIUpdklRRaoOycTzQHlJKHT2stw6vc7b8RIgo29f76zNxq
         qO55XJkYW10I5uzt337DPzWMLOivoQG5MLl6k4qqI99FbG7NaJOnAhcBrZpPTmkT5NrN
         VchQVjZs7xVJNgGa3nucEHCHmQ/wYC3Z/CUen/ZW2W7003SNS2+vxJ9QpkGNpjkiHjqE
         HL5PnQhHeSOlGaQsABuRNgIkgAtXGHr+vWwYw2x7TWXZJAKMhbLzYvVmOUfRK7teuBqX
         rqKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NlBoHBGg;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80050.outbound.protection.outlook.com. [40.107.8.50])
        by gmr-mx.google.com with ESMTPS id v6-20020a5d59c6000000b0021d640c9fbbsi168550wry.8.2022.07.03.23.42.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jul 2022 23:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.50 as permitted sender) client-ip=40.107.8.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZHvYANUlPmIpanxidV4sMOWxGVee9EhKpIfqz9ZVGgKsLwLGHY52EIxz+gC8vrutGUmNcoeeA1sTdnnR+Na8NpF+xrlPxyCoH0a4b4LgdC4ygT5MP7SgVSXgXG3t/iv+kgcTpqCyThvpPw0Vt7BqQDcD5pLWVwKt1DD9h0yjMAOsltKWLsC66pWh9i1ZeNDqfTXGekgMwR0NoZ4Vumdel/7AKLT/hogQLJi1sx9D3ZmbkHFx1CXb24ZKI1o/3Qkl5bxcl75Nf+u28MqMC8p6wUQ567gNNnmnAWrmiTpjRIeA3fmyfuG6dWtzP7EsBddzVv+BvADAI7qplMzKxWWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQ/zqiTdrJhItmG9a1Li0yGLGC41IamkRGpDtxDavWs=;
 b=JCqCZ57gs2hUPKAz/sFRJ2ikNajOOFEZg4aQbfU/Qmf++pkaAtRZNLZhCKNJ5ruzsLQcRZPckrGuWGKBOybf8NlKPyZR0fiX8jq2lWqgEx/yRITDm4XgJy3EksCF7bIFSB8TnmEvZIRTe2QzQK7FzpQpRy7IQryhN3Mjc2EZ9iIqMf3wDT/KvK3F4xGFd3pmxlI1ygDIeoYrhw4pPnzqJdeK2oXFT2xvwqqtr1P1K7AtBNEklcrm0D5V70K1hadkx11bZrr2WT0kJLU+9mH/eqxeEmaozzoghtTqURIbGDXZjVZV1mSgifCm0dhtlmQzK6UCnS5NJRbuiozV0Fsryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6196.eurprd04.prod.outlook.com (2603:10a6:208:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 06:41:59 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:41:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jean de Bonfils <jdebonfils5@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse inter-cluster operations
Thread-Topic: jailhouse inter-cluster operations
Thread-Index: AQHYgh74nANUY7FPQk6OjUBxiJJzjq1t3YzQ
Date: Mon, 4 Jul 2022 06:41:59 +0000
Message-ID: <DU0PR04MB94176E4803FA6CA0EACC848588BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n@googlegroups.com>
In-Reply-To: <1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n@googlegroups.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe16385-6a9f-4927-f985-08da5d884bad
x-ms-traffictypediagnostic: AM0PR04MB6196:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GFUhLNMPvdPA8PUvHAf17luAJIN0CEq2d6gfRKHl5Pk0ZxVLuwCdjRtKMefqeif1Wwi8oIlSO0KJM9d7fhmLdEDY2Ux+1GmAKUjjurj2Fw5+SDj8DbzwV+Zdg8+MuJnSSnh3GofpAvnsANSh9y+HCRZNhheWFPTBBKWwIbujg+45eMTO8rsfTKgwMnCJ97g6yzD86PbASRh7UVlDo94AkMhqiC9EH4gepa3jDVlPI67MOCK5cxPzn/CcMbbR1SNOKoN4RF7Xg8JP6SRY3gxIkPla3BftP5lOFvGvcTi/ErgTSjtvI2jL0Y7aVpxYsU0iHkJLZMR+j9Ux/TZKMNcScZXxKN6ZUOWv7TJEFebDQFTlf1KPpqmULcsL0sevCwhiFAighUgvOqJe0NG9crpV87oVvFVyZ7uzYIcYiyQLQp1SqtASbDVAW0CwRbj9A8HTqyqT9rNCMNnr2Cl7FQVpODNyEex9zy46PBortoLzgdzFnsC58qin2NFLixzulKddjyzikge/4j0Ue/s3U7I51f0DGRTE1tm6gMhf9c0CJTYDRJeDbt7iC+LeGGQxzcJzxlwkbWRkfFgNC8vJB0t02F5eap3bD+VlQxH0TH+j6RpZuXJtQrPPK4WrMkaaXdD0ADFN2yYKw1vstTyWi5duNcx6xQ5uawl/ek+KpgmtPTZQX/b1LBxbcxlToic/z9JyaLpzxCpE+D+Xq26pHUyzcGe0Xn2jCGCxZUbwqVELavMkJ3/mzgXL78Wm1uaX2TSAa2UkYG20npaEbFpEhhm1pxiZrAZEReCq+lmKkYw7J+40VgH9xNavF/ZLm4aXjc5CfzhdG3swTYW+aSadRUrzDvDoqOfirPJdDwZVClUyRzNRoFT80W/4S67MgC1ZyKUL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(3480700007)(6506007)(7696005)(53546011)(55016003)(52536014)(71200400001)(83380400001)(44832011)(33656002)(8936002)(5660300002)(966005)(478600001)(2906002)(110136005)(316002)(122000001)(186003)(86362001)(166002)(41300700001)(38070700005)(38100700002)(26005)(9686003)(66476007)(66556008)(66946007)(76116006)(64756008)(8676002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?d0Nla3FhYmptWWpkblJTNFIxaWlJVTYwMnZiTVgxZUNmdzZtVjR6YjRQK3Vp?=
 =?gb2312?B?WTY5M3llMXBYekQzN28xck5NNDJ1aXcyQTFRV2lyajdKajFtOTUwbUY0SHJG?=
 =?gb2312?B?ME5MeWg0SFZlQkZoeWRUdkgrY1IrZmFLRXhOSHMrU1BlUG5QcTlSelZSSUxl?=
 =?gb2312?B?RWZxL0dWemhtUE9sbWsrS1VQU2dteXRmQ2RCTUpjQXVRTG1qRExPekFkWGh2?=
 =?gb2312?B?THloV1JMZTdibTVmUGdsZzRsOUU5bjRQamViVnp3U01zZ2Z4NGZjenV3UEUx?=
 =?gb2312?B?ZFdHcnpFQjB4U2M4allSaHZaNXo4SnNic3ppczM0U2NpanJPODJDR3JZYUgx?=
 =?gb2312?B?cFFNQjllYi81SjNqU3FUMURBSzU0VDdIZmN2TW1ZMEt4NzhyQ0dZQW1NLzcw?=
 =?gb2312?B?NEtGOUhWaWtYano2bC9hSm1rNEdJUTVwQzdUcmFWY2JVN2xXbXk4dzd2N3JL?=
 =?gb2312?B?K1hROGFKVXg0QTJ6cXd5RWlEelZHdkFTRlZ6dU8wN3UxajZHYzR6cHdWb2Rq?=
 =?gb2312?B?QzBUUFJJWGVuVjRlYTNGRWhRTWdzR1ViRkZja0c5OS8waTFaY2xYWGV5ZXdE?=
 =?gb2312?B?WWFsYTUyNjhXRTZPMDR3Z2VqL1ZTdWJXQXZvVDd5ZUpWSVVmVW1yL1RxMmFy?=
 =?gb2312?B?MTU0bjdzckExV1JUYUhMd0VVd3FSM2J2eU1LWCtqcC9EekpkQW40cHNuQWwy?=
 =?gb2312?B?dG03M2p4Y3ZzWDdrK2JERzFDd3ZkMENjTkdUY3VCVWorMnR1MUZrRVAreTJp?=
 =?gb2312?B?TFl1VzJCNExKU3ExUTZlb2NPZTdBTm5PRUtUaWU0a21ENUl2eERZTFV6b21U?=
 =?gb2312?B?ci9IU0NIUnlhTXNUUGgrL1FybWRZaEVxbFdiYkRIN29ISTN6N3VzN3dUaXB4?=
 =?gb2312?B?REhGOTdnU2R6K21KS2x0ZVpmMzBPVFYzUVJGVHk4YnFhUDhvMzhQYm5ZWlNn?=
 =?gb2312?B?UG9kQXRVaUtZNWJFaTJlbzhZeXcvczQ4eVFYTmxja0p0ejFIN2xxYzVIeXQ5?=
 =?gb2312?B?dHlnSnVmUm1PYXJZeVNBVDZVaE96cW9rZllhMSs5alhTd29QSTdLS043bnpj?=
 =?gb2312?B?TXhQRkFjNXdRSHdDT0F5ajFuaXFKMzdUSFhMSFFUTWwrdExUQkpOdlZPSTNQ?=
 =?gb2312?B?M3lIZkgxbzRNS3hsVDNrRWVnTXEyb0lYMzFFaXA4TGVrQVhZZ2tqMDIxeTdp?=
 =?gb2312?B?SzNMYXI0eFN6SzZUY0t4QlgyUzVKVTE3RmpXNkNzM3RtQ0ljeVAvR056QkJo?=
 =?gb2312?B?ZlhIOVNRLzBvZGlSMzhGbDlENUxTT2tHWDF4dmwrSWJEaW9SeGJNdEhzcHMy?=
 =?gb2312?B?aE9YRGZwTTAwTnJuTE0wUkNHWnpLQkt5QUJ1Y1ptSExRU0c2ckF4SURMUjN2?=
 =?gb2312?B?QUZaNklmOVlNanRJRXhiVUVFNUxITk9qSjNMNExtV0tXWE9LMFk0Wnc5cGRx?=
 =?gb2312?B?RkVYMFl1cWNrSUhmam4vZkU5VXR5Ym5LZTRhcERRcit6ZzNuMHJuUy9hOC9i?=
 =?gb2312?B?d3BFVDcwckkzcXV6LzBiSnk0dnNKNDZqSFRxZUhPL0g3cXNWQ1MzSVZPVmNT?=
 =?gb2312?B?SWd6NHhwQzBJRXRJNVFyY0RabTM3SjZ1SzZZYXc5ZXdiWG43Ny8xY0pmeGR6?=
 =?gb2312?B?TlQ5UXNTbmlLNlp0YTVYbkUxb1RGV2p0WnlUejZmSDhqNzQ2RFFmaHIreWhM?=
 =?gb2312?B?R3FlcFAxTlFTTHFzMTNRUGxYTXVHSXdXVllxVWtMNjNHV2x4VU94OENtNGpm?=
 =?gb2312?B?ZVlRaEpGR0EyT0VZYW0yeG9rcnd5dms1bW5qbUtXd25QRnVDamZ3endNcWhh?=
 =?gb2312?B?bXBWRGtjd203NmlFK0VGZVczK3M0cExTNXRUODQxazM0Y00wclF5OHNhVUta?=
 =?gb2312?B?dFlBTTVSMHlBdmZTcmhKdDJLekk2Tzd3MDlFbFJRZUIrU3BQdTdwcGJSUmhr?=
 =?gb2312?B?eVVZOCtSbGtNOFJITCtuWURXby9WbTJxRVp1NDFDbnUwMG5ZUjFBcmVBSTk1?=
 =?gb2312?B?ejBjOHllUXd2UW5YOGtCNHpQSm4yOHozckdVZTJlNW56NHd5ZWFFdWFocm9G?=
 =?gb2312?B?bFBnblBGeUNGdWo0ejhReDVRaGVHb1c1aFp4VWdDdEd3eGRhQzJFaFZkcjdD?=
 =?gb2312?Q?6Vjg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU0PR04MB94176E4803FA6CA0EACC848588BE9DU0PR04MB9417eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe16385-6a9f-4927-f985-08da5d884bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 06:41:59.2349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63kASgCjG1hv9ZvsbzrR9wjaXiGr8O3+0oOeIFj20dmM5lZDtAuzF2V9dL3h7lTLNHPc13wBPMJuPtblvvKFdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6196
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=NlBoHBGg;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

--_000_DU0PR04MB94176E4803FA6CA0EACC848588BE9DU0PR04MB9417eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i.MX8QM could support jailhouse, with 4 A53 in a cell, 2 A72 in a cell.

I not get you about inter-cluster MMU operations (:

Regards,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of Jean de Bonfils
Sent: 2022=E5=B9=B46=E6=9C=8817=E6=97=A5 15:51
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: jailhouse inter-cluster operations

Hi everyone,
I would like to know if jailhouse is able to run on multiple core clusters.
For example, Imx8 Quad Max has one cluster of 4x Cortex A-53 and another cl=
uster of 4x Cortex-A72.
If so, do you know how Jailhouse manages inter-cluster MMU operations ?

Thank you in advance and have a nice day.

Jean de Bonfils Lavernelle
--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+uns=
ubscribe@googlegroups.com>.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%40googlegroups.com<http=
s://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.goog=
le.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%=
2540googlegroups.com%3Futm_medium%3Demail%26utm_source%3Dfooter&data=3D05%7=
C01%7Cpeng.fan%40nxp.com%7Ce39b3ff2f0e44e156ca208da50361a4c%7C686ea1d3bc2b4=
c6fa92cd99c5c301635%7C0%7C1%7C637910490541656854%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&sdata=3D6rbs5y8qRlYwzWOpcQxTNM81F11xBz%2BAZyeV0ujTkwI%3D&reserved=3D0=
>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB94176E4803FA6CA0EACC848588BE9%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.

--_000_DU0PR04MB94176E4803FA6CA0EACC848588BE9DU0PR04MB9417eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
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
<p class=3D"MsoNormal">i.MX8QM could support jailhouse, with 4 A53 in a cel=
l, 2 A72 in a cell.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I not get you about inter-cluster MMU operations (:<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Peng.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> jailhouse-dev@googlegroups.com &lt;jail=
house-dev@googlegroups.com&gt;
<b>On Behalf Of </b>Jean de Bonfils<br>
<b>Sent:</b> 2022<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E5=B9=
=B4</span>6<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=9C=88</spa=
n>17<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=97=A5</span> 15:5=
1<br>
<b>To:</b> Jailhouse &lt;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> jailhouse inter-cluster operations<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi everyone,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">I would like to know if jailhouse is able to run on =
multiple core clusters.&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">For example, Imx8 Quad Max has one cluster of 4x Cor=
tex A-53 and another cluster of 4x Cortex-A72.&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">If so, do you know&nbsp;how Jailhouse manages inter-=
cluster MMU operations ?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thank you in advance and have a nice day.<o:p></o:p>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Jean de Bonfils Lavernelle<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailhouse-dev=
+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://eur01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%=
2Fjailhouse-dev%2F1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%2540googlegroups.co=
m%3Futm_medium%3Demail%26utm_source%3Dfooter&amp;data=3D05%7C01%7Cpeng.fan%=
40nxp.com%7Ce39b3ff2f0e44e156ca208da50361a4c%7C686ea1d3bc2b4c6fa92cd99c5c30=
1635%7C0%7C1%7C637910490541656854%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D6rbs5y8qRlYwzWOpcQxTNM81F11xBz%2BAZyeV0ujTkwI%3D&amp;reserved=3D0">
https://groups.google.com/d/msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4=
aa18ca3d7n%40googlegroups.com</a>.<o:p></o:p></p>
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
om/d/msgid/jailhouse-dev/DU0PR04MB94176E4803FA6CA0EACC848588BE9%40DU0PR04MB=
9417.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB94176E4803FA6CA0EACC84=
8588BE9%40DU0PR04MB9417.eurprd04.prod.outlook.com</a>.<br />

--_000_DU0PR04MB94176E4803FA6CA0EACC848588BE9DU0PR04MB9417eurp_--
