Return-Path: <jailhouse-dev+bncBDQJNJ52ZYBBBCEDUT2QKGQEQZ2BDNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 608621BD387
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 06:24:41 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id p16sf1045834wro.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Apr 2020 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:in-reply-to:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JJZhtxM1/QwC0tCmAgeVMlLdIzLqwd2oVCw8GU+S8EY=;
        b=c5MoqmKsibstK3s8jcnoFe9TJ03nMOI8JZHxvg1SQi3FTnrJt32aSOmIoIxyl90MNj
         OULJfvPtbbleEu9EUFJPBMTYz5qAjqae0rn28p5dAsJ8vsUj3aSdEgzHGbvAuGAEweqz
         73ThtYXqH6M03hV/07MD+3LsAVY/M0GK89LZstO99CNWCLPdgPcpy/YZYF1klYOnUe2h
         AxOoQDShbSVRqfOIv8NwmtnNxchqjhWSqtX5WKmAoD+8jAP/Q5yYwSBtu3GJdQ8DfMHB
         A08G1qkUZVewAYjm08u0Sj6b2H0HNgt5NfOposbqcrjewfL/wsd8AvUdDH7Yl//hRMlI
         J8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:in-reply-to:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JJZhtxM1/QwC0tCmAgeVMlLdIzLqwd2oVCw8GU+S8EY=;
        b=DiXjRHTJg7N5sEhSVEoiTS2VOhkTxkYC6eJnqjLW/dUo5xZu8R8mIEILZneUBQXPWp
         CUPikCXzJZcaVuCNDAI+1eo7ERux8vVPooh6X3yedx+/AozYU5y8fcLVN7ytcKCPRnIM
         6t83um/47ByzkKLF6eEfxiB5SiN9pNZ8D0vIn9vbgmNH1ZnY+liTGiEIPNROIhF8RC74
         MnhY2bNsbyDuH92b9NTqZAchA3b+TLbtA/BaCmrH2vD2A42N4qTkzuvLJTlCtuSBJhvs
         QWN428BYn4n3jtXLWhe+M/4BK6m+I+cSoWSSNPivVghip0NlWqgSuUHZRRfgEQt+Q+9c
         n3eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYAWFOfcKLxcgyZ3Lz5p2EIMDWZkQhCB7nvzRo37MQ1jX1bPFvM
	DWlxaIF0/vPFrlUOhOERmPk=
X-Google-Smtp-Source: APiQypLjNAOdemMbS+fEUufwrtoBOcnrQImk9ByH/xFC4OeSM8yEV1JhInStnUOVvSaZDbZoAxy2Rw==
X-Received: by 2002:a05:600c:2dcf:: with SMTP id e15mr874533wmh.171.1588134280984;
        Tue, 28 Apr 2020 21:24:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:668b:: with SMTP id l11ls30690268wru.0.gmail; Tue, 28
 Apr 2020 21:24:40 -0700 (PDT)
X-Received: by 2002:adf:fecd:: with SMTP id q13mr38970015wrs.12.1588134280176;
        Tue, 28 Apr 2020 21:24:40 -0700 (PDT)
Received: from m9a0013g.houston.softwaregrp.com (m9a0013g.houston.softwaregrp.com. [15.124.64.91])
        by gmr-mx.google.com with ESMTPS id o9si1036357wrp.3.2020.04.28.21.24.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 21:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of lyan@suse.com designates 15.124.64.91 as permitted sender) client-ip=15.124.64.91;
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY m9a0013g.houston.softwaregrp.com WITH ESMTP;
 Wed, 29 Apr 2020 04:23:52 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 29 Apr 2020 04:21:05 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 29 Apr 2020 04:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSgs4YyCBaWFDrvg7Ln0xwbk/IFVCCsMCRjgby7UBFi1K3AtzBnGneWVNeS0qgHxxUqJTmz00C7xdrukKfF2qTObtoUVguieUEA7tan/Ts/hmfxtVI+4vImBFjPY6DK/ZS5cJEwohamxglfzgWAignddl5XBeAtelMd6s5HdK55Ad7p855oGhgU98ZlDbSTmqUNnf8t30cAvkujINkLYhr5M06WdzE9+FLFzCeA8r424zL0MHsY2JNc7hbdT/ZrbhSODhdiO8hsK6Tu1Z1xfCoIETV614/iXcAFGMllSOL2udTKpiNUaodmkOyaZ08VFSakEhn45ixU4e0mcxyv96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8VQ6wywrf6WecrtV+o1PSEPr+F9Mcew6aGKCFsm63Q=;
 b=I12WtP8Ay7Oinm0j7NvH5pj7ajuD8PyTt6NImESPVPRyuAYoLptAVitUyqYoQJ0jMXkxdNOVmIE9gA4KrmTM0MXuijGqJX+mQM/MImyeoCOakenf/iyBagNA+AXpo6CimfTmdYOwX4/neZU+layXUDyg0N7aAT8My9LR4NCEY7vpqwDKC9+hLyr3UjAbvVbSJgiFmXPhucT7BaDK8e8RLIbzmviJ84I18+IlkWqpruAbMvsMluJwxg+66g+OQGtRJHknjYEHX0ik1Pv1cTY13dSwE+yAfVOJgjKHKnJ1qquUayjZE6LNOzY+tWbc5nsqrWM6lr+OII6tyYNkt6yXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB3047.namprd18.prod.outlook.com (2603:10b6:a03:105::32)
 by BYAPR18MB2549.namprd18.prod.outlook.com (2603:10b6:a03:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 04:21:03 +0000
Received: from BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1]) by BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1%4]) with mapi id 15.20.2937.026; Wed, 29 Apr 2020
 04:21:03 +0000
Subject: Re: [RFC][PATCH v2 1/3] hw/misc: Add implementation of ivshmem
 revision 2 device
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
	<claudio.fontana@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <5542adccc5bda38da2cd0f46398850dc4ec31f2a.1578407802.git.jan.kiszka@siemens.com>
From: Liang Yan <lyan@suse.com>
Autocrypt: addr=lyan@suse.com; prefer-encrypt=mutual; keydata=
 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
 yMQQ+LPXfanS4w==
Message-ID: <abe599e5-eca6-7473-ce80-ed4093485061@suse.com>
Date: Wed, 29 Apr 2020 00:20:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <5542adccc5bda38da2cd0f46398850dc4ec31f2a.1578407802.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-ClientProxiedBy: BL0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:2d::42) To BYAPR18MB3047.namprd18.prod.outlook.com
 (2603:10b6:a03:105::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a000:160e:228::ab4] (2605:a000:160e:228::ab4) by BL0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:2d::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Wed, 29 Apr 2020 04:21:01 +0000
