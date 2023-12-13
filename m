Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBCOH4SVQMGQE3CNLOVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0B8108B2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Dec 2023 04:22:51 +0100 (CET)
Received: by mail-io1-xd37.google.com with SMTP id ca18e2360f4ac-7b705896cb2sf572044539f.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 19:22:51 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1702437770; cv=pass;
        d=google.com; s=arc-20160816;
        b=hMqnxK66CqSStl+sblE9sFs1ioW+cYmme0Xw3lo93pouAWhYXbgKB5wcd7z+2wS2B0
         wzRE+2jfvUTPNBetnLQXE5BCvaldqs5UydAZCcHaw4p0fNstA0fed6WkU94CYlKc7U1p
         fjqjNa4gm4goU5efa3einUaVLT1PQ+qVUHJJbTmKIlCfbdq7Z9M8oXHv6jtUlU5nEDdE
         DNiXm3EggCKRKveLc+B2Cp5aHqyXtyR3lNBerIigaml38TYgZ3NNFRneOhYqf3s+DAcc
         tMECfU30XXHyYyM/oUAI3HFypx0F2DqaDVBqRM4zEf6xFFYaXHBxk6RUCA0CLbTau1t0
         bvyQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Lw5v0VziIOR/EDfXQjkNDtlLLi4vmlgtlUttZvLAp/U=;
        fh=6PUPFVmXZNn3WoJd7XXPuOSCgODM5J6nSVDgFF5ZzEw=;
        b=rxjPNUwVKibdE4sUDW0v0v8epKdHsmgG5nWH5J4o5eO/KSJi8eTXiUi3xSLZMeH//C
         qG6z4iczLaETxFBmLQDnUMrXAcFtZcvDGBWo27npZKpZ0OavHCIr5TTPJHFDmDQN/+nc
         jQwB5VJIfFsQEEzwim1fmy0aMd4f4sOnr+rz1yU0NT/QgDzAqzcS74Yn1uT6Ht+FQCSn
         dkhPV3YmgfMN2i22k1mEpQf3tVbTg+8RXChVelQ9K0LA/uQ8vg0OHpnWS4QWEu3PqJ4c
         BddZmnYULpf+02Sdd77NE9uca+uvc4SNpBxzDN0JXZuKk3AT7FbsQd8TPea90vv6/paH
         wTcA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QdueWA1Z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:2612::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1702437770; x=1703042570; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lw5v0VziIOR/EDfXQjkNDtlLLi4vmlgtlUttZvLAp/U=;
        b=wfd8WPmfHTDxgTj6YP9K+/QhWp/euJWDk8UaTRCJXAh1MGz4oacg7o36mchkhLkcju
         KxN0cNzvVijx1E+kFq2h2yZN8qOMzsn4ztJSmYwIcIaDrWidSKK8O9SfIDXRvlX9A8hG
         zjgof9relbn3pPrh5AJ9agVDIX9n8jtluT/M9YCE4DRcfZLxoWvPj8PT//u1Xnba97Rt
         go1YrZy1aYFZw1EJKp1n4Wftc9Z17EPgGRbo4KdVzee68jqHumDlfrK+4caoe0CCSg9o
         PwuHCng7zAzqfCJASPp6o1HXQbsG15aWW+Ni9SdYfV2fQtwBv+WTUt+oQdmlKVLvSmyF
         xUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702437770; x=1703042570;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lw5v0VziIOR/EDfXQjkNDtlLLi4vmlgtlUttZvLAp/U=;
        b=jwhscw9oEjMm0PjggiOE9D4RqWzBz2qiZvR2w+IJliy4j6VEkWQphk0+5aG0mO8hoj
         K8LnFSfEb3GfPBgZycFLXaJZUuV/U7oV+Qs5vLCckx+/7PH3p5Qmv61i+oGWmNb9J9Zt
         uVPgoUEZytqWanpifHv1RJSPPtSR5uaamlhwrm/6LJP8PaJDvs8LlZ0QvkmkVfJudYvz
         2f5l0D5g+diMnSQztlc4uFOWF8Wc/ssWNoDYYRXPEKGBhr0zmH4BGQDs2tIJ9PHInvv7
         5jO4e5HMbuaXAaEy/UexvRweuIw2+kNBrdMDrwwtoSlAY4QqIbmTn0dck7ridBxKlQue
         C3lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyxernYif8PXFyTLbaD6/3xLnwVfNHP/Qo5vvHJH8OSG2XdscaZ
	MmnJx5+PEzhzuJ7Cr9jfuAo=
