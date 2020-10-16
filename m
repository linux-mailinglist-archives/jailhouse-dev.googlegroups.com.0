Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBE7FUX6AKGQEM7XG4RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C829029B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Oct 2020 12:14:43 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id k14sf1079928wrd.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Oct 2020 03:14:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1602843283; cv=pass;
        d=google.com; s=arc-20160816;
        b=NXEOl3eyxMU3WYrQqJtnX9GpSunQnC9yXaVJrqu/n5r62US4bomRev9WAAWOok+Kce
         o2nR4k8U7HTvjcnp9LAgwzVvaPqF8WHSYKmQCkqA980EO+xCimEvuFdPXRrv6Ke7sUjE
         mNX7wupiantsPOWYKMXawr57xBTiEOUMTQI9GUMqM64QZD1Gdnfv5sQiL9iSsT707dk8
         HNhcuBgEez9FUVX+nRU4zkH12pWPEU+xYxky5uCcElXzEGLB5hRErTp4Bwy6YTxv+2rF
         wl018Wf/sv1qxtXTBCbJ8HT4sl4AHrHq07+lBF1XPhQFX2gjb38JbLZU8JEr04C5wWaF
         NagA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=/q+L48w1DxzsHL3YpwW/iGFWKiFe4pJ/FgPktxcinjk=;
        b=NYgmumeXrCEQtGHT5+h5cVy/NGuenPD6yndi5B6ABRVSJG0wgkpUMO3oJGkeTNM8x0
         ANcHmNXHfVR9yPBNDmL2Y0DPPQkiODZWWvIamhnjvDeDlhrIOn37ReUsCUfZbaR6XbhX
         Cw2wJrhZdHs1GK8P7pVhGJ0mKm5RsO1vAa2SuA3Gtym25wXgrYvj62cOEh47vn/K4C4P
         EwC/upfxr3xUdYx4Mu32zqQhqcURWcIqjAgzoRExCWGq0i3EOPoo2kO+HTp6NsEabrMQ
         PK6zgDimjDRAq3LMtO9VeEABMJejcbPMv+k4E0yFRDZnqs5xmrk7yffiQKCXELUT2rrE
         9qHw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YdAao9NZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/q+L48w1DxzsHL3YpwW/iGFWKiFe4pJ/FgPktxcinjk=;
        b=QB1UqYVHxghCJ1o1BCM6EziM9UqHmb6iKYNvakoyufNIYRZ/RWRmMWZ0ei2EJJsmAC
         fhZJtim4Gu0TRAqrkgPYkaLeyk2ATiaiFfBqDyBRtpueBLCWeHITTm2EgZoWdWRUijtY
         /GfruWKUXTP9xvmLXyuv10GxUY0ltOiyFxJpjk6SrxVAgtkrtQV2u/x1MzD39ukWWSv2
         SpGsMmwLE5EDv0jxT5hpVJ/fU6na5RzkB8jLHOxBlAhjCQS4xfjJF2JI8v4QHs8+Hmbw
         Ik/my3LXRcdFNiUf/tDn/p96ukp1IgtPzqP9m3/SYeB9hldIQJFhvZDt3dLCEkjPHeKJ
         GpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/q+L48w1DxzsHL3YpwW/iGFWKiFe4pJ/FgPktxcinjk=;
        b=Gzf22doRUQRdHn0Qge0h6qrFGtefzVkEDj8gxxEuKpGzd+i0aYzF63mBi0+bdokKrM
         kVLpVMqPxR9+12cjbY2Cp8/gx3dpnPv3icVYRfjIXn6sgfUo8PAJXCQ9/Y5s8atYovTt
         +JTNd5tZ0G5lkxiRvWkNXM1Hl/7VF9Mbb6xD3kMpBR0GUYM9HfZRiaHsS1oW4McSkYcO
         re9041HkY1B1dQKx4iKD+7TJyQwassLAnpNpcOdyIHbpRykkDbzY5rmASGbzPOW7kMKk
         oIbCtgcANulCJQEDUzY1pmsZN5+1DpUhxDEcscns/Va1LVFQcjRxlH4oPIZ6mo4gQ885
         jL1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AP1COhhoU7yTj6/KOuRffc1NWdIyuagniHhBFEFhOYzu96EkK
	aEkLFEL6JpHfFNVNyu8RA/Y=
