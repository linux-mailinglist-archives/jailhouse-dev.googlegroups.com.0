Return-Path: <jailhouse-dev+bncBDQJNJ52ZYBBBVOTXT2AKGQEHNKFQ6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A21A3538
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Apr 2020 15:57:42 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id n15sf10134138edq.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Apr 2020 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:in-reply-to:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MrvRzi+xfl8mf5WCEYK+pQB/Ue1Bfk/Gus2Ae52wCJU=;
        b=pXyVWFRqvw9GIQeHMWg2d/IZW1KfJ/tkvI88wr2j3ELreVdVoh4j4hspBMbiBpr7lj
         NgIYupPL4OdJ/LvRyNgxtb6Eccv9QHtD9rjxiWbIvk6UOMIVZHJkClU0tkVZNF5Iqwfg
         4q1Mmo40aDBvZ5VRKjaNCQh3Y+mR3aJQKpQqWcujWhj4mLbL/v76Ck9U5A9CbFrtJ73l
         9nCQSDrpLbTkLnUwFUONPPJ8ySSw63J3mSks2v4DwJIUK3zBPWkhmqUsdZ0Te+zEqPGJ
         V+/gD9pPnvw0tddcxT+deyrKoaB0vB3ZIB2ZOeeq+0RQUqSeFZTFW17GRl2/oYkgmerm
         n8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:in-reply-to:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MrvRzi+xfl8mf5WCEYK+pQB/Ue1Bfk/Gus2Ae52wCJU=;
        b=CSRlxEntSj2tPZRBrsWvgi2yDuofRQ6JiZby61uz332KvYiJSCKNFnrpCgsWKkG5mY
         gyxYnrWMhuPj5h1+4oixJTY0oFGkGpexhtIOnXnwyRtH7m93EdwHYOpU6P0wyYgvcDr0
         SVuO/YLbYPAUe8H2QH/+/k0QebL1uryyZnxNi42MfMjqVYoz8QV5YLqCfDxhork9xk95
         HQA+s4/kWCkEwo5eRPPXbyB8r1E5wG1cLui6i6B395E8ucg9Ee9glGImloX8L4UoxRUn
         +l+eFqbF/FU8SMuuJBmsSw6hZZhWQj9fjIoSMkjOH+j0yJ5qDHCoItcHHgc3re+dHPgV
         ADEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYdxlrgZWgr/2TB/czNeHEpJZ/ytJ3ulvP8JEipRrli7aIoI27m
	L2GXjTZQPIr6w4rQs/3oD/8=
X-Google-Smtp-Source: APiQypJE3H7lD+reqClTHV+13+Jr1aj3f5PALBr6YYr44Aj03OsDUNPVjSm2fEsTCG1heA+vT4d3RQ==
X-Received: by 2002:aa7:c812:: with SMTP id a18mr84846edt.213.1586440661836;
        Thu, 09 Apr 2020 06:57:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c818:: with SMTP id a24ls8558844edt.4.gmail; Thu, 09 Apr
 2020 06:57:41 -0700 (PDT)
X-Received: by 2002:a50:af85:: with SMTP id h5mr124050edd.300.1586440661171;
        Thu, 09 Apr 2020 06:57:41 -0700 (PDT)
