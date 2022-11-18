Return-Path: <jailhouse-dev+bncBAABBRN33ONQMGQEYZSPV3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD662EAD2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 18 Nov 2022 02:20:09 +0100 (CET)
Received: by mail-ej1-x63d.google.com with SMTP id sg37-20020a170907a42500b007adaedb5ba2sf2043131ejc.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Nov 2022 17:20:09 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668734406; cv=pass;
        d=google.com; s=arc-20160816;
        b=bjYBTOI6VuNG7tPWTrIcc4Hd+TOF0vt4zP4nBr0tIg83L5HP7ZO6hrtFdVPHPKuoFO
         XLKKxXxdvSIRCTo1HtmsK2/x1/lxPiXUINoOedbG3mZZ8sLtQx7Vg8JIrSqtn1By+s8v
         LijXU3qP4ItU4JONRKTdFXGe373MNngJ0jDu7uBV6hoEOMIlVvSZx6mRyWWQfTrAjsDl
         5X8oACNSeykNrhQDETH3jGG4YM3aHjS2QFNQHyT53Ezx+Vc2EyUhHm8bezHGxSCCIjW8
         SW5uBi85lOAp6CYlR7NS5r41bN7L0yccKyVq+CiNXyDbXArPMhjx5jBrtdkuyqA6Mj/s
         K+FA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=2ZIBcCxRgBy3JydK40KkZBt0Cl5Uwb7ROyfFsgc8DEM=;
        b=Jy/iecXBlfhdkpsAl18i14OkNbp2JvOULuQKU1XonjVUFTRmAah1WO4APXv1iSZM9v
         xohLJPFNUcfOn4SdvvrCtSFQ4+8+8QgI38kXbO6awYl9wsV6yUNMTNnfRP331LXCYAJS
         B6kmQ1sIYK4hWflSH86eX72KSgRO6rxapCLVNPb4dDaQLwax2U6jEJqP4mwOUvABN/T1
         8sQyHnxBzdFi7nOM/OGYKAtWQfcwrEjftW6XfGcbMMbxaFzWxT2ThERS/18F/Iq1F0aT
         bmH1ao2lUGFDLH3yTwKJujWS3UEf7Um8NKxhbgytj6vSpVw8jUAsWZns9H5n9MTbBuaR
         UhmQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=SF21e4UD;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZIBcCxRgBy3JydK40KkZBt0Cl5Uwb7ROyfFsgc8DEM=;
        b=TSrsmWJflRRRbsDIybiD5m0wKbGR69ecYKuBTAbHxpV/J5nECscuEFDXmyKqqPsGL3
         WJ0Q5n8IcgUUL4TTzWVGSHMGSsaahppRc/6gXqLej/vp1TvFZfY8Tkkn+/thXcyFtQuF
         kmsGz8eNNXLEZGcjUG4kH45SXpC/iGkHXrgCtAHV0DJGSu30UUnyOgJu2jZ/Hz5zrJw3
         KZaeBAXI4ZuNkTgSgaDxuoB3wzJxK/wObSHwuqTH+UYL8riQvEKclbWqQ//EPgw47zt4
         buAY4zpGvyYt+QdNUXfT7jTUm4PjofeOUZX2jOYaU856zcJzZfV1llK4OVZpD4T6oFzh
         7mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZIBcCxRgBy3JydK40KkZBt0Cl5Uwb7ROyfFsgc8DEM=;
        b=nKmfQB8YxY+y0qGjU+7rdU23yNdvQstuGKciInrT+nYJDUitz4nPx6iuEFAl6n+1eV
         8kP+ne95uVMx10EGWiHsnZbxm4tEgmbtGia1IcpnYhcBXue92qFvNtpm9XvXJ8QubK3t
         1FkK4Bh7oWLviYb8uesPraTFyrYgNy+jyWl+/Om1ltxHFy7LfKlUGuHXiP1V/YyryU5v
         VNcq/vIg9oUGufnr6ZpK8eIqeKt0Ol3pwGWs269lXt6YqTQY8hRXBCqPmoVGYqUIva/i
         ep9Mb7V55hpF0k6syjC67Txv8dCUvkefl/KhXVqdBToJo+L8II3F8oOX7VQOGYJf1tTp
         UKmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plkvD/5vuphXYbVngFzDr7tgNHNULjVK3XRD9D+tP7vNn6W/7W1
	zqr5wRDjZhcPCemouXtvMBE=
X-Google-Smtp-Source: AA0mqf7xT1s96Lq/1cAb8Vp6aXingpYhsGWgyAf4nh15g+4aE/LmoP4DmIlpAxU9sTVBKATqID1kKg==
X-Received: by 2002:a17:906:4c98:b0:7ad:b9f3:a66a with SMTP id q24-20020a1709064c9800b007adb9f3a66amr4329013eju.282.1668734406170;
        Thu, 17 Nov 2022 17:20:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:443:b0:7af:1b1:9648 with SMTP id e3-20020a170906044300b007af01b19648ls1943832eja.1.-pod-prod-gmail;
 Thu, 17 Nov 2022 17:20:04 -0800 (PST)
X-Received: by 2002:a17:907:9951:b0:7b2:7e7a:11c1 with SMTP id kl17-20020a170907995100b007b27e7a11c1mr3946788ejc.684.1668734404792;
        Thu, 17 Nov 2022 17:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668734404; cv=pass;
        d=google.com; s=arc-20160816;
        b=buEM98eDefJYIkjxWJVmmzPDXqW/s7EOKKWZQ+Kh8F3wVd4mbhVOiQsnV1FGKtUmwJ
         uafYI9gTs+7pWaHgF6mYcyM4fj545EwqQW9JZbCisjdWSeqwAFposkWClyvQox3qKuap
         2mjBs/iQFWN5hHP/fD1TXT4ZtPYPZw456PQkdpdYSRLr1UrmfFJ85JdiKqxOJZQ39Xn9
         davcGu+JAd0UaGKgW9IdOixbkvGmw8QH7deyoAAU0ogDiK0/6KmZcS/s+GHiYSPb7lJk
         MavMvrsDn1As2esJkoolm5VqAtNFw6vgJISrg5wpROx7YdADIlMN01+ZFRzSbaxuUUFu
         SptA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=sWfCiqfZqzCV6HGQbTa+AjHde52vyvdzR3dCTfDVHxE=;
        b=kn6kVCrF/Ddch3CDikQI2B5+LOy96t3cR38KuloW61wQCCbEDEKAGopHXBDtZuiyIW
         JIVaDE2G7Bt0/UEvDIrbfaLy4B52Wp3sDtl48s4t+la2vWM9c1hFqj1bFpwg40GYKica
         yLpox1l9vOi1e0E/rKZvOpOYQh0AfFF1F2GLH3Vm1hOmWryfN3ZAiLHENFsJFHbIqGLd
         o0jHnXYeijIQ2NnqP7fQznH7q5firJOyZVx4yww81lg1A5o1AciLEhcyucW51re7y+Vm
         3gZFiFcZz+iLb72pLBe1fqKXVM1b54uGdV1U23en3pNWO1Rp1o3U5d8N0DAJwnegMt+a
         7Tiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=SF21e4UD;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from loire.is.ed.ac.uk (loire.is.ed.ac.uk. [129.215.16.10])
        by gmr-mx.google.com with ESMTPS id h9-20020aa7c609000000b004677f0f6e36si90346edq.5.2022.11.17.17.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Nov 2022 17:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) client-ip=129.215.16.10;