X-Google-Smtp-Source: ABdhPJxxr0I61NJJGHsDf6XW9HUrzbjNP9R7UM9zhL08k8p0zfO7S/BgP3pvw3RPck9Y8Kruf2cO8A==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr3265214wrp.394.1602843283671;
        Fri, 16 Oct 2020 03:14:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4a52:: with SMTP id v18ls344926wrs.2.gmail; Fri, 16 Oct
 2020 03:14:42 -0700 (PDT)
X-Received: by 2002:a05:6000:1045:: with SMTP id c5mr3250420wrx.296.1602843282604;
        Fri, 16 Oct 2020 03:14:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602843282; cv=pass;
        d=google.com; s=arc-20160816;
        b=AJtOAWaUqqvWbNltX079g8FXbhbtk5FtDQTfkNiXnqIAjUzr6ARYZP2gGYntJsTTWq
         ONNoHiS/5ZsHYFJKZoZC77uejo2E7IAR/VqKmL443tYIZgXr6r7DUjt1ffN+NHDWEkzM
         YqzLuJZ2q4Twq+HVBaEBnao+PfSG8QSKIpixuUfSu1sIaOAOZ1yOKIw7nUFWwP8iNcyg
         xxWne7WRxiMo3l8QxJO+wT2g++u8qsiLJ7dLz3WSR0W7ejjI+bI38Rlr08clWSAb7S+C
         OEhraPn9myBLwrTCfVuiPL6pRmpbzx1fUP7iLAR9bSK2r2IEJZP/UV4HdBieHMvtL4Vg
         65cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=eWH8SLUmWLfMECmPpivJOGHaZwOFBld2rNpeuwony5A=;
        b=vfrJhy3Jx83K1e57PeB2fmhT4GBouBkJJUe0Kxy43SQnRwX8nojFPE/90rXeVchN3D
         z3gASndOvM2Oxlk/LFv5nRZ/aDhH/IJ0XEEIGgSiE/d0D2k0cC1URh8rKoQkU9YHGPLr
         EKZXHPsdV8dkWCPKXg9efHEnr+JC+6f64eyGka3BGfT+cXepoTGNX6WAy0XwBQF/OHs4
         HATDrukFPDylATZiWOyx1Qd45iYEMfjzcO+J7iLQ9efFcYiIGwm941LGRGUVD33V/6ah
         cIKsV1D60KmfmOOsfNzH0sohWNuvz81RKbHSyMwTtlmiJI3J7nzb3xrQGPLMPuj6M00N
         L+AA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YdAao9NZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60058.outbound.protection.outlook.com. [40.107.6.58])
        by gmr-mx.google.com with ESMTPS id w62si36343wma.1.2020.10.16.03.14.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 03:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.58 as permitted sender) client-ip=40.107.6.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX9ZrGcnM5fmqeUUc37pEST31qbN+U5ZADTTvKM0zXLRyRgX0Sr3StAHX53vujc/DZAwt5SWNj4XW+AzEGLftBTvROfmiA1Xy2UGnzoKibRRcTSeakt5uXPWa8coGWjy0lqQE3tnfLWq/cURkPhcBIWx5oXKUsnClkVxsQbvP6+nP3p8JrEGA2m+2YD2gONXs9a5ezk98xFjV+/VOk9GL7y9IlXBdV5pXQQius0kE/4a92F3WnUV32rqpOkQojRtXswipfzVxynKmtsU/y4lt/v7qTcJCxKfQ45bq8W8RbLOE9YDrgjF3P5eEXULqSBUa3qH0synWW7TDg/QOdJx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWH8SLUmWLfMECmPpivJOGHaZwOFBld2rNpeuwony5A=;
 b=mRJzDclJ5iJH8IUOqlZnGf7p4At8im/FoQhbUpksKyZKKdnXD/lPvOO9w/QFxQm6Zp89TPz5lR0WH4IMcKjSQX3VF6/jcDvAKxBn0Xggqq8ZpLQ8OEKsQZEMsfXIMrZnpalumLF2xQjFIESp9tvOcLDYZWxVwKz3zZ/izn+fZu7vjfnLIIjbTo7H2l6VjRX/VaA+P7PmwXp/G7MuxnAz8UHYjSBLw42lvbMvEWF4KYQuMR5TmZjetdiG4oVZpTm7azoZzb7ygoxBxrcOsHLIJNNA6Bb+wNhFm2jGlBIypGR3NV+ROWvh0WlO8wBnPHvixAJBT5l0aikKKEmQMrGAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR0402MB3637.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 10:14:41 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::60de:f778:6d17:3cdd]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::60de:f778:6d17:3cdd%10]) with mapi id 15.20.3477.020; Fri, 16 Oct
 2020 10:14:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>
