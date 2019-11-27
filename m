Return-Path: <jailhouse-dev+bncBDQJNJ52ZYBBBDVW7LXAKGQENXWKTIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe40.google.com (mail-vs1-xe40.google.com [IPv6:2607:f8b0:4864:20::e40])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C310B2AF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 16:49:35 +0100 (CET)
Received: by mail-vs1-xe40.google.com with SMTP id h28sf240690vsh.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 07:49:35 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1574869774; cv=pass;
        d=google.com; s=arc-20160816;
        b=M4jxSi7RMpH9b2P/pJV1w5D7NFGWipRqjydLq0Z5/+yAFDGMN6rEzOpVOYa/on/c7s
         0gsqIeHB/wlFDT/W6WV+rvvA7DxolMadCt/WzAYs7FmIjGRf5sw6z00j5H7GpUOwKmE4
         hBbnHC+Oz6MqQUrWlH35YkKWjVrbH2UyULlUZmMx1iILKg1JoXpsyREcLjGqWFO0ttcB
         Tjl0z3ps1hQeqlEQ8+R5WvWmunYIkI+ujLg3f93smnYGLSW3vRsEUUka7+ErXj+ghv0g
         nCYTPoVzgDNGodEGoUIM1MnoOIZ0vvX7etEnsXy+JNl2+KaQ3QbcBLh56srwWkiKDe92
         qrPA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-id
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=RnQOMA0bnPnVubgtvWWhczxvzRivtIG8U2hAmMN+kYg=;
        b=rre6saKXKRUXtK2g7lAmVPUyCNHKHbfZZoGt35lLydcEfBDqDgr2M44qtPTApGvw0U
         D7KnQK56xHLNV7h25H/PFKdiXyht5wcT1OeZfFNDRhypFNKn7DltvKUmBL4/uLPLvcf7
         8RIZ/xkbkkKqRBWFGUxWn36cTzwhphp4gbdDOaTRft3rH6jPOtV0AvNKKyaL7SFacWS+
         seUUmmaZclp4fBmPJF549UlM+pm2hbD1FFUi5d4yBZM+0knbn4L1zu41q8P15GhMTla/
         D/FdRpNyjB282Y4D+G4sjJOe31IRk7UKFjtwvdwIni6o882tA7/eYBbtPJ0ERM15CiAD
         2NUw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass fromdomain=suse.com);
       spf=pass (google.com: domain of lyan@suse.com designates 15.124.2.87 as permitted sender) smtp.mailfrom=LYan@suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RnQOMA0bnPnVubgtvWWhczxvzRivtIG8U2hAmMN+kYg=;
        b=gPbzZ5JUCB6f3m8ksA88Gh5bZPdgr5VDl6ZztyuTFCpsM3x/9iaZ3lFzr+GAG+zpGs
         0GUOkOsufh9ehqc63C2IZv/nIWQSWgKkIWfkSHMD6MCxxetAWg+HCLcXoaP2j0wJKJJo
         NM2okFBkyk5EAcYffbHnKYmWSM8na/hNohkyMp5nS9wD3sRzwHO+RauSH46bb9jmmXR+
         Qt/e7t/UbQ9rpeN+hq4KFgZ0Oobsk3R55jManM7Z5r4scYgsnbQdDZr0zv5d8qFckbui
         IRWjEOJ2I0DCZ29iiA14Yut/BJE1lhmmKKZt96aqpXJeyQfhzrFZUmHknKonV8bAvXAD
         KO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RnQOMA0bnPnVubgtvWWhczxvzRivtIG8U2hAmMN+kYg=;
        b=h5aM/MLYnzqx3yqPv/fIdluNG+NTe54w0/+lPjm4gBVX90eeGqXS6JcCgPeDAArxJ8
         a8tDPElTLBRqISeVHc0WKPpXnR2NT04eNlPL+8lgVd5ZF2GSukbgWrZ1oRDplryBLiJt
         9BljYcrazkRgS0wU/FnChpE95ZpIwlsomahl70qUQ4N9aUBkQGUuI5JcqcM6l9tnnH6g
         kfOZPWdLdQA2/sxtZhGWb427iJ+ULu7t2Jo6E3SvGH0nL9zpBS3CLEvzXr4yEGHw7pzv
         cI4U6cPZtFOd/fpIMlhzhKSrAebaX7Nrg80Iam27MozPU82RJVgRbRBCV7+85Km2hktj
         vdMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW5Qc2Pzl/sZOJcWxFhTeSOK+YjdM0nX6mAtvR6iU1gdYNVTA72
	ufD8hhqARJzdaf1UyBVaO3g=
