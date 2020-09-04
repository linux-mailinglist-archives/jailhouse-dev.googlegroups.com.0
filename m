Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZFVY35AKGQEHDJ5Q4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168525CF20
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Sep 2020 03:39:49 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id z18sf1575267lji.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 18:39:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1599183589; cv=pass;
        d=google.com; s=arc-20160816;
        b=AccQp+iiuWitfSn1G3u2i2kWG7sLrsDBMaHy0LktJUPXSSD66mqozfxlTZ7Gr6L/mn
         jQMUOUxULmIgxvYqf8gmU0jZfuBt0UEeKU2jANG3Yw/00ENAaoF7k7Xu8AVoug51zpET
         zYy5Ow4sVWfcfTZmncuD9qehU/aGCTLpRnk0jfZ7sdcpYKf+Bjz2nt+LqlVQAuXGKGID
         /71UqlwCXBV9/1RFAEjcSPBrtCeowyMH3mFfR9Sv/YHJZxFIlQqqJSnUmsdREIZZ6SsW
         lrpCnZ1Di/QQ4oJq+27I3hplU/s3SEjng+VapZtS7YcgzdPFG3dvaBBAELcKj8okhrTr
         irsQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=deQxcTRtYN/xicx6B/RXKHoOEJ0zdClcxkbtm3RHW/I=;
        b=jShEvIOe3lnhYbWYn4ZcdgKSRC8r5ms7kNMeCiNa1b6Ck2Cs+xMDvPWukYJ+HomS2D
         W5VkuH5JcQ1Ib8Y73P69U0DxgZMWLBwna+eggTpJFptNj0D+65KbNcEwuXC9g3snh0w/
         tcT0sFcCv0uY9uN07ty0Gp0b/+WT2k8uZHjVm6vdx6JaOjzqcOGargTA514r4d/pVs1r
         4RgsMyCKkfltRrG1GKn9g+y3k0gc6Kd6Aoz8I7khrWtpwQA3b+jZBbIyY8jqrFBXDvwN
         93xznqtI0AnOJjJ8PGeTRIBzv1ybI1UIfV9EsRacy4XGi0h1JFNErQm8Xc9MIJEx7jwH
         5l4Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EUFRwQPn;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=deQxcTRtYN/xicx6B/RXKHoOEJ0zdClcxkbtm3RHW/I=;
        b=AVehFHRTsZwk4RHjvhreR1dS4HA4QnFxUsrh9Fcp1fGR9vE1yop87FkH29DOJUrkFC
         btWZU0LI6gikMU6Ps/7qwZM950GYqFMFRvhUfZjOhaaxxdxbes0fGm9dFCu01OvLCtZR
         5bkO/DWfpPRpuVLw3a0UcURp+U0c2yaWvK3roq4nmBNrZYvJ9yiqTQmjV+p57rs/NoFl
         8Ni/5gsrIKqiCTJI4ZlipzHCN+Pzo/mhY+yfysicOIlbtvs+uHxvkRqxtHBef2yCvJF2
         eIQkdEpCXMtApyi3sagAETpQOADk/kTk/A5qiXbgpGGJsdcwXkHYtKGPZarbym6eHHk+
         UGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=deQxcTRtYN/xicx6B/RXKHoOEJ0zdClcxkbtm3RHW/I=;
        b=LwxBH8E2Q0xeje2aNa6gONjXVQlaIufmwfLgUlyWghu3Nn7eH2uvScLAs8XJXIkBiO
         d9fvBPGn6LkJYOcsbEPcvLJdL8kHd16QgdNFS69ZrvsBhqgpNA7b8USRMZtLlWd7WyhF
         uCvF7F9StXlpUqgOw6CP8ByycMGI9dsSvWe8mJllixu/ia8IOj7nJ//kWQJAPRYQA3we
         CDH81OIo4sbk3wt1nSc53zgehYWc5tEHcHDwAZVXNBMKEsi0FlTHweFL/7Nz8GqfXS18
         Hy4dLWMN+HQpvoZwODvtsgVSN7LUbjqbnD4qQkWsMknCQy4eZFGdK7YqsTy95ldnM8nw
         3CPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53315nyBh/5veJqNwhBkI/JDs3h2Ao5k0985UnETG5z/YWdYKh8M
	Nr/LcYS1ByM4JcMtyfYBNIY=
X-Google-Smtp-Source: ABdhPJyiJL4o3ot0rgSFBNTGefAE6TMHMd76nqWe5N90P1a1KNYshlWb/3F6XR36tmmVcKZmsi0pIQ==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr2896467ljg.240.1599183588911;
        Thu, 03 Sep 2020 18:39:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c8:: with SMTP id n8ls1571653ljj.1.gmail; Thu, 03 Sep
 2020 18:39:48 -0700 (PDT)