X-Google-Smtp-Source: AGHT+IGaiu9GYENaFHk6/kiJvKHJ2B0gp/o3xXbwgExFvPJ9AWahSbVTBLlXLjPZsRtg0BwggjY3Bg==
X-Received: by 2002:a92:c564:0:b0:35d:7de6:c388 with SMTP id b4-20020a92c564000000b0035d7de6c388mr9036789ilj.30.1702437769804;
        Tue, 12 Dec 2023 19:22:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:d64d:0:b0:35d:6080:8d24 with SMTP id x13-20020a92d64d000000b0035d60808d24ls732776ilp.0.-pod-prod-06-us;
 Tue, 12 Dec 2023 19:22:48 -0800 (PST)
X-Received: by 2002:a6b:f007:0:b0:7b4:28f8:266a with SMTP id w7-20020a6bf007000000b007b428f8266amr7728668ioc.37.1702437768610;
        Tue, 12 Dec 2023 19:22:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702437768; cv=pass;
        d=google.com; s=arc-20160816;
        b=FkJrceIjKz25Y/YAV2mCmnUgLhsEvTJpYwOPuRYd3y3FQtxRNcmy5sgnagKMkA9ELF
         3VXjhuWZkpscHCVivNX+C2U02EeBtcWt4ZtbAX1B6oUfnNabBDRjsEy+LcKg3E5iHkXQ
         O7/KYUiHvwmNH533G90dk6Q9ivngtXRzqzrhH/uzUHPInKHI/7HEiq2c72vaUi4e95TX
         bX75AD7/EtIaYBYC08AMeADhWOXxIZzmlI4l37tEuF1LIVGeQl/jviUibw8Hkr57m1u6
         1NbjjGe4Kj7ElLKoc404611sTTTZEESMaUZiNIlblgP04uENvLcHInVYG6XbWFJTkfFH
         B1KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=wlu9TUHNlW7TG8IJfU8rs9TPoN7i0ex50Szv7GPodKQ=;
        fh=6PUPFVmXZNn3WoJd7XXPuOSCgODM5J6nSVDgFF5ZzEw=;
        b=GEnKlRgavGqfT3yLVZJ536u62MRA5gE+dv4qys15lBJEqC8r2OKaOHR/tfIBF6hVCP
         PZ6Z69wRCYz4Flgw7HywAPdwBCEsu7GRMxtAiioftjOpvExPedUrJ97hGHSq2qP/16fk
         Zu7AFKTKJ7afd84ySSUE/S4LmBiCpIv2YsFTOq1TCnTj0QPfQgNeT97LQBNVBip+yN+y
         o2kSO36P4/mkicCxi94mKohWU0bvzNAugNrYaJ4lElZX39ynt79ODmCqcjKnm+Kc+xIb
         QNy0yHF12CnRO3PtPAT7rh7OMWslSlcJwhcF4accrqf00L1JPT6R1ZwqiDnbwSloZBgD
         48Bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QdueWA1Z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:2612::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com. [2a01:111:f403:2612::601])
        by gmr-mx.google.com with ESMTPS id m20-20020a056638409400b00466cb35d175si883519jam.2.2023.12.12.19.22.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Dec 2023 19:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f403:2612::601 as permitted sender) client-ip=2a01:111:f403:2612::601;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OopevKsKqdZda1eBmAv+PlOoFeFjOvnOKdMh/T8ry7BFR4gkOnBn+xHcnu6+ZneIhNM6uc5zEJj6srSlxE9z7D8R/lNJ6GADMjpYbBUDFcsle3VhHQiRCtitjS7RSo5j+AWpOWsSCe2OiZez6wHPSKjq8T9+N2/Cxmn3yZPbq3coxcvKkW+u2kGEiLAZQZGr8MZ2idNc9uCT1UkCqZa2gxSDcTgiLJyPOqbrMwg0jSSazCRYyWlPqEwpgU7i3hK+H7pUc1AlQRHfBCB2tdY0YJESL375mI6HxQaTxiIaX1vZucikVCOISRXGL6qcZLmV3PBT+mXAFhXTxkZ6drKzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlu9TUHNlW7TG8IJfU8rs9TPoN7i0ex50Szv7GPodKQ=;
 b=Zqav35onFOh2YNzSC53GN5jdNwMrwm9VSB/39KDmho3y+6pxAog5/TgLmHFaDySN8I3WDm80iBqbnDtucchNAG3dK7fTM2nM1FFio00Lv3NCkIyiEZKzYlf4W3LbvrKVOmOzE1EcfL/dm7sVyIXIUt4mPgqT5rRSRpp9bWIzWbGfT0A7CVT5tfy4lm8xHEpSJp/D/6312oA5/JJ3E5DM0+eW0GPticdWpNYA5axgrlXybWmXnWK5ryx/SBIsPN3VGMOTXeRmyIH/hgvNKP0M2gdR92dAjH+53OLmdgXRixXTOTuI3WLbDC+JbjfAQYz4vkXh5x+Ti+sKCrQXhsuNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB9272.eurprd04.prod.outlook.com (2603:10a6:102:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 03:22:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7046.015; Wed, 13 Dec 2023
 03:22:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alex Zuepke <alex.zuepke@tum.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: RE: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Topic: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Index: AQHaLM9+zakaMEzIfEymK85zNsSHVbClRY0wgAAEcACAAUOO4A==
Date: Wed, 13 Dec 2023 03:22:45 +0000
Message-ID: <DU0PR04MB9417FCA05F9B24C45D99EF15888DA@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
 <DU0PR04MB9417F5A4D0C801E59F32E6F2888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <70769d2b-d476-4b2c-bcae-104b27628695@tum.de>
In-Reply-To: <70769d2b-d476-4b2c-bcae-104b27628695@tum.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PA4PR04MB9272:EE_
x-ms-office365-filtering-correlation-id: 4a7410f4-9f90-4870-7abe-08dbfb8ac640
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: skc+5OLBiJPCLzhjiJUCxiiW9aaulagmuoXCBVCyDqXHfPbSpUjRu/E6oM+a5jZIyO32tx9TN45QtksUAapkwhblZ8dJ/4MWbBfGXqQ/16s5llDAHtAWSDbNbnS/GnPC0PdsPT55SrQzg9H0sA7etyUUXwNDHtWjSGpsX3AX2w4tl2OtFWlpzw6tQUxKpxNlC0cl/iZ6UkbWYw9dV4PPKhFMJkUOlkdmpj3hljtGEtcQYM1M7EKi2YSNgC1Mmxu5cpODsUj3Z75Zgsy2kpjvYd9oarGJx95HJa1lEDNS1/SBObjxY065v9rSfaYunEfacZA5z/zp2ayO1DIl5TKOUku6NATpMJdan8ZoeN69T6167rsGfQLJoPG5WBCMnCxdjjW7kLNlguxkFJ0x/ECHnNIA8tDL7451qUTBbD1/Rn49TeX2p0t10gy8+3Tj3np6ycZtZeinM0hziSu4pxvyxkhpkcqQjV6Q7lSfP7YOlVavjrvyUisJUNdTf4gmYmaJAhOsjjduotuuRc6kWo79qvrIY0gYRygQn69hVmKOZmfVfOE0UlRzascdPRKWzXGdKjCgYidXfbhZmFDUnk9a4B5xrTgH/pdz8L+hR9CwsNvbXj2La9GupGgP526K9YbY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38070700009)(44832011)(5660300002)(41300700001)(2906002)(86362001)(52536014)(33656002)(83380400001)(478600001)(66556008)(64756008)(76116006)(110136005)(66946007)(66476007)(7696005)(9686003)(6506007)(55016003)(71200400001)(122000001)(66446008)(26005)(38100700002)(8936002)(8676002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERTS2VIRG01M0xjaitKYWJSSjlXMVJmSGFxZ2g4a1FRRHNFcEJ1RjRQajNI?=
 =?utf-8?B?eUJnTkRVQ3JsVlExd3VCQlBxd2hEd3VIbFRtRlF2dCtTY0plNWdyRytKRVRt?=
 =?utf-8?B?aUh2bHhJekFVNFhFdkNJNUNYOEpOK1J6MHRCb0R4SU9yN1N2T3VRNC81eXRY?=
 =?utf-8?B?MjJMdzhGa0VhcEV3N3EvN2d1dlprOVRJRDFBb3J3WnV1cGEyOEhPODE0b2tI?=
 =?utf-8?B?S3MzMVM3aGZ5WjRvVXRJc0JiUU1zb0NYWlJnZ0c3Y0Exa3Azckdncm9zaG5G?=
 =?utf-8?B?VC83dXl0NEFFdDRuVTRhZ3g0b0hNRXVmSmdqL0lhSXgzbjJDS1hqSklWaXh6?=
 =?utf-8?B?ZkI1djU1Q3d2TnhidzFOMDhpcDdzZUFUdEVTTFhFWjdxNm1rMXY0UUVCODFr?=
 =?utf-8?B?bWxZODd3MTJZMU1MMTNYY2pPb0IxSTJ0YmFRM0QxTmpzT0hPYk5lYVdKaWRE?=
 =?utf-8?B?Z25KeFhWZG5XUllRZDBSbFV1eEtkdnJiTzV0a3VDMGxsTURWaU8zaXl6cHNm?=
 =?utf-8?B?L1FRNnY5RG9aMHhyVVFGdmNWckVCbXgvY214dU0vRmpXd2U2eDN1KzhhVkJC?=
 =?utf-8?B?d1JaTnRlME0yU1IyVHJzWkJsK2ZLUjBXY01qWHFSdE9oall3ajZRakRjblJv?=
 =?utf-8?B?ZTJNQ2lvbG5EakRBNnlFaDdYbEp2V25ROGszN2lNOUF5MnM4aGIwcnhYT3dh?=
 =?utf-8?B?Kzl6M25CWi8zZ21DQm5va3RNV3owaUxkbmlzOHoxN1hXMWhsQjladkZTbStY?=
 =?utf-8?B?ZXRNL05QYzlxNDFPRzc0SlhZN3QxL09sZ285a0MrQ2s5cTRPTlpmZXFHYXcx?=
 =?utf-8?B?OWxFY1Z4T1NlRWFRQSszVCszVzVTS1M3Ly9lTXpzN2JmcENZcUJ0QWpScU9w?=
 =?utf-8?B?anNtdXJPSERiMzVMWmgzY1oySVdJaW1rTjBValNZTllFVHVYQ1ZndlVWRnhY?=
 =?utf-8?B?UW81NnB1cXJyMW1YVWt2TDROU3g5RGUwQnRWV0tjZzlmanhHbDRGZHdkUU5X?=
 =?utf-8?B?bHdxSTRrR2pEdDc3Zi9hdmtOVEVqeEJqTlRxWjg4UUxBRHhLSTNvMXFOcUE3?=
 =?utf-8?B?eWZhT0VGRmRmNjFHNmtEZGNxUTFyNGNHZ1BPZlQ1eEROQnhNUUFGS1pnTS9s?=
 =?utf-8?B?eWJRZWZ5M3M0Z2VqTlNJQTR4dzFtVUsyMW0rb2oyMXU2QWdjdE9QeFc2ZjRJ?=
 =?utf-8?B?eWx6bWQ1alc3T2JHQkF1aHlSK2FHOXU3TGk3bnAxdGt4b0NvVmlCTW5lSlVZ?=
 =?utf-8?B?cWRZTS9DOUpodjhnQVV4c0R5UzRMb1VPZkNyYzRuNDdwQ3RiYVRvTkdkcFRh?=
 =?utf-8?B?TU9HaGJ4UmFvdHhQWDFMK0taUTVRS25uRGVCTklQNnYyLzVJK1JleUZqclZT?=
 =?utf-8?B?RTMvZ2RtVXJiaGxFV0ZXZTdtNXJ5YjIxNHhRcGZkQmR0OU9ReFZjOWovTTJz?=
 =?utf-8?B?b0FWQWZPZVlrTUkrRDVOeGlsalZiaG5EbXJnK0JEazFUaG1yR3F5bXhvSk8w?=
 =?utf-8?B?MzhDTmEydTdtSkZXUXo4K3JWZDhBOXpxZTR0ZWE2UVMrako1MStJMmExNzQr?=
 =?utf-8?B?RllmcTQ5QXN6bE1Gc2JwQVNKa2E2NyttcGVVZU5HRHI2WHQ2Wm91Ym40andI?=
 =?utf-8?B?QUR1cVl6V0ltRmtqc0k5b2R6VHVySWZBMXBtU3NSbmVaKzlMcWlaNHJtcDIy?=
 =?utf-8?B?M0prc0duQXFBMmZDWStkL01LcC9IYnhzbDl0SUd1RWRSc3Rvczhtcy9FWnJj?=
 =?utf-8?B?Snd0SjFzSVNkY2thWHptWi9oSURJZldFQUNLcElua0NBNXJOTWdxejNGQlh2?=
 =?utf-8?B?cTU3MzVNK2VVQnJNS2daV3NFczU2bllIaHZLdHdseEw5LzUvalZCbCtHc3dp?=
 =?utf-8?B?UG5BUU9IUHl5eG9GWDQrZFNIbFZoaUdUdnVVeFZJWGRLMlNnaG94aFVVNmVx?=
 =?utf-8?B?ZUtubE5rV3BWQjk3eURGQ2hlc1g5ay92Nm9xQmRISlJrYzUxUnRZY3JYd1Vi?=
 =?utf-8?B?U1hzVnY5T1BkS0RCOWFsSjR6UXZMT2FwVVkyVVh4dytaYXJMU3FKTU5aQ0E0?=
 =?utf-8?B?MnRSZzFUYWw1dC80YUVVeXV4aEhnaThScW9RaEs4SEoyNlN4K0pXZGtZSzhQ?=
 =?utf-8?Q?Pi3s=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7410f4-9f90-4870-7abe-08dbfb8ac640
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 03:22:45.3056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWMr9OSn5+YuEPFrOZYe125QZldP4lryeGPrA4HB2dgtru3xaTSWK642Y7on/Mj47cQIXkFm5YKkqScyJH5XUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9272
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=QdueWA1Z;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f403:2612::601 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
>=20
> Hi Peng,
>=20
> Am 12.12.23 um 08:52 schrieb Peng Fan:
> > Hi Alex,
> >
> >> Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
> >>
> >> Hi Peng,
> >>
> >> Am 12.12.23 um 03:42 schrieb Peng Fan:
> >>> Hi All,
> >>>
> >>>
> >>> I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
> >>> " str     wzr, [x1, #16]! " this instruction in EL0 triggers unhanlde=
d
> >>> Data abort in EL2, with ISS is data abort, ISV is 0.
> >>>
> >>> I am not sure why this instruction trigger DC with ISV 0.
> >>> Any ideas are appreciated.
> >>>
> >>> Thanks,
> >>> Peng.
> >>
> >> The Arm architecture cannot provide all information in ISS for
> >> instructions that also update the base register.
> >
> > Does ARM architecture TRM note this? Would you please share me the
> > Chapter?
>=20
> In my old version of the Arm ARM it's noted in Section D7.2.27 "ESR_ELx,
> Exception Syndrome Register (ELx)" in the description of the ISV bit:
> > Instruction syndrome valid ...
> > This bit is 0 for all faults reported in ESR_EL2 except the following
> > stage 2
> aborts:
> > =E2=80=A2 AArch64 loads and stores ... and excluding those with writeba=
ck.
>=20
>=20
> >> You need to change the code sequence to:
> >>   str     wzr, [x1, #16]
> >>   add     x1, x1, #16
> >
> > Hmm, but gcc generates "str wzr, [x1, #16]!" from c code.
> >
> > This should be common issue I think.
>=20
> Yes, and I remember that there was some discussion on this on the LKML
> years ago. The raw accessors in Linux like __raw_writel() enforce the sim=
ple
> load/store forms to aid virtualization-

Thanks very much, I will try this.

Thanks,
Peng.

>=20
> Best regards
> Alex
>=20
>=20
> >
> > Thanks,
> > Peng.
> >
> >>
> >>
> >> Best regards
> >> Alex

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DU0PR04MB9417FCA05F9B24C45D99EF15888DA%40DU0PR04MB9417.eurprd=
04.prod.outlook.com.