X-Google-Smtp-Source: APXvYqxcBe0ntYdd2haXdB3gxTi01wyCFIsKc34wV+S/qiwKcrHWo6SkHwmYJqiSw5fexbqZHF08fQ==
X-Received: by 2002:a67:c097:: with SMTP id x23mr28740791vsi.164.1574869774411;
        Wed, 27 Nov 2019 07:49:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:f408:: with SMTP id p8ls2677383vsn.3.gmail; Wed, 27 Nov
 2019 07:49:33 -0800 (PST)
X-Received: by 2002:a67:f708:: with SMTP id m8mr26561699vso.173.1574869773695;
        Wed, 27 Nov 2019 07:49:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574869773; cv=pass;
        d=google.com; s=arc-20160816;
        b=qMrIKAWzxEtdGMk/5aR7pA+vdSLxyDKWe8oQTAv34ttZBf/AkATvM+t/4LdB0jEQZz
         uccrWPlo3ueNv34bXrQ/s1CkujGspBYqH7ht1HkfLNXX2SOq+OvBCD4RI59IS1LzeGSC
         JmWxj37LTxpdJsA5hX0BfSPrBcKR+ZvEPETYPRPZOBhJyT86nL3WWbr9jdkwVlgw3abD
         0T+xKtx+GmrkkfQi9YMlzqSVI7vF5U0mFDPcRH+Atk9WZhSR9UQfKIOe5aNK1euXgYuS
         QGsB7T2T/rXMYrV4TCaCmFkovYVEzeWIn61BB3v19BxnErpQh/VZFx2MLLXPPXoKJZ9O
         VKzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=kQ66DujVpUvO2EtOh5v6in21IDmA+0Y+vmNZJEGWPWg=;
        b=mjAKp42zd0cYI8Ek+WtYVQjRKrRagEQDUo+hSWblFmlliOVl4J4eg1L73TjEcZdKg9
         Y+EvYTvh8plCtJfW9c5j0N0krjpR8imrqDcDXYjmuY2C9SBWeUcmpjynH7bv7nABs3IF
         g1rcD8K63Hf1YPtKiy+PH8utih2BX9DM2x1b+2sal2ra2tLigYL/ZeQkt5pMmwX28miP
         8QcUGnAHWQY6b81fgvW1XyCLBzx5UMPU7wobEyZvJSmUO8xKo7iDIHHrFB3fbPYhG/xx
         ORyfB2PbX0sO0zm336bD0RESGNA34KqRTBkXXKdNr/DfEec6Lkg1tfqYRwr6vKH0id5t
         fRWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass fromdomain=suse.com);
       spf=pass (google.com: domain of lyan@suse.com designates 15.124.2.87 as permitted sender) smtp.mailfrom=LYan@suse.com