X-Received: by 2002:a05:651c:1028:: with SMTP id w8mr2658752ljm.131.1599183588085;
        Thu, 03 Sep 2020 18:39:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599183588; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xbyb7/a3aiM8xyjxCouitc1+fZ9mNDSv1K2TWJUuyg0QzYE2zpuJlnjjBojWC+mbf5
         lV324Rto9PUOerSEr31lnFFSgewGh0EzGA8OJZFJ5y9VWkWLv3crBDROJu4FAalBLeX+
         pVfA8R0wloJXmLpJguB9NR6PUpJdn2D7pgIFOQ4KQxB5lsm9c3EB3dXya7rI0G2vwV05
         OSTfV5BnHgFZdU3OPkYhWJD3LEJCJvHbxeRp1biqLlOyzeeWv9BTifBPW1T+BRVNRsyg
         v30fwxQPOd/qF5XHg2cMGwtabDh1O9RE8p85mR+V1zQHRTP1pk6eLbq56QuH3JOuiXTG
         HOEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=06tSuZbzb+phxvjU3vBpP1tdHoUTCHi8GbJtq5hHA6U=;
        b=p8N8ovf2EorVmw+KTj1BCnzPjhpGGzmkjY9nBkg5Es6HC3vkJofmpNrz5WPXl5zKsi
         PyG6g7CBQpUoGhaXqSUYL4644RChDYph+C7P2d88zTXXWGWcEHGd75T4lo0gRWhzTNF/
         q1rn4uvv27Izbkfqc0rkGCQMqEnPxuHSg9L6fdWjKL9de5JWd+Lm/XqylLiNUcgDq6Bv
         bcArV9fx49g3BmL32jN9M45lO8fNlTJZ0Nmh5bvfcY8uJObC/cAwocLkmkdnGmleEIGQ
         5wenOKZ9FI/RW/9eJE22NOYcDnFkkMHxHE/gJJd6SAZuGLX6PYgVFngIaMzeuXpppRwn
         GRwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EUFRwQPn;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60061.outbound.protection.outlook.com. [40.107.6.61])
        by gmr-mx.google.com with ESMTPS id a23si213145lji.7.2020.09.03.18.39.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 18:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.61 as permitted sender) client-ip=40.107.6.61;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8ZKLaVzeIET4Kkat6ABrAMq1FqgcufiydtLN1VCoTt+ivMGbKNLzzJbDDXosp/bV11o3YkBhOXsmp4ATKGTfz18/PTXCZ5VreMmpTDods8tRdeVCkCZD6mBOV0zn2+BS4JsO/tjaHL0yVwQ+7GIvjUloixrafyxbKQk5yhqnUp243Y3fHqD6JBM4ukhwJlcg9bSYw3RdPar0OfS1O90EKIEkqFNoyWGd02AaEiDO+5idgBHfTem80fHQ9c6PB8FVb/Rfd6302/ZEZswqBr2UE2zlYk/TeVSAOn2wCvyV0KO4+/+jsV68k1z2spsyFOZskxmXsG0k6lZJkOqpau/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06tSuZbzb+phxvjU3vBpP1tdHoUTCHi8GbJtq5hHA6U=;
 b=M9lVHtOtv0MsDpaymDK1c/MNYC8oG+AgbztdvXbDOdRQ0CytLfhvROnnJbrisIXoDQQke1Syy9UO+M6IMG0l8+itWar7pf+zAiHMciSi/AGzaTlEZSCOxgIlWiiHeGgS1XSGBLM3D7EuMEC0o0ej6NsywUS2Ik0qq1RtZ/4QesM/fsVe0cVnNr949wqXCuQvO83JXcYNnKzuQOpAygHQqnMBnQeRMrg3/aOBXoCnM9hC442sUQzLQe0PuNtCjx4t7M4iXKzSkz1HaP9RWUOyvtfMDid2uo/wMzOTaiG0q1qWqZaYRXng0bzcAiNPG8+mb+o1AYDPUhRzR4vKlyKYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2936.eurprd04.prod.outlook.com (2603:10a6:4:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Fri, 4 Sep
 2020 01:39:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 01:39:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "vsun...@gmail.com"
	<vsuneja63@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: =?utf-8?B?5L2Z57qi5pif?= <yuhongxing@xiaomi.com>
Subject: RE: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
Thread-Topic: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
Thread-Index: AQHWgg6j0KxgIojpqUeSv20MPZnTw6lXP/eAgABxMTA=
Date: Fri, 4 Sep 2020 01:39:46 +0000
Message-ID: <DB6PR0402MB27605252999C5205FE84C44A882D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <15b9588b-971c-4664-94ec-42479be2d871n@googlegroups.com>
 <16956cd9-31dd-14c6-7314-d42505dfb9e1@siemens.com>
In-Reply-To: <16956cd9-31dd-14c6-7314-d42505dfb9e1@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a0a640c-2d25-43a5-c63d-08d8507367cd
x-ms-traffictypediagnostic: DB6PR0402MB2936:
x-microsoft-antispam-prvs: <DB6PR0402MB29364E320587303A500F1CF3882D0@DB6PR0402MB2936.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: de4BOwS+O7RCHwFPX8k/14zn7gnnYr69Vm3ZxcLkbsf9S6Foc4LQF8nR78TvDjfQaDmYbnx48eeDtai48dlj63SGL+ZSW6Z8g6HkEzNygHj7UMlBve8J72MEEbxR23yGBUhKJpY9Lpa35PMyCejVBo5f8c8r6am2Cq+axC6MqwDT2vdHpDzTCvqtsUhzEXbo0rQBTMAbaPCH7tlLbTAI9c4cEtGagZ0xaEBOKku/REsR/RRZlNg+BBRqeHKZ1tlK4D7EdCdtlgicLwSQGpxHr9UpEDMpSeSP+fm8iJD5s2PWfj0n4XymqPCoZwEcyAu8s79M8gijnifUO8Xcl1x8nbCkA8Zm9ySeEB2CNt39ZkYy6/X4td+I0K3x01pCc7gX+q8IvrZWdmZf8LPshyocIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(64756008)(55016002)(110136005)(9686003)(66446008)(86362001)(7696005)(186003)(53546011)(66556008)(44832011)(66946007)(66476007)(26005)(316002)(6506007)(76116006)(52536014)(33656002)(8676002)(8936002)(478600001)(4326008)(83380400001)(2906002)(5660300002)(71200400001)(15583001)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3rOBwt+u1bRuUswfuwjRF9eUk3Q6bluI66o05JjoXg1Qb5Y4xW1YaQLj/hnu8YhiS1gtQPxmMQUbkcC7y9LJ9bJdEqqcZu0+Y791xQy2CrpcC/qtz6DvN3sLBnXcGso0POEsSB+99DoxZk/rhUTWnJEx6aF0AwA675AW5HUJAvYNTyeHa152RkS/5Hx5OLw6Wiq6LfT2fHRr4OlQoT2GrlkCbMp5hD1iMHO+NWHPfN1YeIwphfZN/mnA9hO9ttB+JqNFDojHZiEVXLhumR0r22kYgB8cUPSD9+IVMG7xqv+vwadQeb57G59XCVCIFhYn8IhgswISnN4ZarwCEdKsMEziPo70XWW63bY5Yvz6MW77eYz8pXt0FDHCVmu3XPHBVOmn0oxvpoOCv93a3GQ0kyLrrUwT76uGy5l4My+jHyD0XEMzGPkxqlr0ZalW0FZlB5+X+SPtaPo0VJ0UEALXnFrb6VhCroJeebjuk3PiulvFimIHr8Jh3G+WT/WdA+a7ZQHFXU/4QDoyNm1kiYg0oxW73uV1c9VlbOrcUzyAHWlInDCQOaHEfy8vWeBc5YI5tXfYxlQuNCXqidOWYMYdUj1NqJQcWghsw6FOXZ86sUe36+FZN0jovAyD7WICwu7kC3I3L29qgJPNcTy1LeEUSg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0a640c-2d25-43a5-c63d-08d8507367cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 01:39:46.5005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MswH2jYSanGOa0zsJCRwpQwL9GUf5bBcPkcxwFhWo+Hsue5H4YKOUMNqJxwo0yDPFyAMnjb9McdcDVZT9PCRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2936
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=EUFRwQPn;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.61 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Thanks for Ccing me.

> Subject: Re: imx8: could load 2nd linux in console but not getting how to get
> the shell up in display screen
> 
> On 03.09.20 18:23, vsun...@gmail.com wrote:
> > Hi,
> >
> > I could load custom image in emmc & that boot up successfully via
> > jailhouse non-root cell in console. Root cell image shell getting
> > displayed on hdmi but not getting how to display 2nd linux shell on
> > imx8mq evk as "imx8mq-evk-inmate.dtb" doesn't have mipi_dsi port for
> > OLED. mipi_dsi port is there in "fsl-imx8mq-evk-dcss-rm67191.dtb" only.
> > imx8mq has 1 hdmi & 1 mipi_dsi display port only. How to achieve this
> > or any other way for display?

You could partition display, since there are two display controllers, 
but you could only leave GPU in one OS because there is only one GPU.

There are lots of trick to achieve display partition, you only have one clock
control module, you only have one pinctrl module, you have to let the 1st OS
configure clk/power/pinctrl ready for 2nd OS.

Xiaomi engineers(yuhongxing@xiaomi.com, CCed) did this, but code not public.

> >
> 
> Peng can possibly answer if splitting the display outputs between cells is
> doable at all. I suspect the answer is "no" as both might be driven by the
> same, un-partitionable GPU?

Doable, but only 1 OS could have GPU.

Thanks,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27605252999C5205FE84C44A882D0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