Received: from m9a0014g.houston.softwaregrp.com (m9a0014g.houston.softwaregrp.com. [15.124.64.90])
        by gmr-mx.google.com with ESMTPS id w13si477123edv.2.2020.04.09.06.57.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 06:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of lyan@suse.com designates 15.124.64.90 as permitted sender) client-ip=15.124.64.90;
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY m9a0014g.houston.softwaregrp.com WITH ESMTP;
 Thu,  9 Apr 2020 13:56:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 9 Apr 2020 13:52:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 9 Apr 2020 13:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdxck0RUfScMrHEde7xWkxU1TZsoC3OuwIvYU9zN3bR9SJhAFpgzzpWvK0fmBz6lKr17SiYpTuJN+y9VNSrUyaKOEK1LsRlfrqIeLsLWCQXBXTcV3197Zlv53c09CY80jDK1+0mQL9rIjHSFZiLmrA07xjNSe8GfXReoYINsmaAHkxmMcXy0hyr8Ch8eQ4lSUUKYEJ87FFyhFh7QkDKzsv9DLw+EVMnUY/wEskZ5jHm3uxcyiv2zIqFVCPImowThAXgdSoph1UaFmNbd2pnrBVv/V6yGbMeHBeAhyhINTGHqP7gMi8SPcj+MQahlCG6gb+GaYICe20G+9drSNrSg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC3NpxpaIiBsfmN6coBbzPBh48PiaKo07TNGkMKkwZA=;
 b=cwyI6XSYoFu7srgqAuavE9QOO0GXzl06zNIt+R4xKd7i4VHyCnlEiz9Wju5KeLjqeyAQT3pUF7hkZ+M2xf7dZUOsQ85wfNap+19Aeq6r3Afmlt+glyEXKKTOj3mGO/TKFEdYLCGjSgzh00q/tZ8JdN4wrvvk+6I0XV4l2LPuPwpBoT2n0cvyEyhBUrWL6mgK0U6zgSNIFa7jkyW/zAIPWjRBOsLQ+QI4NTfWa/jKUN5jG9zRbXl7au9C497dvIqSHpQ5V8eVcZKVKWTXgwKZZ1QF6vItX9wcwpF/v7VDn/+WUcIiuwDEGcwMmFgogftA9wSPtb6HUq5FRDbESuAXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB3047.namprd18.prod.outlook.com (2603:10b6:a03:105::32)
 by BYAPR18MB2486.namprd18.prod.outlook.com (2603:10b6:a03:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 9 Apr
 2020 13:52:42 +0000
Received: from BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1]) by BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1%4]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 13:52:42 +0000
Subject: Re: [RFC][PATCH v2 0/3] IVSHMEM version 2 device for QEMU
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
	<claudio.fontana@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
From: Liang Yan <lyan@suse.com>
Autocrypt: addr=lyan@suse.com; prefer-encrypt=mutual; keydata=
 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
 yMQQ+LPXfanS4w==
