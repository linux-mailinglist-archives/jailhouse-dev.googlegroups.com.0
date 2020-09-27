Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZ6LX75QKGQEXXYFU5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C98279D44
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:07:53 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id r2sf4534236pga.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:07:53 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168871; cv=pass;
        d=google.com; s=arc-20160816;
        b=bVADUVrR66EKE9NDguAn5YGRqvW7I9BHbF0De0Zcc7EoKaJipsg2svdqE5GsOoq0PT
         t7EO0qJ1J2Fv5gADFtRwvQAOdaS896OTC4rVDFizQrpy+UTY8AbrcJo2enBUXImJZVvw
         OTdWpBiquiqweNNSBbks4PG0WW1DuaQG7oxWOShXgkuX6EdBZMRl3WQ4l2dQQWGquDgA
         gXL2EzvH9jmBZcJmGblLEDCt/V0Ky5zSnZBbjAQu3yHPqVfHtMWwQgRkhFETwowwE6s2
         U9Ga3ZDQQa2kMWIrhzykpiC2JtCJQYlEvcf8HgomCJHJGrRnViCGO7DSX6NAOGvca0M4
         HGCg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=wrJwT92IoDmUixJpQmTyUUdbBkP9NK+JYZQWbRE038c=;
        b=CU4/RiEE9mvHx9fIk/fwkSWmnX8QIPVwtaqXehaaEWMgH7WHH7ev1/cLJXQCLHL8b8
         DKXPBylrUUK9EkBeSitR/JK3BAJXDaLFJBBcjTOqf8638ccKYXot9OpuDacIQd2XQq1r
         hPIO9mYCe2DJ8CJoMRmWEO1oV77ADDjjfBAJqZFUqbkDB/qwGklYK0bdB9qTgU6rFJzP
         LbPFibmDEnwvw0Xe2CHHFr2WLEoxDK8kv0aiDkDFIwHBYKM1Dic6rnurPhcF5Kx7IedL
         SYqcZzu/YVB0aVu8Y7DTQCYgGyVCN8f0kDOY2K0g9OflyrRkP3OlHRymn6FO5ggWPV+X
         0hyg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nQNDTWg2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wrJwT92IoDmUixJpQmTyUUdbBkP9NK+JYZQWbRE038c=;
        b=A6SFe5eOOv21CKkng9B6wDlE50l4NMj5FqnjSHhgcoSpApqxEP82FWVme3TsNElLXN
         +cdDwTLFFOu2jPWs9V6wDJmF0vkVDWiwniX8N6wm6jdkLxUU81uXsd3RqcasrDE3tWs2
         IAXA3fJ7KGTzJqxOzwe0ck0qDo5rO+Mgt+BNrbc3QZCB/sEnIYY3VIVCGIMg0khM1pAq
         YvrrVmqrHiGn557R2e4b3hR3ZhtCd1xQoNU82zc0GZNkce70GVca2a/B4OU+QCrrBur1
         hCO9+bimbezKJPSYtOkfzMg8aXtQe0phPk5VdHGoxNvgiO2N8pejxeD4Je7lb/bHb1OL
         FVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wrJwT92IoDmUixJpQmTyUUdbBkP9NK+JYZQWbRE038c=;
        b=P5cTkoLWLtx5udt+VkdwNLOyjhhn4pIbndPS+ZMh38O2/amXWQ+TwP1MP+4SLCEdM4
         iphI2G70rb88Wsi8PGNulzwz11UE31Ss7TFrLdKcorHj7GdSRfxwHq1fQSKDTX/ShQVK
         1oNnzmqxGy/0IqTd8ZR0YLKssCpZQ7BYqfMd8XJQIBgZ5OqDWpHjAJs4L5Rfg7YI2590
         C0oD95HCw46Dr6azk3ACKcpqKX5BWcjxNjpQptUmE3RM/DuS3yIphDt6zQbvurRCpEdU
         Hs9iDGIwCKWtzX6YLLINvp7RskEWvf8WJTydILec/4U5RuKJg6EkitsSuPn7Tiaqrmz0
         BEMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oVNyzj161RNpnb0BB4IgKgLcTwQLwguUTCgpV0T7knxhwGGfv
	26k+/m5WULrPUux1C6mszxU=