Subject: try virtio
Thread-Topic: try virtio
Thread-Index: AdajpOlW7V0hqfrmSs+CZdaA/nLM4g==
Date: Fri, 16 Oct 2020 10:14:41 +0000
Message-ID: <AM5PR0402MB27560A658B44370DE004B4A888030@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16ff9b52-bdd3-42cb-89f0-08d871bc4be3
x-ms-traffictypediagnostic: AM6PR0402MB3637:
x-microsoft-antispam-prvs: <AM6PR0402MB36378A6BA479C04B1B4D7BA188030@AM6PR0402MB3637.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RpKQLeeHuT+Ts5bbpgDbNtdX64pMmarweQ+11IvX+2SCqaBPFntm6RuzCfbINmA5ib9tDnO72qT7G8nlWVYN44WDfevwP85dI7uN9QiFx5WIl7cd4oYWjN/7aeLz+w1UVc2XEmezye5uZsdYYIzfDqVMb8b5A+ykuQ0Ya9IyFDxoSxDA85vFDx+eymxHt0IOkMKYUzxe76xczeA1Arx81zsCfTrN0asujHvsvzPiIs7ugiDhbFyUjb3+KkO/Ev5uSu8NYKDVmWJwO58eIkX4SyN8mLK2P3tuJYadzxtKBSCU7Yi2szyy3IeQYQV3SXraF5huG82SB8eYDJgXozr2aQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(9686003)(86362001)(71200400001)(186003)(55016002)(2906002)(8936002)(8676002)(66476007)(3480700007)(66946007)(7116003)(4744005)(66556008)(66446008)(64756008)(7696005)(33656002)(52536014)(316002)(76116006)(110136005)(478600001)(5660300002)(44832011)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: p6puNtZEIaQ5SZKD+UzbPRUVJQUbXYFCH6ioNTsnsBVUbUItGcMjz+4bAbw/RYn0nwPS4N8bHP9Q7fBJf1bBy7yAl8G7725ehaGX+eDUQ6Lbd+yqTaakTucq4wdurT7JH26Xovr8vTwcfv96fLUOVXoRGK6cnSzHAMdQ3T1APTr9KCZDH6odrmhXLVXfYntAyxzkUR090TZ7Efp6w4uoRGykabWqi+h8d740OeFQOavQrmkuc6zHBUV3zpT7YwluL28DRatn6HRMBjG1wYFWpKSBXEn/wpVEFhmW3s9dK+LGIPypLLt7GhHRp4gdR0osPJS/mxjiDO+G56YOjJ8KEKUBZ7S7GS51niOvBY+09dYzR52k2apR2JUetdnsNp7BrsjNV2+v3R8aB4tZNFxIW7s1LL3y704Pn9fCKg7A4UNJ37hqNSz3XJ/4h7/A8VtGz57Yhvdbgu6AewVVOFldxwcbv9DBkWjVdeZJYEayO7UmKOrIl21+cbPZnIpCplILlcGQ92gUo4zA15OCDivpxTH/sCPD5IFXb6cgS4Z0GhE6HR99z4ZXGVhcf1KGjs/cTe04bxEuQr/SyVzQdOTlH3DU27cXBvK5Cxs6zIkf0nE70F5Ls7GjYN7Vln4x/5dBPoGCfakSB9AhoU9ET1n7XA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ff9b52-bdd3-42cb-89f0-08d871bc4be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 10:14:41.2839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUmuehWD11lSiJH+m+/xaMv6Ex1i+HJELcxzBrnBnxLO/dmxWWA65DX0c8jtO7AXHaLSKirIDhdxJSI26R8/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3637
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=YdAao9NZ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Jan,

I am trying virtio on i.MX8QM, but I not able to see hvc0 in inmate Linux.

I am using next branch, 5.9 kernel with jailhouse patches added.

I also executed the two instruction before start inmate.
echo "110a 4106 110a 4106 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
./virtio-ivshmem-console /dev/uio0

Any suggestions?

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB27560A658B44370DE004B4A888030%40AM5PR0402MB2756.eurprd04.prod.outlook.com.