Received: from m4a0041g.houston.softwaregrp.com (m4a0041g.houston.softwaregrp.com. [15.124.2.87])
        by gmr-mx.google.com with ESMTPS id h143si543685vkh.1.2019.11.27.07.48.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 07:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of lyan@suse.com designates 15.124.2.87 as permitted sender) client-ip=15.124.2.87;
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY m4a0041g.houston.softwaregrp.com WITH ESMTP;
 Wed, 27 Nov 2019 15:46:48 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 27 Nov 2019 15:28:28 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 27 Nov 2019 15:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6fikrKwlFWrIZcZJcRAx/PX6s/77I2vRGjdI0z/HJYR08ByNIwqXu/lT4OVBZzDHNjRIoNeRMeUaY15CgFOUCaZYOuGcIh/8tjERM/N2JldohpUGy8yuzL/8fBBNx4dxrJAxn77j05zqo0XCaknwKQxAgRyhVXUnM8VoMGuVjiPeJDDF7hszhy+hSwGS1kwuR9MxCXPJF3r+28H/j9xlSCgxEojuGCU3CjeFzogZ0EUSnL9NCMsLHPsM1LH1NIxb+g1bZE7Cyv1INfu1sdvcwBY0RmZJqCGPOUcrc31OIQoaiXeWINtepgiUSjw0qu0HQIpdEa/Kb81bh0GfFdbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ66DujVpUvO2EtOh5v6in21IDmA+0Y+vmNZJEGWPWg=;
 b=UxMGB0VVWx28NWGs4X1NALUyYb6BuKrtuH/27fDJVq2odrauxHWky+20A0uKGkVoLqp0MU+3QYt3JwJkwJHrXy4OH11gIKHVJDbthvHsc1BlIB31X6qjp+/ELvw+6Wx5RyPzKxX2qpGHgZBASKn2cwMYe4BWOU511doeKbNzfJk8DJXtUTE/IyJ5zjMIPG2XmIA4Ez9uXsoZxEyQMKW0Mw2Z0QRBRUlK2WbjadR/fLSFGFE2SSpcjKjE9iN0PLw6J+oTwW2O4q0UCJo+bRHiOLGCa+0pY/Tv3Wf+8ITsUu5tGh8S9rhU+pkBbZZZX9S/bzOgypKKAuX/mnpdkm5Wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2888.namprd18.prod.outlook.com (20.179.58.203) by
 BYAPR18MB2950.namprd18.prod.outlook.com (20.179.59.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 15:28:27 +0000
Received: from BYAPR18MB2888.namprd18.prod.outlook.com
 ([fe80::e452:516b:bc31:3280]) by BYAPR18MB2888.namprd18.prod.outlook.com
 ([fe80::e452:516b:bc31:3280%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 15:28:27 +0000
From: Liang Yan <LYan@suse.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
	<claudio.fontana@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Thread-Topic: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Thread-Index: AQHVmI/KIQtCt3MU0EuTRnTT0BFR+aefPX0A
Date: Wed, 27 Nov 2019 15:28:27 +0000
Message-ID: <efd5fa87-90de-fccc-97a5-a4fc71a050c8@suse.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:610:38::35) To BYAPR18MB2888.namprd18.prod.outlook.com
 (2603:10b6:a03:10d::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2605:a000:160e:228::3d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bd3269b-c3d8-403d-9930-08d7734e72ec
x-ms-traffictypediagnostic: BYAPR18MB2950:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR18MB29505DEAE08CF6F0716F637CBF440@BYAPR18MB2950.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(52314003)(99286004)(53546011)(5660300002)(76176011)(36756003)(86362001)(2906002)(52116002)(31696002)(102836004)(7736002)(966005)(71190400001)(46003)(2616005)(11346002)(81166006)(6436002)(186003)(446003)(6486002)(71200400001)(6116002)(81156014)(54906003)(66946007)(25786009)(6512007)(31686004)(6306002)(66476007)(64756008)(66446008)(14444005)(8936002)(14454004)(6506007)(386003)(110136005)(256004)(305945005)(316002)(4326008)(66556008)(8676002)(229853002)(478600001)(80792005)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR18MB2950;H:BYAPR18MB2888.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+en3lAljHxKrwLbejoSXCxWHvbH14mV9XsPcCPoOSPFU/WFt4HHTNNBb0auq+Ccg+G/NBW8kYWiDmaWspltir8cIfS35GgSt1s5m/Q/nNPq3hNdjkleTnpbCeTDjoaojfb9PJI8gQzJCSxROAZ/3ZcI3Js7iGBzibg2V33jn4DerBJhCwy/F9u5Y8cqg1iF8TQCxKwFtwvPylec7rbtutfJeoPE7n7+bXIihgynO6cmQRnRhaJ5i3BrHGRDjlje8iGazx5kBOgqrfkxpM1Z23yV72F9n68o2cbybTLZdf/qym6HS22/XuWsFDP3+GdTaVEF0AnMCaTCK8pYNjBAQLws+ZA4rVOM/Nqs24ggC+IIhPn/bYVziSVd0lOSp3W/RbMOCHfHNhykX/2aCxZDI0MkM3Y5wBPGjMZFCnZZJJ9pKBD9IMIpVydde+JJWtbQ4N7RFUM3JmilRSBWztQFPgSyIOdv8FAmGmcq6f5ZhIg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <760A38F7C04EAC4CBDFEAF0633DB81FD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd3269b-c3d8-403d-9930-08d7734e72ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:28:27.1065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYC7D0/4TjBRP98O86FeNXJYCJ/iV8mnPqcuW5x4eiAGzbZKO8exaq2JWGe2uxZw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2950
X-OriginatorOrg: suse.com
X-Original-Sender: lyan@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       arc=pass (i=1
 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass
 fromdomain=suse.com);       spf=pass (google.com: domain of lyan@suse.com
 designates 15.124.2.87 as permitted sender) smtp.mailfrom=LYan@suse.com
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



On 11/11/19 7:57 AM, Jan Kiszka wrote:
> To get the ball rolling after my presentation of the topic at KVM Forum
> [1] and many fruitful discussions around it, this is a first concrete
> code series. As discussed, I'm starting with the IVSHMEM implementation
> of a QEMU device and server. It's RFC because, besides specification and
> implementation details, there will still be some decisions needed about
> how to integrate the new version best into the existing code bases.
> 
> If you want to play with this, the basic setup of the shared memory
> device is described in patch 1 and 3. UIO driver and also the
> virtio-ivshmem prototype can be found at
> 
>     http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
> 
> Accessing the device via UIO is trivial enough. If you want to use it
> for virtio, this is additionally to the description in patch 3 needed on
> the virtio console backend side:
> 
>     modprobe uio_ivshmem
>     echo "1af4 1110 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0
> 
> And for virtio block:
> 
>     echo "1af4 1110 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
> 
> After that, you can start the QEMU frontend instance with the
> virtio-ivshmem driver installed which can use the new /dev/hvc* or
> /dev/vda* as usual.
> 
> Any feedback welcome!

Hi, Jan,

I have been playing your code for last few weeks, mostly study and test,
of course. Really nice work. I have a few questions here:

First, qemu part looks good, I tried test between couple VMs, and device
could pop up correctly for all of them, but I had some problems when
trying load driver. For example, if set up two VMs, vm1 and vm2, start
ivshmem server as you suggested. vm1 could load uio_ivshmem and
virtio_ivshmem correctly, vm2 could load uio_ivshmem but could not show
up "/dev/uio0", virtio_ivshmem could not be loaded at all, these still
exist even I switch the load sequence of vm1 and vm2, and sometimes
reset "virtio_ivshmem" could crash both vm1 and vm2. Not quite sure this
is bug or "Ivshmem Mode" issue, but I went through ivshmem-server code,
did not related information.

I started some code work recently, such as fix code style issues and
some work based on above testing, however I know you are also working on
RFC V2, beside the protocol between server-client and client-client is
not finalized yet either, things may change, so much appreciate if you
could squeeze me into your develop schedule and share with me some
plans, :-)  Maybe I could send some pull request in your github repo?

I personally like this project a lot, there would be a lot of potential
and user case for it, especially some devices like
ivshmem-net/ivshmem-block. Anyway, thanks for adding me to the list, and
looking forward to your reply.

Best,
Liang

> 
> Jan
> 
> PS: Let me know if I missed someone potentially interested in this topic
> on CC - or if you would like to be dropped from the list.
> 
> PPS: The Jailhouse queues are currently out of sync /wrt minor details
> of this one, primarily the device ID. Will update them when the general
> direction is clear.
> 
> [1] https://kvmforum2019.sched.com/event/TmxI
> 
> Jan Kiszka (3):
>   hw/misc: Add implementation of ivshmem revision 2 device
>   docs/specs: Add specification of ivshmem device revision 2
>   contrib: Add server for ivshmem revision 2
> 
>  Makefile                                  |    3 +
>  Makefile.objs                             |    1 +
>  configure                                 |    1 +
>  contrib/ivshmem2-server/Makefile.objs     |    1 +
>  contrib/ivshmem2-server/ivshmem2-server.c |  462 ++++++++++++
>  contrib/ivshmem2-server/ivshmem2-server.h |  158 +++++
>  contrib/ivshmem2-server/main.c            |  313 +++++++++
>  docs/specs/ivshmem-2-device-spec.md       |  333 +++++++++
>  hw/misc/Makefile.objs                     |    2 +-
>  hw/misc/ivshmem2.c                        | 1091 +++++++++++++++++++++++++++++
>  include/hw/misc/ivshmem2.h                |   48 ++
>  11 files changed, 2412 insertions(+), 1 deletion(-)
>  create mode 100644 contrib/ivshmem2-server/Makefile.objs
>  create mode 100644 contrib/ivshmem2-server/ivshmem2-server.c
>  create mode 100644 contrib/ivshmem2-server/ivshmem2-server.h
>  create mode 100644 contrib/ivshmem2-server/main.c
>  create mode 100644 docs/specs/ivshmem-2-device-spec.md
>  create mode 100644 hw/misc/ivshmem2.c
>  create mode 100644 include/hw/misc/ivshmem2.h
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/efd5fa87-90de-fccc-97a5-a4fc71a050c8%40suse.com.