X-Google-Smtp-Source: ABdhPJxDeCIlBNQZFKevJ6Bbig3qywvxjhucGM0/gicf1Uueghb7L/uQZ5rGcJVwKwTpYONMDGxoAQ==
X-Received: by 2002:a17:902:7e42:b029:d2:2a0b:efb7 with SMTP id a2-20020a1709027e42b02900d22a0befb7mr5559310pln.70.1601168871489;
        Sat, 26 Sep 2020 18:07:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8b8a:: with SMTP id ay10ls1337594plb.6.gmail; Sat,
 26 Sep 2020 18:07:50 -0700 (PDT)
X-Received: by 2002:a17:90a:764d:: with SMTP id s13mr3798302pjl.58.1601168870769;
        Sat, 26 Sep 2020 18:07:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168870; cv=pass;
        d=google.com; s=arc-20160816;
        b=kyLHpUgMqlNrufr4ZXSner+K81DbZ1TVkc22dBNzHJPVx+3Z06lW0QNJzU2adOdxwX
         lA3hDF1bhUbRcfcQlUIBtwe21/KOYINYwnKVGSR2ImvpZGUSCKbjP1vmhIw3UnHUn4lg
         iGijXfrUGP9nNUJzIOyRDiZvFPU/cAU0iPlDWFu+t3za/Jr3dUGy96edB6NBC+F/sqww
         8N8n0s9Azk3ZZw5INViHrFtWHEbE5m7nF5yYNBlDLHt4W8OrakSSpZH+VijzU0hoZgIW
         k4vQ53Qa1DneYFpFUjYZzWomXnvS4PqC3lvw+fiD+l9jmp4hIdEh1VIcOSFGyJkCEEHD
         smYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=779+XJHhmNttn3clq0weNYNnxAppY0oTscv/4JMXJ5Y=;
        b=PISXk5oDTXdovs7YblxrWpkx1SSKbMMpF8zOiw8AWTxBbosjHYxb6AHHB1OXAXbW/r
         jOJGJDCw5KLXs1R4KcHSLJ77O3AuezeXdiMQjK2tG6QQdDnVmXmo31xtJBMRYQcdvzFR
         P58Gt3yXrg2StwdpVtj+vEs8AsNxCwGt9lFeb0jEsnG18KMexnptPr+ZFbglS3VJwzD9
         +tJEh6ojBdtjVPbLMDcoCbN+BLEc/MMqbmb66VWrVgy/NL337fORff36mFHR33ma0WZ3
         EVTOV/yifmVuOQTn0IUI00UVn+x53Lgp8h9ooBZ5HUfaRJ/vhVH/wQI6iDWlz/+9JR83
         Zdaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nQNDTWg2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70073.outbound.protection.outlook.com. [40.107.7.73])
        by gmr-mx.google.com with ESMTPS id w136si559797pff.3.2020.09.26.18.07.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.73 as permitted sender) client-ip=40.107.7.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J53HRAmsyI1JCLKxwDaTEv5LbVVZdGqCVvEv9HrUIrjD6/yyBFsGEy+/+svBE5mxTQMnCHnvxz6LkuivzPmQ2SAVjUSzcjE7cwuLoCIInj3XB4NIL/byxw2b1g7ZH8XPNp2QkyPWw5gxf/aNzE6gTCGH2JNnuFd536nttrGw5npRo1gtsjwi5z+LXBzd0+YqG7/Lo3/dX1DcySR6n3DHFEWC1F6up2sUHQ7rH1Hwlwt/jDSn/111yD9jygIoQoOk3T6XFGIzrGEqd5mAA+i6U4X9+Q702fpTWOugmDWN0o4iJJywcoLQjFs5k9ric8L7jjxUBc5IpLjmvMRsV6lwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=779+XJHhmNttn3clq0weNYNnxAppY0oTscv/4JMXJ5Y=;
 b=NI5BhtRxacJtcvzVnNAkVCOaPqnc2A38GTpZ2XV65v1dcWTsvhu6rBhaJ5NOmrgDo6qrNNV94HA0pTeHYPqz9SuuGM8MMaYZ5k9zaHeOh4nl+cIgAELnf1Mqo3xRIWM/MUnLcPZ0+EDE8ZQr5r4DkbpXLkl7gRYKqJchWMqIjhOhRT5LfVyXLZwMruoAWYtrPATQcxbvAQ2Y/8iL40dtC2V0jfCTwEhj12J5bBHzLJDocW8fvYkz09ZjDMP/AxHO4gFz+IbQRXas5qJ79NVZ1aXBQW7g0wT7FXkxwRtqER0TCaextBkt8ZXHytd/noEvS2oiwFKT8sYvq2vm7SVSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:07:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:07:47 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 8/8] arm64: smmu: Improve output during setup