Message-ID: <e11366c8-44e6-2d58-7c0a-f49e497cc240@suse.com>
Date: Thu, 9 Apr 2020 09:52:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-ClientProxiedBy: MN2PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:208:238::7) To BYAPR18MB3047.namprd18.prod.outlook.com
 (2603:10b6:a03:105::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a000:160e:228::abc] (2605:a000:160e:228::abc) by MN2PR22CA0002.namprd22.prod.outlook.com (2603:10b6:208:238::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 13:52:41 +0000
X-Originating-IP: [2605:a000:160e:228::abc]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47050f0c-9531-430c-60c6-08d7dc8d462f
X-MS-TrafficTypeDiagnostic: BYAPR18MB2486:
X-Microsoft-Antispam-PRVS: <BYAPR18MB24865C44B73FB7758C98E793BFC10@BYAPR18MB2486.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB3047.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(5660300002)(66476007)(316002)(54906003)(2616005)(66946007)(110136005)(66556008)(52116002)(186003)(6486002)(4326008)(36756003)(31696002)(966005)(16526019)(53546011)(478600001)(2906002)(81166007)(31686004)(86362001)(81156014)(8676002)(8936002);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojgUFvhkMIoHcIjRNHMkPazSOZW47poXqD/8voRUl+/MJKadcv8f/UBVwctOgkuK77XTE/KUCzaXusY18H0C4XtjwPvueNDqJx8N8fCNaUXVu2+ARiVzEmASjBuMwAcbI5cR5Ju9NNN8O5hrJyaYaKTfvttXzm2Pzff3wh/xnHJuCWap2e9FKx2dVA4s4xszoyDhehEfJJoUVYM2QqQYvBGVUB5lcDB9Bxe/M03opbNtP+lezCdcdwDPQVPM/WPh5UY3eFqkDRd0d9Y3Phn03SKh1XNuoMlLWestf/ySNfNROPHDlhadZmqNmuDo0M5CFcL3p7ZCh5Dzc5o1++wh9YBbyS9xhOQxfATmyIjeSHokR5WB343IT8vYelJVlMS2KQrKSpvt2jbbDzzmISTH5/ffx2XRdZ0azGsi0wNJzgzFnaeaAaH2zU/PTKgEm6+Zh5qtDL2EHDBEip3Vf6tqenox/BpL8pBRNuf05RxAunWqeiWBG2izIS7TDZTKT5vGWSmwzRC76C6Om+x0XNqpSw==
X-MS-Exchange-AntiSpam-MessageData: e/fjBDGRN2rroGPs/89ZiXLyPBZTNP78pS62Egkbw6t2MWj1Q6M7QxZuJTCa+ERXD/3BxMl2CQ2rv5e6FOqD883yFTI/cK9H3hcFbtKp3ZJ1U9jxsBBdWpNPT1tz4hfHcyA1b1sEDkS5buzlu1HrW22lV/bqZfE9Sf2NnvNZbYo=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47050f0c-9531-430c-60c6-08d7dc8d462f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 13:52:42.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRKbeOu4vFyLZkRO9E/u1DEOD4ZoXzUuIOMc7GmRksqLoQpKmGNb4rZK8kXrDQBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2486
X-OriginatorOrg: suse.com
X-Original-Sender: lyan@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       arc=fail (body
 hash mismatch);       spf=pass (google.com: domain of lyan@suse.com
 designates 15.124.64.90 as permitted sender) smtp.mailfrom=LYan@suse.com
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



On 1/7/20 9:36 AM, Jan Kiszka wrote:
> Overdue update of the ivshmem 2.0 device model as presented at [1].
> 
> Changes in v2:
>  - changed PCI device ID to Siemens-granted one,
>    adjusted PCI device revision to 0
>  - removed unused feature register from device
>  - addressed feedback on specification document
>  - rebased over master
> 
> This version is now fully in sync with the implementation for Jailhouse
> that is currently under review [2][3], UIO and virtio-ivshmem drivers
> are shared. Jailhouse will very likely pick up this revision of the
> device in order to move forward with stressing it.
> 
> More details on the usage with QEMU were in the original cover letter
> (with adjustements to the new device ID):
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
>     echo "110a 4106 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0
> 
> And for virtio block:
> 
>     echo "110a 4106 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
> 
> After that, you can start the QEMU frontend instance with the
> virtio-ivshmem driver installed which can use the new /dev/hvc* or
> /dev/vda* as usual.
> 
Hi, Jan,

Nice work.

I did a full test for your this new version. QEMU device part looks
good, virtio console worked as expected. Just had some issue with
virtio-ivshmem-block tests here.

I suppose you mean "linux/tools/virtio/virtio-ivshmem-block"?

Noticed "ffc002" is the main difference, however I saw nothing response
when run echo command here, are there anything I need to prepare?

I build the driver in guest kernel already.

Do I need a new protocol or anything for below command line?
ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003

Best,
Liang



> Any feedback welcome!
> 
> Jan
> 
> PS: Let me know if I missed someone potentially interested in this topic
> on CC - or if you would like to be dropped from the list.
> 
> [1] https://kvmforum2019.sched.com/event/TmxI
> [2] https://groups.google.com/forum/#!topic/jailhouse-dev/ffnCcRh8LOs
> [3] https://groups.google.com/forum/#!topic/jailhouse-dev/HX-0AGF1cjg
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
>  docs/specs/ivshmem-2-device-spec.md       |  376 ++++++++++
>  hw/misc/Makefile.objs                     |    2 +-
>  hw/misc/ivshmem2.c                        | 1085 +++++++++++++++++++++++++++++
>  include/hw/misc/ivshmem2.h                |   48 ++
>  include/hw/pci/pci_ids.h                  |    2 +
>  12 files changed, 2451 insertions(+), 1 deletion(-)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e11366c8-44e6-2d58-7c0a-f49e497cc240%40suse.com.