Received: from exseed.ed.ac.uk (hbdkb3.is.ed.ac.uk [129.215.235.37])
	by loire.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2AI1K1Ef018504
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Nov 2022 01:20:01 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdkb3.is.ed.ac.uk
 (129.215.235.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 01:20:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.173)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 18 Nov 2022 01:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPQ7hShKlYMWTotB4X1Q50KuCKoZKQ9MHzDY6aSn0aWF5qnSQ6o3PhITVNCznhbj+QIiHxoQiCnotPY+A8/xWm3HDmf9b4sS8dJFtKZ7SrZvr1owsb43EbpVOx6sQ/+tLS9EmwYdxRadmMcaFmfwWoRSQhjsvE8AzPWf21qd8yn8F0/F3Hr+G9OZErB+0n8UmzlgLT3+2yEvyJHKmmzTONdz9+tMD7tAusN45b3pAadhnDjDmhyFxI6q95ORQ2RGlh7AXA0Nt9Wy9AZMQZojFlwXxWhudQBdCW+c+rE1R8xbOIjIpH8NPe21N6i6c9hGDaZFUYBvwXjxYodS8NS6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWfCiqfZqzCV6HGQbTa+AjHde52vyvdzR3dCTfDVHxE=;
 b=M2W/0N03zg63EctNLFdqla6q29yem/M3lZB+DxX6tMiUnkk0yiEnNEFzNIDs1EkeOgv0s7LyibYbufqf+G5s2swlLQOV1wXboIACHVojsN9eqY1vyMvQ5H5/n/hmdgmuzI9nEtA4GBRHo44O5ngptztuYZOdQg0fidBoAhmLK3ePsLkFKu6+C4xg9TYYZYgmgZwtL3IJpI1WD0963EWREAVafJrBM9XhYYSjY9ZUNlN8zmnRPd0UayZWN+78raGi90Ys/id5ASQiScG6/7KcRF2ie03rMkgfDyHrIO5V7D/AvEQ+XChx/v+lWnaqmAgDC42PSEvK20/Ngmv50Bi2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by DB9PR05MB9729.eurprd05.prod.outlook.com (2603:10a6:10:3c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 01:19:58 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 01:19:50 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Henning Schild <henning.schild@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCK47kFSAgAHcNMCAALsugIAFv5ZM
Date: Fri, 18 Nov 2022 01:19:50 +0000
Message-ID: <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
	<63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
	<AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
In-Reply-To: <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|DB9PR05MB9729:EE_
x-ms-office365-filtering-correlation-id: 66fb6b9f-d6ec-4f0b-b953-08dac902fd70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yAkmv2Z6HTtV+kNkKYaL9cCr360PySfuf9KDIA3EFdDBfPiu642+kUQEU2HzjokDabCl1wyJiByfWg7Mw1UkrvhEWkWbjtqD7Mzk2D1hhndbzaH0lw1/nKvxQ+gE9e2TtG9StSim3U639kfTbkDma31m5lNuAXhE97/+TKYfNIa0e1IMj1XTTb3BR7hEiS4OxmixNE99lDt5xg8zCY41PfMgOuA9sm1J6ZTNf5L+6RrTGKWre/tR6jsFInBZbKNvEwerQd/dWLpbDVTknYkS90Dn66hs5hrAQNVn2ku7avarJkm5zx+56TMMZkpnFi+zaIOHorQSYb6LlhafZD9wtyUT8ryVZHFLone7OWrI7nUdpG9qB19pT5Sc1nW3z81kfZr5BXaKWuhR4f3rXGqtvRR/r6Oqn6IxD6t2ineKcbAxnsX1I2QZ3fLpWCj0Mtj+gxQowhyLCsYKVY81rwQWvbOcjrowJ//GNX9KKtsyBGS+Tb745J6kL0MhmZgP6QnUndOyejc1YmloGp75BUf7vGQpsPMvd4/h3VF8YEyHc0CTyMVXo5G9Ce4slO4GqwX2i/ymWCnL7SeOZX1NCr0ltL17pwVc0Nl3Ava08U1bZMXY+cngMEDrqXlmQjX8ea3efuPzZikDKt+C8D2obzUcBck3xKmGKQH0APVMN0c9lh9Yvf01aS8eyNCHFJd8yb1dsgTtgngJAIKp+/rjcveuhKyFMZZ71U1gY75VBhZ35qp0BkJir36wZde0A8ZNvL7iZW+wPAC4ZkmkHMIcyjf9qQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(9686003)(53546011)(6506007)(7696005)(30864003)(76116006)(26005)(8936002)(4326008)(64756008)(66476007)(52536014)(5660300002)(66446008)(66556008)(66946007)(38100700002)(166002)(8676002)(41300700001)(186003)(66574015)(478600001)(33656002)(316002)(86362001)(966005)(54906003)(55016003)(786003)(45080400002)(6916009)(91956017)(71200400001)(38070700005)(2906002)(66899015)(83380400001)(41320700001)(122000001)(19627405001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?1VGqg1MPOnFPaOLoTrxYut4qnnQQalwaSob8iHH/6AUeW9zxRDe0tgkS?=
 =?Windows-1252?Q?z6KDdDywpZYGmy4xB0Q14IwXJvKYnh/9m/iiAcHnxzjS4coqLC5TqdpG?=
 =?Windows-1252?Q?mxDcNaOYkKa9KBm9d+cC9TgctgJr5Fu6VUiWkkpc8W4pLlrBgWOw2yaI?=
 =?Windows-1252?Q?tu11HtMug1iIqOljAbRoxJy+/w1AnmErMN/bKvI0/1BLQzj/qdpbgZ8c?=
 =?Windows-1252?Q?3+w5M5UXdtYDshLoF8X2uQEOpPqjHOvVBpjRMmjkiAgBfpwMWE9ZtOHM?=
 =?Windows-1252?Q?lsL5xy14plB+PlmjxFCV5fcFxXikT5D/lIcMgSg89nzs50IUpU05U1EC?=
 =?Windows-1252?Q?jD5uqmXqpygco4+j7ejXihcvrOzHWzmPfW/C9iVl3oiEgrqCFN0cuhMK?=
 =?Windows-1252?Q?7a1m/yP+bCxdDbij6DGbd/Byd8s/8CuvIE/5OtSxEOzo2d3fSc1OlEbS?=
 =?Windows-1252?Q?XNLmmG54XFjoA/z22GZ0T0rVS+uK9EFhlUCylzoGOm6knhj9d8az5jpo?=
 =?Windows-1252?Q?92HxLNBjLe49UVm+A4q2aJZhI3ATJpK+zIh9WWChqCl5e7U5nNIanDl8?=
 =?Windows-1252?Q?ytmAc3HitV0oOUCxvz1g6KUliBjY9SOsBTVBDbB9GeB1XXPsxZAqyIxJ?=
 =?Windows-1252?Q?NXxMgA+l3ZVGwrzqWjViv9xduRGU13CFEzwXhDe+LZ57ylFW3gSUwh80?=
 =?Windows-1252?Q?xQsf3za5ENANMJ/6R68DVOFo2iOgsx5fZHC2wGynvL+Fwm1atpFhV2wZ?=
 =?Windows-1252?Q?iyBUJ7zySpPfp+F7+7qda7lgeWQZORk0TwXQLldSOO5IXKOlt0fkuCi+?=
 =?Windows-1252?Q?pIGYXDE4lpuLSKkX5mIT0H1jxKfStC93YdhjacepkVlrnUJJ1UL83zFV?=
 =?Windows-1252?Q?vnZAU9V9eO/ndFsyYeN/qPIvxnRYniJ6VAmxdWJdU/UA+G8DxVcSMbzU?=
 =?Windows-1252?Q?6OIRdqr6jYfXcTwrlDz+/zsbxKWRzO5YjdUhkhDtWUyQS4e+7saEehZQ?=
 =?Windows-1252?Q?1MTVyZYlCyGDAsnNBbihSLxFtIQhRQzsTaGdKfpPKH1BFTTYOIxSzpiK?=
 =?Windows-1252?Q?S9re/Ezoeguf6EIf8fbuSytz+7N6e8S4+IkOYsx0b22O/8RrohK4oXJK?=
 =?Windows-1252?Q?0Rd89L+CCgJ7v/DxD6u4xwm1fy0Uj1z0PgmmSL65vPoILEi22vQqmVWo?=
 =?Windows-1252?Q?nE/V22zCU6x735Wk4Cjd7jXYvgBfe5sdmjPk6Wlddx0+oFlBYk4JZ4dy?=
 =?Windows-1252?Q?HSYjJWxlQsnrAvtJHnkSjhXX3XZkGxm4oPq/0z5PQsI+rj14wH7wHT2c?=
 =?Windows-1252?Q?f+uOKG8BeUdHQS3vTof8dWbPcN92+1em/AkNgtGPtZQ0vztR4WaBeQrZ?=
 =?Windows-1252?Q?cs8Vl0HG1FYnfKwsVq8PMKaipBK3YQD1ddF2le45SbuROi0rviCz2iFM?=
 =?Windows-1252?Q?WrLlwKHDBaccHEr7yB6FT56Kbo4266RrZAzjtGXHWHgua8hAQLJyuEgb?=
 =?Windows-1252?Q?JHK4h12/8dVNp1fGK5WStl9RT3OTGLxdKjt6EK2m9TP68YYW7vJw1eX6?=
 =?Windows-1252?Q?rC0TGaPTMLcsZfWF589V69xYS+r5OCd3MHqS1hQE49MD2NggIlCPwF/E?=
 =?Windows-1252?Q?t+p2rILOtLJJw9z1fjMzxPJlMCcEbFp91UOxquRInrl8nE9NJbTrz+Fz?=
 =?Windows-1252?Q?iGiEoXUrVpA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB601854C5133C67EE917952B8A9099AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fb6b9f-d6ec-4f0b-b953-08dac902fd70
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 01:19:50.5330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HU+vk8s8We/zXMGO+M7FzjolGAiCvubkCWnDFrD8ke72Bfg7VSOsFCgA8ObIpogNs1Fy1CB1Q5V+1faYk6ireQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR05MB9729
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at loire.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=SF21e4UD;       arc=pass (i=1
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

--_000_AM0PR05MB601854C5133C67EE917952B8A9099AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henning,

I spent some more time debugging the issue.
I am getting a "FATAL: Invalid MMIO/RAM write".
Probably it's happening right after the first cpu that
calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().

Not sure why, but maybe you have some pointers.

Here is the jailhouse output copy-pasted below.

Cheers

Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 813/7635, remap 1/131072
Initializing processors:
 CPU 6... (APIC ID 48) OK
 CPU 64... (APIC ID 1) OK
 CPU 0... (APIC ID 0) OK
 CPU 16... (APIC ID 2) OK
 CPU 112... (APIC ID 7) OK
 CPU 104... (APIC ID 13) OK
 CPU 40... (APIC ID 12) OK
 CPU 72... (APIC ID 9) OK
 CPU 8... (APIC ID 8) OK
 CPU 56... (APIC ID 14) OK
 CPU 120... (APIC ID 15) OK
 CPU 110... (APIC ID 61) OK
 CPU 46... (APIC ID 60) OK
 CPU 14... (APIC ID 56) OK
 CPU 78... (APIC ID 57) OK
 CPU 94... (APIC ID 59) OK
 CPU 30... (APIC ID 58) OK
 CPU 126... (APIC ID 63) OK
 CPU 62... (APIC ID 62) OK
 CPU 2... (APIC ID 16) OK
 CPU 66... (APIC ID 17) OK
 CPU 18... (APIC ID 18) OK
 CPU 82... (APIC ID 19) OK
 CPU 114... (APIC ID 23) OK
 CPU 50... (APIC ID 22) OK
 CPU 98... (APIC ID 21) OK
 CPU 34... (APIC ID 20) OK
 CPU 12... (APIC ID 40) OK
 CPU 76... (APIC ID 41) OK
 CPU 60... (APIC ID 46) OK
 CPU 124... (APIC ID 47) OK
 CPU 44... (APIC ID 44) OK
 CPU 108... (APIC ID 45) OK
 CPU 92... (APIC ID 43) OK
 CPU 28... (APIC ID 42) OK
 CPU 26... (APIC ID 26) OK
 CPU 90... (APIC ID 27) OK
 CPU 74... (APIC ID 25) OK
 CPU 10... (APIC ID 24) OK
 CPU 106... (APIC ID 29) OK
 CPU 42... (APIC ID 28) OK
 CPU 58... (APIC ID 30) OK
 CPU 122... (APIC ID 31) OK
 CPU 20... (APIC ID 34) OK
 CPU 84... (APIC ID 35) OK
 CPU 36... (APIC ID 36) OK
 CPU 100... (APIC ID 37) OK
 CPU 116... (APIC ID 39) OK
 CPU 52... (APIC ID 38) OK
 CPU 4... (APIC ID 32) OK
 CPU 68... (APIC ID 33) OK
 CPU 96... (APIC ID 5) OK
 CPU 32... (APIC ID 4) OK
 CPU 88... (APIC ID 11) OK
 CPU 55... (APIC ID 118) OK
 CPU 119... (APIC ID 119) OK
 CPU 87... (APIC ID 115) OK
 CPU 23... (APIC ID 114) OK
 CPU 71... (APIC ID 113) OK
 CPU 7... (APIC ID 112) OK
 CPU 39... (APIC ID 116) OK
 CPU 103... (APIC ID 117) OK
 CPU 47... (APIC ID 124) OK
 CPU 111... (APIC ID 125) OK
 CPU 15... (APIC ID 120) OK
 CPU 79... (APIC ID 121) OK
 CPU 31... (APIC ID 122) OK
 CPU 95... (APIC ID 123) OK
 CPU 127... (APIC ID 127) OK
 CPU 63... (APIC ID 126) OK
 CPU 86... (APIC ID 51) OK
 CPU 22... (APIC ID 50) OK
 CPU 38... (APIC ID 52) OK
 CPU 102... (APIC ID 53) OK
 CPU 118... (APIC ID 55) OK
 CPU 54... (APIC ID 54) OK
 CPU 70... (APIC ID 49) OK
 CPU 109... (APIC ID 109) OK
 CPU 45... (APIC ID 108) OK
 CPU 93... (APIC ID 107) OK
 CPU 29... (APIC ID 106) OK
 CPU 13... (APIC ID 104) OK
 CPU 77... (APIC ID 105) OK
 CPU 61... (APIC ID 110) OK
 CPU 125... (APIC ID 111) OK
 CPU 5... (APIC ID 96) OK
 CPU 101... (APIC ID 101) OK
 CPU 37... (APIC ID 100) OK
 CPU 85... (APIC ID 99) OK
 CPU 21... (APIC ID 98) OK
 CPU 117... (APIC ID 103) OK
 CPU 53... (APIC ID 102) OK
 CPU 69... (APIC ID 97) OK
 CPU 49... (APIC ID 70) OK
 CPU 1... (APIC ID 64) OK
 CPU 65... (APIC ID 65) OK
 CPU 81... (APIC ID 67) OK
 CPU 17... (APIC ID 66) OK
 CPU 97... (APIC ID 69) OK
 CPU 33... (APIC ID 68) OK
 CPU 113... (APIC ID 71) OK
 CPU 25... (APIC ID 74) OK
 CPU 89... (APIC ID 75) OK
 CPU 41... (APIC ID 76) OK
 CPU 105... (APIC ID 77) OK
 CPU 9... (APIC ID 72) OK
 CPU 73... (APIC ID 73) OK
 CPU 121... (APIC ID 79) OK
 CPU 57... (APIC ID 78) OK
 CPU 3... (APIC ID 80) OK
 CPU 67... (APIC ID 81) OK
 CPU 35... (APIC ID 84) OK
 CPU 99... (APIC ID 85) OK
 CPU 115... (APIC ID 87) OK
 CPU 51... (APIC ID 86) OK
 CPU 19... (APIC ID 82) OK
 CPU 83... (APIC ID 83) OK
 CPU 107... (APIC ID 93) OK
 CPU 43... (APIC ID 92) OK
 CPU 11... (APIC ID 88) OK
 CPU 75... (APIC ID 89) OK
 CPU 123... (APIC ID 95) OK
 CPU 59... (APIC ID 94) OK
 CPU 27... (APIC ID 90) OK
 CPU 24... (APIC ID 10) OK
 CPU 80... (APIC ID 3) OK
 CPU 48... (APIC ID 6) OK
 CPU 91... (APIC ID 91) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xa1700000/0x80000
Initializing unit: IOAPIC
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.1 to cell "RootCell"
Adding PCI device 00:01.3 to cell "RootCell"
Adding PCI device 00:01.4 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
Adding PCI device 00:04.0 to cell "RootCell"
Adding PCI device 00:07.0 to cell "RootCell"
Adding PCI device 00:07.1 to cell "RootCell"
Adding PCI device 00:08.0 to cell "RootCell"
Adding PCI device 00:08.1 to cell "RootCell"
Adding PCI device 00:14.0 to cell "RootCell"
Adding PCI device 00:14.3 to cell "RootCell"
Adding PCI device 00:18.0 to cell "RootCell"
Adding PCI device 00:18.1 to cell "RootCell"
Adding PCI device 00:18.2 to cell "RootCell"
Adding PCI device 00:18.3 to cell "RootCell"
Adding PCI device 00:18.4 to cell "RootCell"
Adding PCI device 00:18.5 to cell "RootCell"
Adding PCI device 00:18.6 to cell "RootCell"
Adding PCI device 00:18.7 to cell "RootCell"
Adding PCI device 00:19.0 to cell "RootCell"
Adding PCI device 00:19.1 to cell "RootCell"
Adding PCI device 00:19.2 to cell "RootCell"
Adding PCI device 00:19.3 to cell "RootCell"
Adding PCI device 00:19.4 to cell "RootCell"
Adding PCI device 00:19.5 to cell "RootCell"
Adding PCI device 00:19.6 to cell "RootCell"
Adding PCI device 00:19.7 to cell "RootCell"
Adding PCI device 00:1a.0 to cell "RootCell"
Adding PCI device 00:1a.1 to cell "RootCell"
Adding PCI device 00:1a.2 to cell "RootCell"
Adding PCI device 00:1a.3 to cell "RootCell"
Adding PCI device 00:1a.4 to cell "RootCell"
Adding PCI device 00:1a.5 to cell "RootCell"
Adding PCI device 00:1a.6 to cell "RootCell"
Adding PCI device 00:1a.7 to cell "RootCell"
Adding PCI device 00:1b.0 to cell "RootCell"
Adding PCI device 00:1b.1 to cell "RootCell"
Adding PCI device 00:1b.2 to cell "RootCell"
Adding PCI device 00:1b.3 to cell "RootCell"
Adding PCI device 00:1b.4 to cell "RootCell"
Adding PCI device 00:1b.5 to cell "RootCell"
Adding PCI device 00:1b.6 to cell "RootCell"
Adding PCI device 00:1b.7 to cell "RootCell"
Adding PCI device 00:1c.0 to cell "RootCell"
Adding PCI device 00:1c.1 to cell "RootCell"
Adding PCI device 00:1c.2 to cell "RootCell"
Adding PCI device 00:1c.3 to cell "RootCell"
Adding PCI device 00:1c.4 to cell "RootCell"
Adding PCI device 00:1c.5 to cell "RootCell"
Adding PCI device 00:1c.6 to cell "RootCell"
Adding PCI device 00:1c.7 to cell "RootCell"
Adding PCI device 00:1d.0 to cell "RootCell"
Adding PCI device 00:1d.1 to cell "RootCell"
Adding PCI device 00:1d.2 to cell "RootCell"
Adding PCI device 00:1d.3 to cell "RootCell"
Adding PCI device 00:1d.4 to cell "RootCell"
Adding PCI device 00:1d.5 to cell "RootCell"
Adding PCI device 00:1d.6 to cell "RootCell"
Adding PCI device 00:1d.7 to cell "RootCell"
Adding PCI device 00:1e.0 to cell "RootCell"
Adding PCI device 00:1e.1 to cell "RootCell"
Adding PCI device 00:1e.2 to cell "RootCell"
Adding PCI device 00:1e.3 to cell "RootCell"
Adding PCI device 00:1e.4 to cell "RootCell"
Adding PCI device 00:1e.5 to cell "RootCell"
Adding PCI device 00:1e.6 to cell "RootCell"
Adding PCI device 00:1e.7 to cell "RootCell"
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.1 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Adding PCI device 00:1f.3 to cell "RootCell"
Adding PCI device 00:1f.4 to cell "RootCell"
Adding PCI device 00:1f.5 to cell "RootCell"
Adding PCI device 00:1f.6 to cell "RootCell"
Adding PCI device 00:1f.7 to cell "RootCell"
Adding PCI device 01:00.0 to cell "RootCell"
Adding PCI device 01:00.1 to cell "RootCell"
Adding PCI device 02:00.0 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 04:00.0 to cell "RootCell"
Adding PCI device 04:00.1 to cell "RootCell"
Adding PCI device 05:00.0 to cell "RootCell"
Adding PCI device 05:00.2 to cell "RootCell"
Adding PCI device 05:00.3 to cell "RootCell"
Adding PCI device 06:00.0 to cell "RootCell"
Adding PCI device 06:00.1 to cell "RootCell"
Adding PCI device 06:00.2 to cell "RootCell"
Adding PCI device 20:00.0 to cell "RootCell"
Adding PCI device 20:00.2 to cell "RootCell"
Adding PCI device 20:01.0 to cell "RootCell"
Adding PCI device 20:01.1 to cell "RootCell"
Adding PCI device 20:02.0 to cell "RootCell"
Adding PCI device 20:03.0 to cell "RootCell"
Adding PCI device 20:04.0 to cell "RootCell"
Adding PCI device 20:07.0 to cell "RootCell"
Adding PCI device 20:07.1 to cell "RootCell"
Adding PCI device 20:08.0 to cell "RootCell"
Adding PCI device 20:08.1 to cell "RootCell"
Adding PCI device 21:00.0 to cell "RootCell"
Adding PCI device 21:00.1 to cell "RootCell"
Adding PCI device 22:08.0 to cell "RootCell"
Adding PCI device 23:00.0 to cell "RootCell"
Adding PCI device 24:00.0 to cell "RootCell"
Adding PCI device 24:00.2 to cell "RootCell"
Adding PCI device 24:00.3 to cell "RootCell"
Adding PCI device 25:00.0 to cell "RootCell"
Adding PCI device 25:00.1 to cell "RootCell"
Adding PCI device 40:00.0 to cell "RootCell"
Adding PCI device 40:00.2 to cell "RootCell"
Adding PCI device 40:01.0 to cell "RootCell"
Adding PCI device 40:02.0 to cell "RootCell"
Adding PCI device 40:03.0 to cell "RootCell"
Adding PCI device 40:03.1 to cell "RootCell"
Adding PCI device 40:04.0 to cell "RootCell"
Adding PCI device 40:07.0 to cell "RootCell"
Adding PCI device 40:07.1 to cell "RootCell"
Adding PCI device 40:08.0 to cell "RootCell"
Adding PCI device 40:08.1 to cell "RootCell"
Adding PCI device 41:00.0 to cell "RootCell"
Adding PCI device 41:00.1 to cell "RootCell"
Adding PCI device 42:00.0 to cell "RootCell"
Adding PCI device 42:00.2 to cell "RootCell"
Adding PCI device 43:00.0 to cell "RootCell"
Adding PCI device 43:00.1 to cell "RootCell"
Adding PCI device 60:00.0 to cell "RootCell"
Adding PCI device 60:00.2 to cell "RootCell"
Adding PCI device 60:01.0 to cell "RootCell"
Adding PCI device 60:02.0 to cell "RootCell"
Adding PCI device 60:03.0 to cell "RootCell"
Adding PCI device 60:03.1 to cell "RootCell"
Adding PCI device 60:04.0 to cell "RootCell"
Adding PCI device 60:07.0 to cell "RootCell"
Adding PCI device 60:07.1 to cell "RootCell"
Adding PCI device 60:08.0 to cell "RootCell"
Adding PCI device 60:08.1 to cell "RootCell"
Adding PCI device 61:00.0 to cell "RootCell"
Adding PCI device 62:00.0 to cell "RootCell"
Adding PCI device 62:00.2 to cell "RootCell"
Adding PCI device 63:00.0 to cell "RootCell"
Adding PCI device 63:00.1 to cell "RootCell"
Adding PCI device 80:00.0 to cell "RootCell"
Adding PCI device 80:00.2 to cell "RootCell"
Adding PCI device 80:01.0 to cell "RootCell"
Adding PCI device 80:02.0 to cell "RootCell"
Adding PCI device 80:03.0 to cell "RootCell"
Adding PCI device 80:04.0 to cell "RootCell"
Adding PCI device 80:07.0 to cell "RootCell"
Adding PCI device 80:07.1 to cell "RootCell"
Adding PCI device 80:08.0 to cell "RootCell"
Adding PCI device 80:08.1 to cell "RootCell"
Adding PCI device 81:00.0 to cell "RootCell"
Adding PCI device 81:00.2 to cell "RootCell"
Adding PCI device 82:00.0 to cell "RootCell"
Adding PCI device 82:00.1 to cell "RootCell"
Adding PCI device a0:00.0 to cell "RootCell"
Adding PCI device a0:00.2 to cell "RootCell"
Adding PCI device a0:01.0 to cell "RootCell"
Adding PCI device a0:02.0 to cell "RootCell"
Adding PCI device a0:03.0 to cell "RootCell"
Adding PCI device a0:04.0 to cell "RootCell"
Adding PCI device a0:07.0 to cell "RootCell"
Adding PCI device a0:07.1 to cell "RootCell"
Adding PCI device a0:08.0 to cell "RootCell"
Adding PCI device a0:08.1 to cell "RootCell"
Adding PCI device a1:00.0 to cell "RootCell"
Adding PCI device a1:00.2 to cell "RootCell"
Adding PCI device a2:00.0 to cell "RootCell"
Adding PCI device a2:00.1 to cell "RootCell"
Adding PCI device c0:00.0 to cell "RootCell"
Adding PCI device c0:00.2 to cell "RootCell"
Adding PCI device c0:01.0 to cell "RootCell"
Adding PCI device c0:02.0 to cell "RootCell"
Adding PCI device c0:03.0 to cell "RootCell"
Adding PCI device c0:03.1 to cell "RootCell"
Adding PCI device c0:03.2 to cell "RootCell"
Adding PCI device c0:03.3 to cell "RootCell"
Adding PCI device c0:03.4 to cell "RootCell"
Adding PCI device c0:04.0 to cell "RootCell"
Adding PCI device c0:07.0 to cell "RootCell"
Adding PCI device c0:07.1 to cell "RootCell"
Adding PCI device c0:08.0 to cell "RootCell"
Adding PCI device c0:08.1 to cell "RootCell"
Adding PCI device c1:00.0 to cell "RootCell"
Adding PCI device c2:00.0 to cell "RootCell"
Adding PCI device c3:00.0 to cell "RootCell"
Adding PCI device c4:00.0 to cell "RootCell"
Adding PCI device c5:00.0 to cell "RootCell"
Adding PCI device c5:00.2 to cell "RootCell"
Adding PCI device c6:00.0 to cell "RootCell"
Adding PCI device c6:00.1 to cell "RootCell"
Adding PCI device e0:00.0 to cell "RootCell"
Adding PCI device e0:00.2 to cell "RootCell"
Adding PCI device e0:01.0 to cell "RootCell"
Adding PCI device e0:02.0 to cell "RootCell"
Adding PCI device e0:03.0 to cell "RootCell"
Adding PCI device e0:04.0 to cell "RootCell"
Adding PCI device e0:07.0 to cell "RootCell"
Adding PCI device e0:07.1 to cell "RootCell"
Adding PCI device e0:08.0 to cell "RootCell"
Adding PCI device e0:08.1 to cell "RootCell"
Adding PCI device e1:00.0 to cell "RootCell"
Adding PCI device e1:00.2 to cell "RootCell"
Adding PCI device e2:00.0 to cell "RootCell"
Adding PCI device e2:00.1 to cell "RootCell"
Page pool usage after late setup: mem 1927/7635, remap 65703/131072
FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4
RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6
RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000000000030
RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffffff003
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003506e0
EFER: 0x0000000000001d01
Parking CPU 76 (Cell: "RootCell")
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 5
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
Ignoring NMI IPI to CPU 76
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 5
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
Ignoring NMI IPI to CPU 76
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 5
FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46
RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000000b4
RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa9401790
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003506e0
EFER: 0x0000000000001d01
Parking CPU 24 (Cell: "RootCell")
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
FATAL: Unhandled MSR read: c0002001
RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246
RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c0002001
RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c0002001
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003506e0
EFER: 0x0000000000001d01
Parking CPU 68 (Cell: "RootCell")
FATAL: Unhandled MSR read: c0002001
RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246
RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c0002001
RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c0002001
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003506e0
EFER: 0x0000000000001d01
Parking CPU 44 (Cell: "RootCell")

________________________________
From: Henning Schild <henning.schild@siemens.com>
Sent: 14 November 2022 09:22
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; jan.kiszka@siemens.com=
 <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com <jailhouse-dev@go=
oglegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

Am Sun, 13 Nov 2022 22:24:45 +0000
schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:

> Hi Ralf,
>
> Thanks for the reply!
>
> >Did you use jailhouse-config-create?
>
> I am using `jailhouse config create` to generate the sysconfig.c file.
>
> >You can use the --mem-hv option to
> increate the memory. Try, for example, 32MiB and see if it works.
>
> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
> The driver prints "The Jailhouse is opening" on dmesg. However, right
> after that the CPUs get stuck, and I get rcu_sched detected stalls.
> The system is completely irresponsive.
>
> I attached a text file containing the full output from dmesg. Here is
> the initial part:

I guess the output of the hypervisor might also be valuable here.
According to its spec that machine should have a serial port, and with
that default config from the generate script you should see logs coming
out of there. With the usual 115200 8n1

Henning

> [  434.792008] The Jailhouse is opening.
> [  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  455.793303] rcu:     1-...0: (839 GPs behind)
> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [  455.80229=
2]
> rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x4000000000000000
> softirq=3D905/905 fqs=3D1827 [  455.811276] rcu:     3-...0: (144 GPs
> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
> 455.820266] rcu:     4-...0: (1 GPs behind)
> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
> 455.829252] rcu:     5-...0: (144 GPs behind)
> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [  455.83823=
8]
> rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x4000000000000000
> softirq=3D777/777 fqs=3D1827 [  455.847218] rcu:     7-...0: (144 GPs
> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827 [
> 455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364) [
> 455.862170] Sending NMI from CPU 87 to CPUs 1: [  465.776884] Sending
> NMI from CPU 87 to CPUs 2: [  467.182686] watchdog: BUG: soft lockup
> - CPU#0 stuck for 23s! [kworker/0:1:7] [  467.189857] Modules linked
> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
> 467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4
> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
> raid6_pq ] [  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G
>          O      5.10.0 #3 [  467.328767] Hardware name: Dell Inc.
> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [  467.337154]
> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
> [  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
> 0000000000000001 [  467.385123] RDX: ffff964f1fa31280 RSI:
> 0000000000000000 RDI: 0000000000000001 [  467.393024] RBP:
> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
> 0000000000000000 [  467.408836] R13: 000000000000007f R14:
> ffff962f1f42c9c0 R15: 0000000000000080 [  467.416737] FS:
> 0000000000000000(0000) GS:ffff962f1f400000(0000)
> knlGS:0000000000000000 [  467.425604] CS:  0010 DS: 0000 ES: 0000
> CR0: 0000000080050033 [  467.432127] CR2: 0000000000000000 CR3:
> 00000010987ea000 CR4: 00000000003506f0 [  467.440045] Call Trace: [
> 467.443289]  ? tlbflush_read_file+0x70/0x70 [  467.448266]  ?
> tlbflush_read_file+0x70/0x70 [  467.453242]  on_each_cpu+0x2b/0x60 [
> 467.457437]  __purge_vmap_area_lazy+0x5d/0x680 [  467.462679]  ?
> _cond_resched+0x16/0x40 [  467.467224]  ?
> unmap_kernel_range_noflush+0x2fa/0x380 [  467.473072]
> free_vmap_area_noflush+0xe7/0x100 [  467.478315]
> remove_vm_area+0x96/0xa0 [  467.482770]  __vunmap+0x8d/0x290 [
> 467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [  467.492299]
> drm_client_buffer_vunmap+0x16/0x20 [drm] [  467.498144]
> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [  467.505118]
> process_one_work+0x1b6/0x350 [  467.509912]  worker_thread+0x53/0x3e0
> [  467.514361]  ? process_one_work+0x350/0x350 [  467.519338]
> kthread+0x11b/0x140 [  467.523342]  ? __kthread_bind_mask+0x60/0x60 [
>  467.528389]  ret_from_fork+0x22/0x30
>
> Cheers
> Karim
> ________________________________
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Sent: 12 November 2022 17:47
> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
> enter_hypervisor returns -ENOMEM
>
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that
> the email is genuine and the content is safe.
>
> On 12/11/2022 18:15, Karim Manaouil wrote:
> > Hi Jan,
> >
> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
> > nodes), running Linux kernel v5.10 (same version used by jailhouse
> > CI with same patches applied).
> >
> > `jailhouse hardware check` return that everything is ok and that
> > "Check passed!".
> >
> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
> >
> > However, enter_hypervisor() [1] fails when entry() is called on
> > every cpu and return -ENOMEM as error_code.
>
> Try to reserve more memory. Maybe the default size of 6MiB for HV
> memory is insufficient for 128 CPUs.
>
> Did you use jailhouse-config-create? You can use the --mem-hv option
> to increate the memory. Try, for example, 32MiB and see if it works.
>
>    Ralf
>
> >
> > Do you possibly know where could the issue come from?
> >
> > Best
> > Karim
> >
> > [1]
> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6=
e2cbd99f9fc/driver/main.c#L251
> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef=
6e2cbd99f9fc/driver/main.c#L251>
> >
> > The University of Edinburgh is a charitable body, registered in
> > Scotland, with registration number SC005336. Is e buidheann
> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=
=A0raichte an Alba,
> > =C3=A0ireamh cl=C3=A0raidh SC005336.
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61=
DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com
> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Dema=
il&utm_source=3Dfooter>.
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB601854C5133C67EE917952B8A9099%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB601854C5133C67EE917952B8A9099AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi Henning,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
I spent some more time debugging the issue.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
I am getting a &quot;FATAL: Invalid MMIO/RAM write&quot;.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
Probably it's happening right after the first cpu that</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Not sure why, but maybe you have some pointers.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Here is the jailhouse output copy-pasted below.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Cheers</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted1">
Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
<div class=3D"ContentPasted1">Code location: 0xfffffffff0000050</div>
<div class=3D"ContentPasted1">Using xAPIC</div>
<div class=3D"ContentPasted1">Page pool usage after early setup: mem 813/76=
35, remap 1/131072</div>
<div class=3D"ContentPasted1">Initializing processors:</div>
<div class=3D"ContentPasted1">&nbsp;CPU 6... (APIC ID 48) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 64... (APIC ID 1) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 0... (APIC ID 0) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 16... (APIC ID 2) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 112... (APIC ID 7) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 104... (APIC ID 13) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 40... (APIC ID 12) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 72... (APIC ID 9) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 8... (APIC ID 8) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 56... (APIC ID 14) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 120... (APIC ID 15) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 110... (APIC ID 61) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 46... (APIC ID 60) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 14... (APIC ID 56) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 78... (APIC ID 57) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 94... (APIC ID 59) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 30... (APIC ID 58) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 126... (APIC ID 63) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 62... (APIC ID 62) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 2... (APIC ID 16) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 66... (APIC ID 17) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 18... (APIC ID 18) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 82... (APIC ID 19) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 114... (APIC ID 23) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 50... (APIC ID 22) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 98... (APIC ID 21) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 34... (APIC ID 20) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 12... (APIC ID 40) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 76... (APIC ID 41) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 60... (APIC ID 46) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 124... (APIC ID 47) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 44... (APIC ID 44) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 108... (APIC ID 45) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 92... (APIC ID 43) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 28... (APIC ID 42) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 26... (APIC ID 26) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 90... (APIC ID 27) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 74... (APIC ID 25) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 10... (APIC ID 24) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 106... (APIC ID 29) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 42... (APIC ID 28) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 58... (APIC ID 30) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 122... (APIC ID 31) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 20... (APIC ID 34) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 84... (APIC ID 35) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 36... (APIC ID 36) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 100... (APIC ID 37) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 116... (APIC ID 39) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 52... (APIC ID 38) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 4... (APIC ID 32) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 68... (APIC ID 33) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 96... (APIC ID 5) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 32... (APIC ID 4) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 88... (APIC ID 11) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 55... (APIC ID 118) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 119... (APIC ID 119) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 87... (APIC ID 115) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 23... (APIC ID 114) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 71... (APIC ID 113) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 7... (APIC ID 112) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 39... (APIC ID 116) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 103... (APIC ID 117) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 47... (APIC ID 124) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 111... (APIC ID 125) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 15... (APIC ID 120) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 79... (APIC ID 121) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 31... (APIC ID 122) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 95... (APIC ID 123) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 127... (APIC ID 127) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 63... (APIC ID 126) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 86... (APIC ID 51) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 22... (APIC ID 50) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 38... (APIC ID 52) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 102... (APIC ID 53) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 118... (APIC ID 55) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 54... (APIC ID 54) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 70... (APIC ID 49) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 109... (APIC ID 109) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 45... (APIC ID 108) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 93... (APIC ID 107) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 29... (APIC ID 106) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 13... (APIC ID 104) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 77... (APIC ID 105) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 61... (APIC ID 110) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 125... (APIC ID 111) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 5... (APIC ID 96) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 101... (APIC ID 101) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 37... (APIC ID 100) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 85... (APIC ID 99) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 21... (APIC ID 98) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 117... (APIC ID 103) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 53... (APIC ID 102) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 69... (APIC ID 97) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 49... (APIC ID 70) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 1... (APIC ID 64) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 65... (APIC ID 65) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 81... (APIC ID 67) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 17... (APIC ID 66) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 97... (APIC ID 69) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 33... (APIC ID 68) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 113... (APIC ID 71) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 25... (APIC ID 74) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 89... (APIC ID 75) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 41... (APIC ID 76) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 105... (APIC ID 77) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 9... (APIC ID 72) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 73... (APIC ID 73) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 121... (APIC ID 79) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 57... (APIC ID 78) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 3... (APIC ID 80) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 67... (APIC ID 81) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 35... (APIC ID 84) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 99... (APIC ID 85) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 115... (APIC ID 87) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 51... (APIC ID 86) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 19... (APIC ID 82) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 83... (APIC ID 83) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 107... (APIC ID 93) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 43... (APIC ID 92) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 11... (APIC ID 88) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 75... (APIC ID 89) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 123... (APIC ID 95) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 59... (APIC ID 94) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 27... (APIC ID 90) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 24... (APIC ID 10) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 80... (APIC ID 3) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 48... (APIC ID 6) OK</div>
<div class=3D"ContentPasted1">&nbsp;CPU 91... (APIC ID 91) OK</div>
<div class=3D"ContentPasted1">Initializing unit: AMD IOMMU</div>
<div class=3D"ContentPasted1">AMD IOMMU @0xa1700000/0x80000</div>
<div class=3D"ContentPasted1">Initializing unit: IOAPIC</div>
<div class=3D"ContentPasted1">Initializing unit: PCI</div>
<div class=3D"ContentPasted1">Adding PCI device 00:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:01.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:01.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:01.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:14.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:14.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:18.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:19.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1a.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1b.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1c.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1d.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1e.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.5 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.6 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 00:1f.7 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 01:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 01:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 02:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 03:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 04:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 04:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 05:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 05:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 05:00.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 06:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 06:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 06:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:01.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 20:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 21:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 21:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 22:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 23:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 24:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 24:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 24:00.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 25:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 25:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:03.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 40:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 41:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 41:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 42:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 42:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 43:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 43:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:03.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 60:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 61:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 62:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 62:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 63:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 63:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 80:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 81:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 81:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 82:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device 82:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a0:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a1:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a1:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a2:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device a2:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:03.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:03.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:03.3 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:03.4 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c0:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c1:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c2:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c3:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c4:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c5:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c5:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c6:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device c6:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:01.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:02.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:03.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:04.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:07.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:07.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:08.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e0:08.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e1:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e1:00.2 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e2:00.0 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Adding PCI device e2:00.1 to cell &quot;RootC=
ell&quot;</div>
<div class=3D"ContentPasted1">Page pool usage after late setup: mem 1927/76=
35, remap 65703/131072</div>
<div class=3D"ContentPasted1">FATAL: Invalid MMIO/RAM write, addr: 0x000000=
00a1702008 size: 4</div>
<div class=3D"ContentPasted1">RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78d=
e0 FLAGS: 6</div>
<div class=3D"ContentPasted1">RAX: 0xffffa2f7c0080000 RBX: 0x00000000000000=
01 RCX: 0x0000000000000030</div>
<div class=3D"ContentPasted1">RDX: 0xffff90d18000a000 RSI: 0x30000017000000=
00 RDI: 0x7ffffffffffff003</div>
<div class=3D"ContentPasted1">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted1">CR0: 0x0000000080050033 CR3: 0x000000014487c0=
00 CR4: 0x00000000003506e0</div>
<div class=3D"ContentPasted1">EFER: 0x0000000000001d01</div>
<div class=3D"ContentPasted1">Parking CPU 76 (Cell: &quot;RootCell&quot;)</=
div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 1</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 2</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 3</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 4</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 5</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 6</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 7</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 76</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 1</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 2</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 3</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 4</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 5</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 6</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 7</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 76</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 1</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 2</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 3</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 4</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 5</div>
<div class=3D"ContentPasted1">FATAL: Invalid PCI config write, device 04:00=
.0, reg: 0xb4, size: 2</div>
<div class=3D"ContentPasted1">RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd=
98 FLAGS: 46</div>
<div class=3D"ContentPasted1">RAX: 0x000000000000242e RBX: 0x00000000000000=
00 RCX: 0x00000000000000b4</div>
<div class=3D"ContentPasted1">RDX: 0x0000000000000cfc RSI: 0x00000000000002=
16 RDI: 0xffffffffa9401790</div>
<div class=3D"ContentPasted1">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted1">CR0: 0x0000000080050033 CR3: 0x0000003b998100=
00 CR4: 0x00000000003506e0</div>
<div class=3D"ContentPasted1">EFER: 0x0000000000001d01</div>
<div class=3D"ContentPasted1">Parking CPU 24 (Cell: &quot;RootCell&quot;)</=
div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 6</div>
<div class=3D"ContentPasted1">Ignoring NMI IPI to CPU 7</div>
<div class=3D"ContentPasted1">FATAL: Unhandled MSR read: c0002001</div>
<div class=3D"ContentPasted1">RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e=
08 FLAGS: 246</div>
<div class=3D"ContentPasted1">RAX: 0x00000000c0002000 RBX: 0xffff90e15fc110=
20 RCX: 0x00000000c0002001</div>
<div class=3D"ContentPasted1">RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918d=
f0 RDI: 0x00000000c0002001</div>
<div class=3D"ContentPasted1">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted1">CR0: 0x0000000080050033 CR3: 0x00000018a6a460=
00 CR4: 0x00000000003506e0</div>
<div class=3D"ContentPasted1">EFER: 0x0000000000001d01</div>
<div class=3D"ContentPasted1">Parking CPU 68 (Cell: &quot;RootCell&quot;)</=
div>
<div class=3D"ContentPasted1">FATAL: Unhandled MSR read: c0002001</div>
<div class=3D"ContentPasted1">RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e=
08 FLAGS: 246</div>
<div class=3D"ContentPasted1">RAX: 0x00000000c0002000 RBX: 0xffff90e15fb510=
20 RCX: 0x00000000c0002001</div>
<div class=3D"ContentPasted1">RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8d=
f0 RDI: 0x00000000c0002001</div>
<div class=3D"ContentPasted1">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted1">CR0: 0x0000000080050033 CR3: 0x0000002081eaa0=
00 CR4: 0x00000000003506e0</div>
<div class=3D"ContentPasted1">EFER: 0x0000000000001d01</div>
<div class=3D"ContentPasted1">Parking CPU 44 (Cell: &quot;RootCell&quot;)</=
div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Henning Schild &lt;he=
nning.schild@siemens.com&gt;<br>
<b>Sent:</b> 14 November 2022 09:22<br>
<b>To:</b> Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
<b>Cc:</b> Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;; jan.kiszk=
a@siemens.com &lt;jan.kiszka@siemens.com&gt;; jailhouse-dev@googlegroups.co=
m &lt;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: Jailhouse: enter_hypervisor returns -ENOMEM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
Am Sun, 13 Nov 2022 22:24:45 +0000<br>
schrieb Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;:<br>
<br>
&gt; Hi Ralf,<br>
&gt;<br>
&gt; Thanks for the reply!<br>
&gt;<br>
&gt; &gt;Did you use jailhouse-config-create?<br>
&gt;<br>
&gt; I am using `jailhouse config create` to generate the sysconfig.c file.=
<br>
&gt;<br>
&gt; &gt;You can use the --mem-hv option to<br>
&gt; increate the memory. Try, for example, 32MiB and see if it works.<br>
&gt;<br>
&gt; I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.<br>
&gt; The driver prints &quot;The Jailhouse is opening&quot; on dmesg. Howev=
er, right<br>
&gt; after that the CPUs get stuck, and I get rcu_sched detected stalls.<br=
>
&gt; The system is completely irresponsive.<br>
&gt;<br>
&gt; I attached a text file containing the full output from dmesg. Here is<=
br>
&gt; the initial part:<br>
<br>
I guess the output of the hypervisor might also be valuable here.<br>
According to its spec that machine should have a serial port, and with<br>
that default config from the generate script you should see logs coming<br>
out of there. With the usual 115200 8n1<br>
<br>
Henning<br>
<br>
&gt; [&nbsp; 434.792008] The Jailhouse is opening.<br>
&gt; [&nbsp; 455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks=
:<br>
&gt; [&nbsp; 455.793303] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 1-...0: (839 GPs behi=
nd)<br>
&gt; idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [&nbsp; 4=
55.802292]<br>
&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 2-...0: (144 GPs behind) idle=3D812/1/0x4=
000000000000000<br>
&gt; softirq=3D905/905 fqs=3D1827 [&nbsp; 455.811276] rcu:&nbsp;&nbsp;&nbsp=
;&nbsp; 3-...0: (144 GPs<br>
&gt; behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [=
<br>
&gt; 455.820266] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 4-...0: (1 GPs behind)<br>
&gt; idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [<br>
&gt; 455.829252] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 5-...0: (144 GPs behind)<br>
&gt; idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [&nbsp; 4=
55.838238]<br>
&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 6-...0: (144 GPs behind) idle=3D912/1/0x4=
000000000000000<br>
&gt; softirq=3D777/777 fqs=3D1827 [&nbsp; 455.847218] rcu:&nbsp;&nbsp;&nbsp=
;&nbsp; 7-...0: (144 GPs<br>
&gt; behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827=
 [<br>
&gt; 455.856404]&nbsp; (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D36=
4) [<br>
&gt; 455.862170] Sending NMI from CPU 87 to CPUs 1: [&nbsp; 465.776884] Sen=
ding<br>
&gt; NMI from CPU 87 to CPUs 2: [&nbsp; 467.182686] watchdog: BUG: soft loc=
kup<br>
&gt; - CPU#0 stuck for 23s! [kworker/0:1:7] [&nbsp; 467.189857] Modules lin=
ked<br>
&gt; in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype<br>
&gt; br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT<br>
&gt; nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [<br>
&gt; 467.189928]&nbsp; binfmt_misc configfs efivarfs ip_tables x_tables aut=
ofs4<br>
&gt; ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic<br>
&gt; async_raid6_recov async_memcpy async_pq async_xor xor async_tx<br>
&gt; raid6_pq ] [&nbsp; 467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted=
: G<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 5.10.0 #3 [&nbsp; 467.328767] Hardware name: Dell Inc.<br>
&gt; PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [&nbsp; 467.337154]<br>
&gt; Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [<br>
&gt; 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [<br>
&gt; 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe<b=
r>
&gt; ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09<b=
r>
&gt; f3 90 &lt;8b&gt; 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe=
 44 7<br>
&gt; [&nbsp; 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [<br>
&gt; 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:<br>
&gt; 0000000000000001 [&nbsp; 467.385123] RDX: ffff964f1fa31280 RSI:<br>
&gt; 0000000000000000 RDI: 0000000000000001 [&nbsp; 467.393024] RBP:<br>
&gt; 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [<br>
&gt; 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:<br>
&gt; 0000000000000000 [&nbsp; 467.408836] R13: 000000000000007f R14:<br>
&gt; ffff962f1f42c9c0 R15: 0000000000000080 [&nbsp; 467.416737] FS:<br>
&gt; 0000000000000000(0000) GS:ffff962f1f400000(0000)<br>
&gt; knlGS:0000000000000000 [&nbsp; 467.425604] CS:&nbsp; 0010 DS: 0000 ES:=
 0000<br>
&gt; CR0: 0000000080050033 [&nbsp; 467.432127] CR2: 0000000000000000 CR3:<b=
r>
&gt; 00000010987ea000 CR4: 00000000003506f0 [&nbsp; 467.440045] Call Trace:=
 [<br>
&gt; 467.443289]&nbsp; ? tlbflush_read_file+0x70/0x70 [&nbsp; 467.448266]&n=
bsp; ?<br>
&gt; tlbflush_read_file+0x70/0x70 [&nbsp; 467.453242]&nbsp; on_each_cpu+0x2=
b/0x60 [<br>
&gt; 467.457437]&nbsp; __purge_vmap_area_lazy+0x5d/0x680 [&nbsp; 467.462679=
]&nbsp; ?<br>
&gt; _cond_resched+0x16/0x40 [&nbsp; 467.467224]&nbsp; ?<br>
&gt; unmap_kernel_range_noflush+0x2fa/0x380 [&nbsp; 467.473072]<br>
&gt; free_vmap_area_noflush+0xe7/0x100 [&nbsp; 467.478315]<br>
&gt; remove_vm_area+0x96/0xa0 [&nbsp; 467.482770]&nbsp; __vunmap+0x8d/0x290=
 [<br>
&gt; 467.486792]&nbsp; drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [&nbsp; 467.492=
299]<br>
&gt; drm_client_buffer_vunmap+0x16/0x20 [drm] [&nbsp; 467.498144]<br>
&gt; drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [&nbsp; 467.5051=
18]<br>
&gt; process_one_work+0x1b6/0x350 [&nbsp; 467.509912]&nbsp; worker_thread+0=
x53/0x3e0<br>
&gt; [&nbsp; 467.514361]&nbsp; ? process_one_work+0x350/0x350 [&nbsp; 467.5=
19338]<br>
&gt; kthread+0x11b/0x140 [&nbsp; 467.523342]&nbsp; ? __kthread_bind_mask+0x=
60/0x60 [<br>
&gt;&nbsp; 467.528389]&nbsp; ret_from_fork+0x22/0x30<br>
&gt;<br>
&gt; Cheers<br>
&gt; Karim<br>
&gt; ________________________________<br>
&gt; From: Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br>
&gt; Sent: 12 November 2022 17:47<br>
&gt; To: Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; jan.kiszka@siemens=
.com<br>
&gt; &lt;jan.kiszka@siemens.com&gt; Cc: jailhouse-dev@googlegroups.com<br>
&gt; &lt;jailhouse-dev@googlegroups.com&gt; Subject: Re: Jailhouse:<br>
&gt; enter_hypervisor returns -ENOMEM<br>
&gt;<br>
&gt; This email was sent to you by someone outside the University.<br>
&gt; You should only click on links or attachments if you are certain that<=
br>
&gt; the email is genuine and the content is safe.<br>
&gt;<br>
&gt; On 12/11/2022 18:15, Karim Manaouil wrote:<br>
&gt; &gt; Hi Jan,<br>
&gt; &gt;<br>
&gt; &gt; I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 N=
UMA<br>
&gt; &gt; nodes), running Linux kernel v5.10 (same version used by jailhous=
e<br>
&gt; &gt; CI with same patches applied).<br>
&gt; &gt;<br>
&gt; &gt; `jailhouse hardware check` return that everything is ok and that<=
br>
&gt; &gt; &quot;Check passed!&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Memory was reserved via `memmap=3D0x5200000$0x3a000000`<br>
&gt; &gt;<br>
&gt; &gt; However, enter_hypervisor() [1] fails when entry() is called on<b=
r>
&gt; &gt; every cpu and return -ENOMEM as error_code.<br>
&gt;<br>
&gt; Try to reserve more memory. Maybe the default size of 6MiB for HV<br>
&gt; memory is insufficient for 128 CPUs.<br>
&gt;<br>
&gt; Did you use jailhouse-config-create? You can use the --mem-hv option<b=
r>
&gt; to increate the memory. Try, for example, 32MiB and see if it works.<b=
r>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Do you possibly know where could the issue come from?<br>
&gt; &gt;<br>
&gt; &gt; Best<br>
&gt; &gt; Karim<br>
&gt; &gt;<br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b6971ac1=
5e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251</a><br>
&gt; &gt; &lt;<a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b697=
1ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">https://github.com/sie=
mens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#=
L251</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The University of Edinburgh is a charitable body, registered in<b=
r>
&gt; &gt; Scotland, with registration number SC005336. Is e buidheann<br>
&gt; &gt; carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann,=
 cl=C3=A0raichte an Alba,<br>
&gt; &gt; =C3=A0ireamh cl=C3=A0raidh SC005336.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; You received this message because you are subscribed to the Googl=
e<br>
&gt; &gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; &gt; To unsubscribe from this group and stop receiving emails from it,=
<br>
&gt; &gt; send an email to jailhouse-dev+unsubscribe@googlegroups.com<br>
&gt; &gt; &lt;<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com"=
>mailto:jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<br>
&gt; &gt; To view this discussion on the web visit<br>
&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR0=
5MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com"=
>
https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C=
697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a><br>
&gt; &gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM=
0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.=
com?utm_medium=3Demail&amp;utm_source=3Dfooter">https://groups.google.com/d=
/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018=
.eurprd05.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&g=
t;.<br>
&gt; &gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
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
om/d/msgid/jailhouse-dev/AM0PR05MB601854C5133C67EE917952B8A9099%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB601854C5133C67EE917952=
B8A9099%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB601854C5133C67EE917952B8A9099AM0PR05MB6018eurp_--