Thread-Topic: [PATCH 8/8] arm64: smmu: Improve output during setup
Thread-Index: AQHWkxjht7oi+1Kf00S1Z54IZMSvGql7ruzw
Date: Sun, 27 Sep 2020 01:07:47 +0000
Message-ID: <DB6PR0402MB2760255300F3BA954F4E736488340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <2fb93be68166b2159fdc5572630e52fd6f5e2907.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <2fb93be68166b2159fdc5572630e52fd6f5e2907.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29939f65-dc61-4e04-3658-08d86281bf95
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB23753D940CB7C50278BAD60288340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wfIUE6we4IoQe8una2oRdZOLTs8rbjdpxdrHR1chFIyAQGAItLx0454tlblgc62TKkpbUVgbAt4xVyQ0g50yaPNBULoliYp78kMOk6v+vZmcEYy71FlWJ+mVzkZ3MyuReeGRGqZioKbd5Uaeaml3Buwhj7AIASgs1HDY2WYutxe/HVTfzvn/PlggYfQUQGFb+c54CchTBz3O8Bvx13bweDr+WZWrXIKiYr2iybVScNvBFi/mrSYvzQwV1rvuV4VIxMUqUj7dALQCOb7dVh0GAeKKW+Fza5Vo4RU8w6zyxCxIC3/GqHcYtYQ5XdoaJUMoK1me+CYRbRLibkoW6DGhwLZ502uHneHQhG3WTLduSuPnPEY+5i3gufOivUkcTGzW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DJ3pA78I1mVgrIH3FIUVFi5rv89njviWj9D+XZyPLvjWZgATYC/F2Tim/RbooP2qLNAddfxaFZlDzmYBqLa0dOj7B4PPKnb19EJ+J2eSlkjiuISVFYqiF24e0WwzayXVaDSJW6TTH71T8/q31PLZrJuhwOr7/2tb1LHCUxjJZ6S96io68LAu6grStE2eMS6tOB+wSIaM389dyhRE+cddEzIJd9jiy6gwwlmwvLr5YpnhT4vCZXlWt/0boBS4b68SAbnFOZDi8f+Z8C7kKJ/tw3TUQ7H1rOz2ancjpZHYKdNQOMwfLvRT9ijuvw+v0a9iZ3iSuXABN9Bs893wBIARe2rKpxW3i4Uqyalfp1GUA5JVN8gkhENcJlPfLAc5elEaPKHMXRGDSPu2s3WeMXRnHf9LrvZp15rsJ/mRzAjBaBSkbuuVMV6pHfxqVGH6hxwEw18ux0D7BAbiPVxbZw7Dp0KxHDtNF6HS3RDgZomLFo5cRLffiTrROVgztSGDMMUx3id3eRydljSsDwQk/SrR3ZSKQLnWSkKcw8sk2eTwA0qjo7yVLYT2YVZDnsPrbAvS7q3L7/pjRCmk/K0WeuOR/DQ6RDCDBZlCE0V1GEZtqlA19ROMHwR74+CJq/RoZUWp70MQxfjHp1dHSqRc0uqG7g==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29939f65-dc61-4e04-3658-08d86281bf95
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:07:47.6693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q3bSD00xIRGoFlBiVXvOgF5OdhUk4yxoF/7JVy2JAomLqTjO/lqJIq03lpaJrQWL3eo2Aqd2I+IIHf6QhRqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=nQNDTWg2;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 8/8] arm64: smmu: Improve output during setup
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Makes the output more compact, fixes one missing line break and adds a
> correlation with the physical unit.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 4c4bb279..69374b28 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -582,9 +582,6 @@ static int arm_smmu_device_cfg_probe(struct
> arm_smmu_device *smmu)
>  	unsigned long size;
>  	int i;
> 
> -	printk("probing hardware configuration...\n");
> -	printk("ARM MMU500 with:\n");
> -
>  	/* ID0 */
>  	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
> 
> @@ -602,9 +599,9 @@ static int arm_smmu_device_cfg_probe(struct
> arm_smmu_device *smmu)
>  	 */
>  	cttw_reg = !!(id & ID0_CTTW);
>  	if (cttw_fw || cttw_reg)
> -		printk("\t%scoherent translation table walks\n", cttw_fw ? "" :
> "non-");
> +		printk(" %scoherent translation table walks\n", cttw_fw ? "" :
> +"non-");
>  	if (cttw_fw != cttw_reg)
> -		printk("\t(IDR0.CTTW is overridden by FW configuration)\n");
> +		printk(" (IDR0.CTTW is overridden by FW configuration)\n");
> 
>  	/* Max number of entries we have for stream matching/indexing */
>  	if (id & ID0_EXIDS) {
> @@ -630,7 +627,7 @@ static int arm_smmu_device_cfg_probe(struct
> arm_smmu_device *smmu)
>  			return -ENOMEM;
>  		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
> 
> -		printk("\tstream matching with %lu SMR groups", size);
> +		printk(" stream matching with %lu SMR groups\n", size);
>  	}
> 
>  	smmu->s2crs = page_alloc(&mem_pool, PAGES(size *
> (sizeof(*smmu->s2crs) @@ -671,7 +668,7 @@ static int
> arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>  		return -ENODEV;
>  	}
> 
> -	printk("\t%u context banks (%u Stage 2 only)\n",
> +	printk(" %u context banks (%u stage 2 only)\n",
>  	       smmu->num_context_banks, smmu->num_s2_context_banks);
> 
>  	smmu->cbs = page_alloc(&mem_pool,
> PAGES(smmu->num_context_banks @@ -722,9 +719,9 @@ static int
> arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>  		pgsize_bitmap = smmu->pgsize_bitmap;
>  	else
>  		pgsize_bitmap |= smmu->pgsize_bitmap;
> -	printk("\tsupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
> -	printk("\tstage-2: %lu-bit IPA -> %lu-bit PA\n",
> -	       smmu->ipa_size, smmu->pa_size);
> +	printk(" supported page sizes: 0x%08lx\n"
> +	       " stage-2: %lu-bit IPA -> %lu-bit PA\n",
> +	       smmu->pgsize_bitmap, smmu->ipa_size, smmu->pa_size);
> 
>  	return 0;
>  }
> @@ -952,6 +949,8 @@ static int arm_smmu_init(void)
>  			if (!smmu_device[i].base)
>  				return -ENOMEM;
> 
> +			printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
> +
>  			smmu_device[i].cb_base = smmu_device[i].base +
>  						 iommu->size / 2;

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760255300F3BA954F4E736488340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