X-Originating-IP: [2605:a000:160e:228::ab4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ddf5278-1e5d-474b-4422-08d7ebf4ba64
X-MS-TrafficTypeDiagnostic: BYAPR18MB2549:
X-Microsoft-Antispam-PRVS: <BYAPR18MB254927AB35C82736C4FDAF86BFAD0@BYAPR18MB2549.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:38;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB3047.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(31696002)(966005)(30864003)(53546011)(52116002)(36756003)(5660300002)(8676002)(31686004)(2906002)(66946007)(66476007)(110136005)(316002)(8936002)(6486002)(478600001)(54906003)(16526019)(4326008)(186003)(2616005)(66556008)(86362001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTsUPrwRYO7eSveVL3+5VtYwErfqXKEsA/Wt/t2jb1vzQxen8Vwc959SgGDm2fxWtVZRZnKFkQUloTv7D4E9p1OymEbP++DwfIOz4uG2n7cobCqLcl3mdCVMDTuKiQbV1MmWJM8mIpuMCU3oQXB86n3fs4BGetFXo9q3iU38xKAq3V31YerXBBX3J0oNr7khZgA+5Sg3fN1LZCS5o5wfA6WChq5fCyWv0IPL04ebL5+2AED7/wjfV2IfQudicp2nXtcjHlRTxM46MB2xjXQfdTjcleYYQjHDozGxTTHHPX8RD5gIkGdJ5YrlCWaTn4+08Dhr+a7e1DJ4KoB50+4xl0I35LyP/T7KfBJ8S/8DAtYMieGqKRrpjeyDLJGw+XYlIZD/JXLDP8oe8qYWhH8ii4iz4X1Pb8itxSAi9nCMICDN4p7YULEy34aLagsotSv1IRRHqxo9c1ublLsXWuyM0Q58Q0JOGY7rrmaHgmKQJxnJ9Y38FqzELxHuu4a14VHiPAmSQb4q6Cj7TgjyG62aNw==
X-MS-Exchange-AntiSpam-MessageData: 9rg+HY7jSIOD96LcT/uk2lSzg6naV/PoEHG4Yvyz5MJ0EmtpuhmWD3x5SLXWyRCYEHWYx3EwR8F2uoRU6yiBnL7HFkW3MBMbCZFNFw4VboD006/tS6bKxhYfcmzqIetelesXugGYsOHRmzqAS4s8pyiQFyWIfxAEl9ADoHMBaBwemhcZdDDnuwVWebjIxZEsPSZXFnn77m9NF7F3Qnok2HfDifw17T468Xa3wJH+NwiMwo3bYuYlWYgoZVYkABu+76B+HxfWoJ5mIVfZrJIuJTQntEJjgTivXkLywRG8RzzV9JgYhQltcE96TIHyDaxi/f10EhS0MgpGmb7GVDOQ8Aow7b/drbkhEGTWocX5yVbC4gBTD6xm91V9KgKHe+IY8EOenC3uB+ds8kmWqygTnZcj0HwWyV6bAktGGrwbX/a8VwRRcOqf/Zs4H+rvd47NgGFkeTvhgWr4N5Tf3ugg8z2pgmBbe0QC0P9s9ISbWOE0cLdz1EHjZ0eIXl/lwX5obFDX5jvV23ZpxrXcClxBCq+b8Y17hFzOVOrlrgba5kBkwLlOtSwtOhO+bXC3g+OS327QS0DM5tmkNEecA1lAt92IKF99UaB4k0byRHsB2Dxa/4CztB+x/0+nea3NATkJ0SuS8hlwJlnTYAm7uujKd1NNzfoVg3LCgEMjJJo4AWu9XfAUyuLSANYkHNENII6axgNgXrATFzYuz0P1ln/rkb6GmC/KBiiB4Ct4redpYX47JY8jPeIXiIOyLX9XivFZynP7Ja+ycPzIyQpDPF1qqhTiyuV2QDwO1zRhFZKz0FfRA+T6WmjlTfubgYjKPq7I6eEpbYPi4MlfJxODHkdbPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddf5278-1e5d-474b-4422-08d7ebf4ba64
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 04:21:03.2732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z4Pt5WqcaOkpPg7YtWLjfejmHLKWHTG4Htok1lhpzljY3ZHpnapJN/FkzFrSGMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2549
X-OriginatorOrg: suse.com
X-Original-Sender: lyan@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       arc=fail (body
 hash mismatch);       spf=pass (google.com: domain of lyan@suse.com
 designates 15.124.64.91 as permitted sender) smtp.mailfrom=LYan@suse.com
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

A quick check by checkpatch.pl, pretty straightforward to fix.

ERROR: return is not a function, parentheses are not required
#211: FILE: hw/misc/ivshmem2.c:138:
+    return (ivs->features & (1 << feature));

ERROR: memory barrier without comment
#255: FILE: hw/misc/ivshmem2.c:182:
+    smp_mb();

ERROR: braces {} are necessary for all arms of this statement
#626: FILE: hw/misc/ivshmem2.c:553:
+    if (msg->vector == 0)
[...]

Best,
Liang


On 1/7/20 9:36 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This adds a reimplementation of ivshmem in its new revision 2 as
> separate device. The goal of this is not to enable sharing with v1,
> rather to allow explore the properties and potential limitation of the
> new version prior to discussing its integration with the existing code.
> 
> v2 always requires a server to interconnect two more more QEMU
> instances because it provides signaling between peers unconditionally.
> Therefore, only the interconnecting chardev, master mode, and the usage
> of ioeventfd can be configured at device level. All other parameters are
> defined by the server instance.
> 
> A new server protocol is introduced along this. Its primary difference
> is the introduction of a single welcome message that contains all peer
> parameters, rather than a series of single-word messages pushing them
> piece by piece.
> 
> A complicating difference in interrupt handling, compare to v1, is the
> auto-disable mode of v2: When this is active, interrupt delivery is
> disabled by the device after each interrupt event. This prevents the
> usage of irqfd on the receiving side, but it lowers the handling cost
> for guests that implemented interrupt throttling this way (specifically
> when exposing the device via UIO).
> 
> No changes have been made to the ivshmem device regarding migration:
> Only the master can live-migrate, slave peers have to hot-unplug the
> device first.
> 
> The details of the device model will be specified in a succeeding
> commit. Drivers for this device can currently be found under
> 
> http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
> 
> To instantiate a ivshmem v2 device, just add
> 
>  ... -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem \
>      -device ivshmem,chardev=ivshmem
> 
> provided the server opened its socket under the default path.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/misc/Makefile.objs      |    2 +-
>  hw/misc/ivshmem2.c         | 1085 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/ivshmem2.h |   48 ++
>  include/hw/pci/pci_ids.h   |    2 +
>  4 files changed, 1136 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/ivshmem2.c
>  create mode 100644 include/hw/misc/ivshmem2.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ba898a5781..90a4a6608c 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -26,7 +26,7 @@ common-obj-$(CONFIG_PUV3) += puv3_pm.o
>  
>  common-obj-$(CONFIG_MACIO) += macio/
>  
> -common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
> +common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o ivshmem2.o
>  
>  common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
>  common-obj-$(CONFIG_NSERIES) += cbus.o
> diff --git a/hw/misc/ivshmem2.c b/hw/misc/ivshmem2.c
> new file mode 100644
> index 0000000000..d5f88ed0e9
> --- /dev/null
> +++ b/hw/misc/ivshmem2.c
> @@ -0,0 +1,1085 @@
> +/*
> + * Inter-VM Shared Memory PCI device, version 2.
> + *
> + * Copyright (c) Siemens AG, 2019
> + *
> + * Authors:
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *
> + * Based on ivshmem.c by Cam Macdonell <cam@cs.ualberta.ca>
> + *
> + * This code is licensed under the GNU GPL v2.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "qemu/cutils.h"
> +#include "hw/hw.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/msi.h"
> +#include "hw/pci/msix.h"
> +#include "hw/qdev-properties.h"
> +#include "sysemu/kvm.h"
> +#include "migration/blocker.h"
> +#include "migration/vmstate.h"
> +#include "qemu/error-report.h"
> +#include "qemu/event_notifier.h"
> +#include "qemu/module.h"
> +#include "qom/object_interfaces.h"
> +#include "chardev/char-fe.h"
> +#include "sysemu/qtest.h"
> +#include "qapi/visitor.h"
> +
> +#include "hw/misc/ivshmem2.h"
> +
> +#define PCI_VENDOR_ID_IVSHMEM   PCI_VENDOR_ID_SIEMENS
> +#define PCI_DEVICE_ID_IVSHMEM   0x4106
> +
> +#define IVSHMEM_MAX_PEERS       UINT16_MAX
> +#define IVSHMEM_IOEVENTFD       0
> +#define IVSHMEM_MSI             1
> +
> +#define IVSHMEM_REG_BAR_SIZE    0x1000
> +
> +#define IVSHMEM_REG_ID          0x00
> +#define IVSHMEM_REG_MAX_PEERS   0x04
> +#define IVSHMEM_REG_INT_CTRL    0x08
> +#define IVSHMEM_REG_DOORBELL    0x0c
> +#define IVSHMEM_REG_STATE       0x10
> +
> +#define IVSHMEM_INT_ENABLE      0x1
> +
> +#define IVSHMEM_ONESHOT_MODE    0x1
> +
> +#define IVSHMEM_DEBUG 0
> +#define IVSHMEM_DPRINTF(fmt, ...)                       \
> +    do {                                                \
> +        if (IVSHMEM_DEBUG) {                            \
> +            printf("IVSHMEM: " fmt, ## __VA_ARGS__);    \
> +        }                                               \
> +    } while (0)
> +
> +#define TYPE_IVSHMEM "ivshmem"
> +#define IVSHMEM(obj) \
> +    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM)
> +
> +typedef struct Peer {
> +    int nb_eventfds;
> +    EventNotifier *eventfds;
> +} Peer;
> +
> +typedef struct MSIVector {
> +    PCIDevice *pdev;
> +    int virq;
> +    bool unmasked;
> +} MSIVector;
> +
> +typedef struct IVShmemVndrCap {
> +    uint8_t id;
> +    uint8_t next;
> +    uint8_t length;
> +    uint8_t priv_ctrl;
> +    uint32_t state_tab_sz;
> +    uint64_t rw_section_sz;
> +    uint64_t output_section_sz;
> +} IVShmemVndrCap;
> +
> +typedef struct IVShmemState {
> +    /*< private >*/
> +    PCIDevice parent_obj;
> +    /*< public >*/
> +
> +    uint32_t features;
> +
> +    CharBackend server_chr;
> +
> +    /* registers */
> +    uint8_t *priv_ctrl;
> +    uint32_t vm_id;
> +    uint32_t intctrl;
> +    uint32_t state;
> +
> +    /* BARs */
> +    MemoryRegion ivshmem_mmio; /* BAR 0 (registers) */
> +    MemoryRegion ivshmem_bar2; /* BAR 2 (shared memory) */
> +
> +    void *shmem;
> +    size_t shmem_sz;
> +    size_t output_section_sz;
> +
> +    MemoryRegion state_tab;
> +    MemoryRegion rw_section;
> +    MemoryRegion input_sections;
> +    MemoryRegion output_section;
> +
> +    /* interrupt support */
> +    Peer *peers;
> +    int nb_peers;               /* space in @peers[] */
> +    uint32_t max_peers;
> +    uint32_t vectors;
> +    MSIVector *msi_vectors;
> +
> +    uint8_t msg_buf[32];        /* buffer for receiving server messages */
> +    int msg_buffered_bytes;     /* #bytes in @msg_buf */
> +
> +    uint32_t protocol;
> +
> +    /* migration stuff */
> +    OnOffAuto master;
> +    Error *migration_blocker;
> +} IVShmemState;
> +
> +static void ivshmem_enable_irqfd(IVShmemState *s);
> +static void ivshmem_disable_irqfd(IVShmemState *s);
> +
> +static inline uint32_t ivshmem_has_feature(IVShmemState *ivs,
> +                                           unsigned int feature) {
> +    return (ivs->features & (1 << feature));
> +}
> +
> +static inline bool ivshmem_is_master(IVShmemState *s)
> +{
> +    assert(s->master != ON_OFF_AUTO_AUTO);
> +    return s->master == ON_OFF_AUTO_ON;
> +}
> +
> +static bool ivshmem_irqfd_usable(IVShmemState *s)
> +{
> +    PCIDevice *pdev = PCI_DEVICE(s);
> +
> +    return (s->intctrl & IVSHMEM_INT_ENABLE) && msix_enabled(pdev) &&
> +        !(*s->priv_ctrl & IVSHMEM_ONESHOT_MODE);
> +}
> +
> +static void ivshmem_update_irqfd(IVShmemState *s, bool was_usable)
> +{
> +    bool is_usable = ivshmem_irqfd_usable(s);
> +
> +    if (kvm_msi_via_irqfd_enabled()) {
> +        if (!was_usable && is_usable) {
> +            ivshmem_enable_irqfd(s);
> +        } else if (was_usable && !is_usable) {
> +            ivshmem_disable_irqfd(s);
> +        }
> +    }
> +}
> +
> +static void ivshmem_write_intctrl(IVShmemState *s, uint32_t new_state)
> +{
> +    bool was_usable = ivshmem_irqfd_usable(s);
> +
> +    s->intctrl = new_state & IVSHMEM_INT_ENABLE;
> +    ivshmem_update_irqfd(s, was_usable);
> +}
> +
> +static void ivshmem_write_state(IVShmemState *s, uint32_t new_state)
> +{
> +    uint32_t *state_table = s->shmem;
> +    int peer;
> +
> +    state_table[s->vm_id] = new_state;
> +    smp_mb();
> +
> +    if (s->state != new_state) {
> +        s->state = new_state;
> +        for (peer = 0; peer < s->nb_peers; peer++) {
> +            if (peer != s->vm_id && s->peers[peer].nb_eventfds > 0) {
> +                event_notifier_set(&s->peers[peer].eventfds[0]);
> +            }
> +        }
> +    }
> +}
> +
> +static void ivshmem_io_write(void *opaque, hwaddr addr,
> +                             uint64_t val, unsigned size)
> +{
> +    IVShmemState *s = opaque;
> +
> +    uint16_t dest = val >> 16;
> +    uint16_t vector = val & 0xff;
> +
> +    addr &= 0xfc;
> +
> +    IVSHMEM_DPRINTF("writing to addr " TARGET_FMT_plx "\n", addr);
> +    switch (addr) {
> +    case IVSHMEM_REG_INT_CTRL:
> +        ivshmem_write_intctrl(s, val);
> +        break;
> +
> +    case IVSHMEM_REG_DOORBELL:
> +        /* check that dest VM ID is reasonable */
> +        if (dest >= s->nb_peers) {
> +            IVSHMEM_DPRINTF("Invalid destination VM ID (%d)\n", dest);
> +            break;
> +        }
> +
> +        /* check doorbell range */
> +        if (vector < s->peers[dest].nb_eventfds) {
> +            IVSHMEM_DPRINTF("Notifying VM %d on vector %d\n", dest, vector);
> +            event_notifier_set(&s->peers[dest].eventfds[vector]);
> +        } else {
> +            IVSHMEM_DPRINTF("Invalid destination vector %d on VM %d\n",
> +                            vector, dest);
> +        }
> +        break;
> +
> +    case IVSHMEM_REG_STATE:
> +        ivshmem_write_state(s, val);
> +        break;
> +
> +    default:
> +        IVSHMEM_DPRINTF("Unhandled write " TARGET_FMT_plx "\n", addr);
> +    }
> +}
> +
> +static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
> +                                unsigned size)
> +{
> +    IVShmemState *s = opaque;
> +    uint32_t ret;
> +
> +    switch (addr) {
> +    case IVSHMEM_REG_ID:
> +        ret = s->vm_id;
> +        break;
> +
> +    case IVSHMEM_REG_MAX_PEERS:
> +        ret = s->max_peers;
> +        break;
> +
> +    case IVSHMEM_REG_INT_CTRL:
> +        ret = s->intctrl;
> +        break;
> +
> +    case IVSHMEM_REG_STATE:
> +        ret = s->state;
> +        break;
> +
> +    default:
> +        IVSHMEM_DPRINTF("why are we reading " TARGET_FMT_plx "\n", addr);
> +        ret = 0;
> +    }
> +
> +    return ret;
> +}
> +
> +static const MemoryRegionOps ivshmem_mmio_ops = {
> +    .read = ivshmem_io_read,
> +    .write = ivshmem_io_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void ivshmem_vector_notify(void *opaque)
> +{
> +    MSIVector *entry = opaque;
> +    PCIDevice *pdev = entry->pdev;
> +    IVShmemState *s = IVSHMEM(pdev);
> +    int vector = entry - s->msi_vectors;
> +    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
> +
> +    if (!event_notifier_test_and_clear(n) ||
> +        !(s->intctrl & IVSHMEM_INT_ENABLE)) {
> +        return;
> +    }
> +
> +    IVSHMEM_DPRINTF("interrupt on vector %p %d\n", pdev, vector);
> +    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        if (msix_enabled(pdev)) {
> +            msix_notify(pdev, vector);
> +        }
> +    } else if (pdev->config[PCI_INTERRUPT_PIN]) {
> +        pci_set_irq(pdev, 1);
> +        pci_set_irq(pdev, 0);
> +    }
> +    if (*s->priv_ctrl & IVSHMEM_ONESHOT_MODE) {
> +        s->intctrl &= ~IVSHMEM_INT_ENABLE;
> +    }
> +}
> +
> +static int ivshmem_irqfd_vector_unmask(PCIDevice *dev, unsigned vector,
> +                                       MSIMessage msg)
> +{
> +    IVShmemState *s = IVSHMEM(dev);
> +    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
> +    MSIVector *v = &s->msi_vectors[vector];
> +    int ret;
> +
> +    IVSHMEM_DPRINTF("vector unmask %p %d\n", dev, vector);
> +    if (!v->pdev) {
> +        error_report("ivshmem: vector %d route does not exist", vector);
> +        return -EINVAL;
> +    }
> +    assert(!v->unmasked);
> +
> +    ret = kvm_irqchip_add_msi_route(kvm_state, vector, dev);
> +    if (ret < 0) {
> +        error_report("kvm_irqchip_add_msi_route failed");
> +        return ret;
> +    }
> +    v->virq = ret;
> +    kvm_irqchip_commit_routes(kvm_state);
> +
> +    ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, v->virq);
> +    if (ret < 0) {
> +        error_report("kvm_irqchip_add_irqfd_notifier_gsi failed");
> +        return ret;
> +    }
> +    v->unmasked = true;
> +
> +    return 0;
> +}
> +
> +static void ivshmem_irqfd_vector_mask(PCIDevice *dev, unsigned vector)
> +{
> +    IVShmemState *s = IVSHMEM(dev);
> +    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
> +    MSIVector *v = &s->msi_vectors[vector];
> +    int ret;
> +
> +    IVSHMEM_DPRINTF("vector mask %p %d\n", dev, vector);
> +    if (!v->pdev) {
> +        error_report("ivshmem: vector %d route does not exist", vector);
> +        return;
> +    }
> +    assert(v->unmasked);
> +
> +    ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, v->virq);
> +    if (ret < 0) {
> +        error_report("remove_irqfd_notifier_gsi failed");
> +        return;
> +    }
> +    kvm_irqchip_release_virq(kvm_state, v->virq);
> +
> +    v->unmasked = false;
> +}
> +
> +static void ivshmem_irqfd_vector_poll(PCIDevice *dev,
> +                                      unsigned int vector_start,
> +                                      unsigned int vector_end)
> +{
> +    IVShmemState *s = IVSHMEM(dev);
> +    unsigned int vector;
> +
> +    IVSHMEM_DPRINTF("vector poll %p %d-%d\n", dev, vector_start, vector_end);
> +
> +    vector_end = MIN(vector_end, s->vectors);
> +
> +    for (vector = vector_start; vector < vector_end; vector++) {
> +        EventNotifier *notifier = &s->peers[s->vm_id].eventfds[vector];
> +
> +        if (!msix_is_masked(dev, vector)) {
> +            continue;
> +        }
> +
> +        if (event_notifier_test_and_clear(notifier)) {
> +            msix_set_pending(dev, vector);
> +        }
> +    }
> +}
> +
> +static void ivshmem_watch_vector_notifier(IVShmemState *s, int vector)
> +{
> +    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
> +    int eventfd = event_notifier_get_fd(n);
> +
> +    assert(!s->msi_vectors[vector].pdev);
> +    s->msi_vectors[vector].pdev = PCI_DEVICE(s);
> +
> +    qemu_set_fd_handler(eventfd, ivshmem_vector_notify,
> +                        NULL, &s->msi_vectors[vector]);
> +}
> +
> +static void ivshmem_unwatch_vector_notifier(IVShmemState *s, int vector)
> +{
> +    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
> +    int eventfd = event_notifier_get_fd(n);
> +
> +    if (!s->msi_vectors[vector].pdev) {
> +        return;
> +    }
> +
> +    qemu_set_fd_handler(eventfd, NULL, NULL, NULL);
> +
> +    s->msi_vectors[vector].pdev = NULL;
> +}
> +
> +static void ivshmem_add_eventfd(IVShmemState *s, int posn, int i)
> +{
> +    memory_region_add_eventfd(&s->ivshmem_mmio,
> +                              IVSHMEM_REG_DOORBELL,
> +                              4,
> +                              true,
> +                              (posn << 16) | i,
> +                              &s->peers[posn].eventfds[i]);
> +}
> +
> +static void ivshmem_del_eventfd(IVShmemState *s, int posn, int i)
> +{
> +    memory_region_del_eventfd(&s->ivshmem_mmio,
> +                              IVSHMEM_REG_DOORBELL,
> +                              4,
> +                              true,
> +                              (posn << 16) | i,
> +                              &s->peers[posn].eventfds[i]);
> +}
> +
> +static void close_peer_eventfds(IVShmemState *s, int posn)
> +{
> +    int i, n;
> +
> +    assert(posn >= 0 && posn < s->nb_peers);
> +    n = s->peers[posn].nb_eventfds;
> +
> +    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD)) {
> +        memory_region_transaction_begin();
> +        for (i = 0; i < n; i++) {
> +            ivshmem_del_eventfd(s, posn, i);
> +        }
> +        memory_region_transaction_commit();
> +    }
> +
> +    for (i = 0; i < n; i++) {
> +        event_notifier_cleanup(&s->peers[posn].eventfds[i]);
> +    }
> +
> +    g_free(s->peers[posn].eventfds);
> +    s->peers[posn].nb_eventfds = 0;
> +}
> +
> +static void resize_peers(IVShmemState *s, int nb_peers)
> +{
> +    int old_nb_peers = s->nb_peers;
> +    int i;
> +
> +    assert(nb_peers > old_nb_peers);
> +    IVSHMEM_DPRINTF("bumping storage to %d peers\n", nb_peers);
> +
> +    s->peers = g_realloc(s->peers, nb_peers * sizeof(Peer));
> +    s->nb_peers = nb_peers;
> +
> +    for (i = old_nb_peers; i < nb_peers; i++) {
> +        s->peers[i].eventfds = NULL;
> +        s->peers[i].nb_eventfds = 0;
> +    }
> +}
> +
> +static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector, Error **errp)
> +{
> +    PCIDevice *pdev = PCI_DEVICE(s);
> +
> +    IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
> +    assert(!s->msi_vectors[vector].pdev);
> +
> +    s->msi_vectors[vector].unmasked = false;
> +    s->msi_vectors[vector].pdev = pdev;
> +}
> +
> +static void ivshmem_remove_kvm_msi_virq(IVShmemState *s, int vector)
> +{
> +    IVSHMEM_DPRINTF("ivshmem_remove_kvm_msi_virq vector:%d\n", vector);
> +
> +    if (s->msi_vectors[vector].pdev == NULL) {
> +        return;
> +    }
> +
> +    if (s->msi_vectors[vector].unmasked) {
> +        ivshmem_irqfd_vector_mask(s->msi_vectors[vector].pdev, vector);
> +    }
> +
> +    s->msi_vectors[vector].pdev = NULL;
> +}
> +
> +static void process_msg_disconnect(IVShmemState *s, IvshmemPeerGone *msg,
> +                                   Error **errp)
> +{
> +    if (msg->header.len < sizeof(*msg)) {
> +        error_setg(errp, "Invalid peer-gone message size");
> +        return;
> +    }
> +
> +    le32_to_cpus(&msg->id);
> +
> +    IVSHMEM_DPRINTF("peer %d has gone away\n", msg->id);
> +    if (msg->id >= s->nb_peers || msg->id == s->vm_id) {
> +        error_setg(errp, "invalid peer %d", msg->id);
> +        return;
> +    }
> +    close_peer_eventfds(s, msg->id);
> +    event_notifier_set(&s->peers[s->vm_id].eventfds[0]);
> +}
> +
> +static void process_msg_connect(IVShmemState *s, IvshmemEventFd *msg, int fd,
> +                                Error **errp)
> +{
> +    Peer *peer;
> +
> +    if (msg->header.len < sizeof(*msg)) {
> +        error_setg(errp, "Invalid eventfd message size");
> +        close(fd);
> +        return;
> +    }
> +
> +    le32_to_cpus(&msg->id);
> +    le32_to_cpus(&msg->vector);
> +
> +    if (msg->id >= s->nb_peers) {
> +        resize_peers(s, msg->id + 1);
> +    }
> +
> +    peer = &s->peers[msg->id];
> +
> +    /*
> +     * The N-th connect message for this peer comes with the file
> +     * descriptor for vector N-1.
> +     */
> +    if (msg->vector != peer->nb_eventfds) {
> +        error_setg(errp, "Received vector %d out of order", msg->vector);
> +        close(fd);
> +        return;
> +    }
> +    if (peer->nb_eventfds >= s->vectors) {
> +        error_setg(errp, "Too many eventfd received, device has %d vectors",
> +                   s->vectors);
> +        close(fd);
> +        return;
> +    }
> +    peer->nb_eventfds++;
> +
> +    if (msg->vector == 0)
> +        peer->eventfds = g_new0(EventNotifier, s->vectors);
> +
> +    IVSHMEM_DPRINTF("eventfds[%d][%d] = %d\n", msg->id, msg->vector, fd);
> +    event_notifier_init_fd(&peer->eventfds[msg->vector], fd);
> +    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
> +
> +    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD)) {
> +        ivshmem_add_eventfd(s, msg->id, msg->vector);
> +    }
> +
> +    if (msg->id == s->vm_id) {
> +        ivshmem_watch_vector_notifier(s, peer->nb_eventfds - 1);
> +    }
> +}
> +
> +static int ivshmem_can_receive(void *opaque)
> +{
> +    IVShmemState *s = opaque;
> +
> +    assert(s->msg_buffered_bytes < sizeof(s->msg_buf));
> +    return sizeof(s->msg_buf) - s->msg_buffered_bytes;
> +}
> +
> +static void ivshmem_read(void *opaque, const uint8_t *buf, int size)
> +{
> +    IVShmemState *s = opaque;
> +    IvshmemMsgHeader *header = (IvshmemMsgHeader *)&s->msg_buf;
> +    Error *err = NULL;
> +    int fd;
> +
> +    assert(size >= 0 && s->msg_buffered_bytes + size <= sizeof(s->msg_buf));
> +    memcpy(s->msg_buf + s->msg_buffered_bytes, buf, size);
> +    s->msg_buffered_bytes += size;
> +    if (s->msg_buffered_bytes < sizeof(*header) ||
> +        s->msg_buffered_bytes < le32_to_cpu(header->len)) {
> +        return;
> +    }
> +
> +    fd = qemu_chr_fe_get_msgfd(&s->server_chr);
> +
> +    le32_to_cpus(&header->type);
> +    le32_to_cpus(&header->len);
> +
> +    switch (header->type) {
> +    case IVSHMEM_MSG_EVENT_FD:
> +        process_msg_connect(s, (IvshmemEventFd *)header, fd, &err);
> +        break;
> +    case IVSHMEM_MSG_PEER_GONE:
> +        process_msg_disconnect(s, (IvshmemPeerGone *)header, &err);
> +        break;
> +    default:
> +        error_setg(&err, "invalid message, type %d", header->type);
> +        break;
> +    }
> +    if (err) {
> +        error_report_err(err);
> +    }
> +
> +    s->msg_buffered_bytes -= header->len;
> +    memmove(s->msg_buf, s->msg_buf + header->len, s->msg_buffered_bytes);
> +}
> +
> +static void ivshmem_recv_setup(IVShmemState *s, Error **errp)
> +{
> +    IvshmemInitialInfo msg;
> +    struct stat buf;
> +    uint8_t dummy;
> +    int fd, n, ret;
> +
> +    n = 0;
> +    do {
> +        ret = qemu_chr_fe_read_all(&s->server_chr, (uint8_t *)&msg + n,
> +                                   sizeof(msg) - n);
> +        if (ret < 0) {
> +            if (ret == -EINTR) {
> +                continue;
> +            }
> +            error_setg_errno(errp, -ret, "read from server failed");
> +            return;
> +        }
> +        n += ret;
> +    } while (n < sizeof(msg));
> +
> +    fd = qemu_chr_fe_get_msgfd(&s->server_chr);
> +
> +    le32_to_cpus(&msg.header.type);
> +    le32_to_cpus(&msg.header.len);
> +    if (msg.header.type != IVSHMEM_MSG_INIT || msg.header.len < sizeof(msg)) {
> +        error_setg(errp, "server sent invalid initial info");
> +        return;
> +    }
> +
> +    /* consume additional bytes of message */
> +    msg.header.len -= sizeof(msg);
> +    while (msg.header.len > 0) {
> +        ret = qemu_chr_fe_read_all(&s->server_chr, &dummy, 1);
> +        if (ret < 0) {
> +            if (ret == -EINTR) {
> +                continue;
> +            }
> +            error_setg_errno(errp, -ret, "read from server failed");
> +            return;
> +        }
> +        msg.header.len -= ret;
> +    }
> +
> +    le32_to_cpus(&msg.compatible_version);
> +    if (msg.compatible_version != IVSHMEM_PROTOCOL_VERSION) {
> +        error_setg(errp, "server sent compatible version %u, expecting %u",
> +                   msg.compatible_version, IVSHMEM_PROTOCOL_VERSION);
> +        return;
> +    }
> +
> +    le32_to_cpus(&msg.id);
> +    if (msg.id > IVSHMEM_MAX_PEERS) {
> +        error_setg(errp, "server sent invalid ID");
> +        return;
> +    }
> +    s->vm_id = msg.id;
> +
> +    if (fstat(fd, &buf) < 0) {
> +        error_setg_errno(errp, errno,
> +            "can't determine size of shared memory sent by server");
> +        close(fd);
> +        return;
> +    }
> +
> +    s->shmem_sz = buf.st_size;
> +
> +    s->shmem = mmap(NULL, s->shmem_sz, PROT_READ | PROT_WRITE, MAP_SHARED,
> +                    fd, 0);
> +    if (s->shmem == MAP_FAILED) {
> +        error_setg_errno(errp, errno,
> +                         "can't map shared memory sent by server");
> +        return;
> +    }
> +
> +    le32_to_cpus(&msg.vectors);
> +    if (msg.vectors < 1 || msg.vectors > 1024) {
> +        error_setg(errp, "server sent invalid number of vectors message");
> +        return;
> +    }
> +    s->vectors = msg.vectors;
> +
> +    s->max_peers = le32_to_cpu(msg.max_peers);
> +    s->protocol = le32_to_cpu(msg.protocol);
> +    s->output_section_sz = le64_to_cpu(msg.output_section_size);
> +}
> +
> +/* Select the MSI-X vectors used by device.
> + * ivshmem maps events to vectors statically, so
> + * we just enable all vectors on init and after reset. */
> +static void ivshmem_msix_vector_use(IVShmemState *s)
> +{
> +    PCIDevice *d = PCI_DEVICE(s);
> +    int i;
> +
> +    for (i = 0; i < s->vectors; i++) {
> +        msix_vector_use(d, i);
> +    }
> +}
> +
> +static void ivshmem_reset(DeviceState *d)
> +{
> +    IVShmemState *s = IVSHMEM(d);
> +
> +    ivshmem_disable_irqfd(s);
> +
> +    s->intctrl = 0;
> +    ivshmem_write_state(s, 0);
> +    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        ivshmem_msix_vector_use(s);
> +    }
> +}
> +
> +static int ivshmem_setup_interrupts(IVShmemState *s, Error **errp)
> +{
> +    /* allocate QEMU callback data for receiving interrupts */
> +    s->msi_vectors = g_malloc0(s->vectors * sizeof(MSIVector));
> +
> +    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        if (msix_init_exclusive_bar(PCI_DEVICE(s), s->vectors, 1, errp)) {
> +            IVSHMEM_DPRINTF("msix requested but not available - disabling\n");
> +            s->features &= ~(IVSHMEM_MSI | IVSHMEM_IOEVENTFD);
> +        } else {
> +            IVSHMEM_DPRINTF("msix initialized (%d vectors)\n", s->vectors);
> +            ivshmem_msix_vector_use(s);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void ivshmem_enable_irqfd(IVShmemState *s)
> +{
> +    PCIDevice *pdev = PCI_DEVICE(s);
> +    int i;
> +
> +    for (i = 0; i < s->peers[s->vm_id].nb_eventfds; i++) {
> +        Error *err = NULL;
> +
> +        ivshmem_unwatch_vector_notifier(s, i);
> +
> +        ivshmem_add_kvm_msi_virq(s, i, &err);
> +        if (err) {
> +            error_report_err(err);
> +            goto undo;
> +        }
> +    }
> +
> +    if (msix_set_vector_notifiers(pdev,
> +                                  ivshmem_irqfd_vector_unmask,
> +                                  ivshmem_irqfd_vector_mask,
> +                                  ivshmem_irqfd_vector_poll)) {
> +        error_report("ivshmem: msix_set_vector_notifiers failed");
> +        goto undo;
> +    }
> +    return;
> +
> +undo:
> +    while (--i >= 0) {
> +        ivshmem_remove_kvm_msi_virq(s, i);
> +    }
> +}
> +
> +static void ivshmem_disable_irqfd(IVShmemState *s)
> +{
> +    PCIDevice *pdev = PCI_DEVICE(s);
> +    int i;
> +
> +    if (!pdev->msix_vector_use_notifier) {
> +        return;
> +    }
> +
> +    msix_unset_vector_notifiers(pdev);
> +
> +    for (i = 0; i < s->peers[s->vm_id].nb_eventfds; i++) {
> +        ivshmem_remove_kvm_msi_virq(s, i);
> +        ivshmem_watch_vector_notifier(s, i);
> +    }
> +
> +}
> +
> +static void ivshmem_write_config(PCIDevice *pdev, uint32_t address,
> +                                 uint32_t val, int len)
> +{
> +    IVShmemState *s = IVSHMEM(pdev);
> +    bool was_usable = ivshmem_irqfd_usable(s);
> +
> +    pci_default_write_config(pdev, address, val, len);
> +    ivshmem_update_irqfd(s, was_usable);
> +}
> +
> +static void ivshmem_exit(PCIDevice *dev)
> +{
> +    IVShmemState *s = IVSHMEM(dev);
> +    int i;
> +
> +    if (s->migration_blocker) {
> +        migrate_del_blocker(s->migration_blocker);
> +        error_free(s->migration_blocker);
> +    }
> +
> +    if (memory_region_is_mapped(&s->rw_section)) {
> +        void *addr = memory_region_get_ram_ptr(&s->rw_section);
> +        int fd;
> +
> +        if (munmap(addr, memory_region_size(&s->rw_section) == -1)) {
> +            error_report("Failed to munmap shared memory %s",
> +                         strerror(errno));
> +        }
> +
> +        fd = memory_region_get_fd(&s->rw_section);
> +        close(fd);
> +
> +        vmstate_unregister_ram(&s->state_tab, DEVICE(dev));
> +        vmstate_unregister_ram(&s->rw_section, DEVICE(dev));
> +    }
> +
> +    if (s->peers) {
> +        for (i = 0; i < s->nb_peers; i++) {
> +            close_peer_eventfds(s, i);
> +        }
> +        g_free(s->peers);
> +    }
> +
> +    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        msix_uninit_exclusive_bar(dev);
> +    }
> +
> +    g_free(s->msi_vectors);
> +}
> +
> +static int ivshmem_pre_load(void *opaque)
> +{
> +    IVShmemState *s = opaque;
> +
> +    if (!ivshmem_is_master(s)) {
> +        error_report("'peer' devices are not migratable");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int ivshmem_post_load(void *opaque, int version_id)
> +{
> +    IVShmemState *s = opaque;
> +
> +    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        ivshmem_msix_vector_use(s);
> +    }
> +    return 0;
> +}
> +
> +static const VMStateDescription ivshmem_vmsd = {
> +    .name = TYPE_IVSHMEM,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .pre_load = ivshmem_pre_load,
> +    .post_load = ivshmem_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(parent_obj, IVShmemState),
> +        VMSTATE_MSIX(parent_obj, IVShmemState),
> +        VMSTATE_UINT32(state, IVShmemState),
> +        VMSTATE_UINT32(intctrl, IVShmemState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static Property ivshmem_properties[] = {
> +    DEFINE_PROP_CHR("chardev", IVShmemState, server_chr),
> +    DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD,
> +                    true),
> +    DEFINE_PROP_ON_OFF_AUTO("master", IVShmemState, master, ON_OFF_AUTO_OFF),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ivshmem_init(Object *obj)
> +{
> +    IVShmemState *s = IVSHMEM(obj);
> +
> +    s->features |= (1 << IVSHMEM_MSI);
> +}
> +
> +static void ivshmem_realize(PCIDevice *dev, Error **errp)
> +{
> +    IVShmemState *s = IVSHMEM(dev);
> +    Chardev *chr = qemu_chr_fe_get_driver(&s->server_chr);
> +    size_t rw_section_sz, input_sections_sz;
> +    IVShmemVndrCap *vndr_cap;
> +    Error *err = NULL;
> +    uint8_t *pci_conf;
> +    int offset, priv_ctrl_pos;
> +    off_t shmem_pos;
> +
> +    if (!qemu_chr_fe_backend_connected(&s->server_chr)) {
> +        error_setg(errp, "You must specify a 'chardev'");
> +        return;
> +    }
> +
> +    /* IRQFD requires MSI */
> +    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD) &&
> +        !ivshmem_has_feature(s, IVSHMEM_MSI)) {
> +        error_setg(errp, "ioeventfd/irqfd requires MSI");
> +        return;
> +    }
> +
> +    pci_conf = dev->config;
> +    pci_conf[PCI_COMMAND] = PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
> +
> +    memory_region_init_io(&s->ivshmem_mmio, OBJECT(s), &ivshmem_mmio_ops, s,
> +                          "ivshmem.mmio", IVSHMEM_REG_BAR_SIZE);
> +
> +    /* region for registers*/
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
> +                     &s->ivshmem_mmio);
> +
> +    assert(chr);
> +    IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
> +                    chr->filename);
> +
> +    /*
> +     * Receive setup messages from server synchronously.
> +     * Older versions did it asynchronously, but that creates a
> +     * number of entertaining race conditions.
> +     */
> +    ivshmem_recv_setup(s, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* we allocate enough space for 16 peers and grow as needed */
> +    resize_peers(s, 16);
> +
> +    if (s->master == ON_OFF_AUTO_ON && s->vm_id != 0) {
> +        error_setg(errp,
> +                   "Master must connect to the server before any peers");
> +        return;
> +    }
> +
> +    qemu_chr_fe_set_handlers(&s->server_chr, ivshmem_can_receive,
> +                             ivshmem_read, NULL, NULL, s, NULL, true);
> +
> +    if (ivshmem_setup_interrupts(s, errp) < 0) {
> +        error_prepend(errp, "Failed to initialize interrupts: ");
> +        return;
> +    }
> +
> +    memory_region_init(&s->ivshmem_bar2, OBJECT(s), "ivshmem.bar2",
> +                       s->shmem_sz);
> +
> +    input_sections_sz = s->output_section_sz * s->max_peers;
> +    if (input_sections_sz + 4096 > s->shmem_sz) {
> +        error_setg(errp,
> +                   "Invalid output section size, shared memory too small");
> +        return;
> +    }
> +    rw_section_sz = s->shmem_sz - input_sections_sz - 4096;
> +
> +    shmem_pos = 0;
> +    memory_region_init_ram_ptr(&s->state_tab, OBJECT(s), "ivshmem.state",
> +                               4096, s->shmem + shmem_pos);
> +    memory_region_set_readonly(&s->state_tab, true);
> +    memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos, &s->state_tab);
> +
> +    vmstate_register_ram(&s->state_tab, DEVICE(s));
> +
> +    if (rw_section_sz > 0) {
> +        shmem_pos += 4096;
> +        memory_region_init_ram_ptr(&s->rw_section, OBJECT(s),
> +                                   "ivshmem.rw-section",
> +                                   rw_section_sz, s->shmem + shmem_pos);
> +        memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos,
> +                                    &s->rw_section);
> +
> +        vmstate_register_ram(&s->rw_section, DEVICE(s));
> +    }
> +
> +    if (s->output_section_sz > 0) {
> +        shmem_pos += rw_section_sz;
> +        memory_region_init_ram_ptr(&s->input_sections, OBJECT(s),
> +                                   "ivshmem.input-sections", input_sections_sz,
> +                                   s->shmem + shmem_pos);
> +        memory_region_set_readonly(&s->input_sections, true);
> +        memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos,
> +                                    &s->input_sections);
> +
> +        shmem_pos += s->vm_id * s->output_section_sz;
> +        memory_region_init_ram_ptr(&s->output_section, OBJECT(s),
> +                                   "ivshmem.output-section",
> +                                   s->output_section_sz, s->shmem + shmem_pos);
> +        memory_region_add_subregion_overlap(&s->ivshmem_bar2, shmem_pos,
> +                                            &s->output_section, 1);
> +
> +        vmstate_register_ram(&s->input_sections, DEVICE(s));
> +    }
> +
> +    pci_config_set_class(dev->config, 0xff00 | (s->protocol >> 8));
> +    pci_config_set_prog_interface(dev->config, (uint8_t)s->protocol);
> +
> +    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, 0x18,
> +                                &error_abort);
> +    vndr_cap = (IVShmemVndrCap *)(pci_conf + offset);
> +    vndr_cap->length = 0x18;
> +    vndr_cap->state_tab_sz = cpu_to_le32(4096);
> +    vndr_cap->rw_section_sz = cpu_to_le64(rw_section_sz);
> +    vndr_cap->output_section_sz = s->output_section_sz;
> +
> +    priv_ctrl_pos = offset + offsetof(IVShmemVndrCap, priv_ctrl);
> +    s->priv_ctrl = &dev->config[priv_ctrl_pos];
> +    dev->wmask[priv_ctrl_pos] |= IVSHMEM_ONESHOT_MODE;
> +
> +    if (s->master == ON_OFF_AUTO_AUTO) {
> +        s->master = s->vm_id == 0 ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> +    }
> +
> +    if (!ivshmem_is_master(s)) {
> +        error_setg(&s->migration_blocker,
> +                   "Migration is disabled when using feature 'peer mode' in device 'ivshmem'");
> +        migrate_add_blocker(s->migration_blocker, &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            error_free(s->migration_blocker);
> +            return;
> +        }
> +    }
> +
> +    pci_register_bar(PCI_DEVICE(s), 2,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                     PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                     PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                     &s->ivshmem_bar2);
> +}
> +
> +static void ivshmem_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    k->realize = ivshmem_realize;
> +    k->exit = ivshmem_exit;
> +    k->config_write = ivshmem_write_config;
> +    k->vendor_id = PCI_VENDOR_ID_IVSHMEM;
> +    k->device_id = PCI_DEVICE_ID_IVSHMEM;
> +    dc->reset = ivshmem_reset;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "Inter-VM shared memory v2";
> +
> +    dc->props = ivshmem_properties;
> +    dc->vmsd = &ivshmem_vmsd;
> +}
> +
> +static const TypeInfo ivshmem_info = {
> +    .name          = TYPE_IVSHMEM,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(IVShmemState),
> +    .instance_init = ivshmem_init,
> +    .class_init    = ivshmem_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void ivshmem_register_types(void)
> +{
> +    type_register_static(&ivshmem_info);
> +}
> +
> +type_init(ivshmem_register_types)
> diff --git a/include/hw/misc/ivshmem2.h b/include/hw/misc/ivshmem2.h
> new file mode 100644
> index 0000000000..ee994699e8
> --- /dev/null
> +++ b/include/hw/misc/ivshmem2.h
> @@ -0,0 +1,48 @@
> +/*
> + * Inter-VM Shared Memory PCI device, Version 2.
> + *
> + * Copyright (c) Siemens AG, 2019
> + *
> + * Authors:
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * (at your option) any later version.
> + */
> +#ifndef IVSHMEM2_H
> +#define IVSHMEM2_H
> +
> +#define IVSHMEM_PROTOCOL_VERSION    2
> +
> +#define IVSHMEM_MSG_INIT            0
> +#define IVSHMEM_MSG_EVENT_FD        1
> +#define IVSHMEM_MSG_PEER_GONE       2
> +
> +typedef struct IvshmemMsgHeader {
> +    uint32_t type;
> +    uint32_t len;
> +} IvshmemMsgHeader;
> +
> +typedef struct IvshmemInitialInfo {
> +    IvshmemMsgHeader header;
> +    uint32_t version;
> +    uint32_t compatible_version;
> +    uint32_t id;
> +    uint32_t max_peers;
> +    uint32_t vectors;
> +    uint32_t protocol;
> +    uint64_t output_section_size;
> +} IvshmemInitialInfo;
> +
> +typedef struct IvshmemEventFd {
> +    IvshmemMsgHeader header;
> +    uint32_t id;
> +    uint32_t vector;
> +} IvshmemEventFd;
> +
> +typedef struct IvshmemPeerGone {
> +    IvshmemMsgHeader header;
> +    uint32_t id;
> +} IvshmemPeerGone;
> +
> +#endif /* IVSHMEM2_H */
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 11f8ab7149..f0c5d5ed2b 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -264,6 +264,8 @@
>  #define PCI_VENDOR_ID_NEC                0x1033
>  #define PCI_DEVICE_ID_NEC_UPD720200      0x0194
>  
> +#define PCI_VENDOR_ID_SIEMENS            0x110a
> +
>  #define PCI_VENDOR_ID_TEWS               0x1498
>  #define PCI_DEVICE_ID_TEWS_TPCI200       0x30C8
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abe599e5-eca6-7473-ce80-ed4093485061%40suse.com.
