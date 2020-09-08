Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG5Z335AKGQES3AOXNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9126131D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 17:00:46 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id s24sf3580143wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 08:00:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599577246; cv=pass;
        d=google.com; s=arc-20160816;
        b=OknuE8oG7Leambk/xPXWy6bAg4lIJWy3QvpVz3eZXNFLUHhERc2Tueh13vpKofNY5s
         CI283F1DDRmkxbLHbioYzVgBmJJ7YweRXzXfbTB+EPwHuz9B5HSiWbwQxExJOVp0oow9
         w5JXorw7mJXrDQ09B40Kn4CmmPWC3fiLMBiGD2Wmom4ynuBm1bDiHwOSrC8AbjwKVv0o
         LGtT7k5AYncbKAXlVURsIDDFcxfC2W8ikum2MxPAoOH1Oy37QGIcepyloED2TqfieFbD
         +4wF/xBOUEpBsdCg+m4MyJqEc6e9gqKHSmHcnCyz/IdvoFuKldyQVFCKATOtJQ7r3cRd
         /Gag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QIIwbCru5rZG9HfAkoSpxs65xJziZIPKMzaMe7qMM1c=;
        b=TpqBHV79JJko/RyrTeDsT6OhwMKb2gAf0QWMOe4G2NHhll40dr1q2OzF6bAGbxdqkb
         p9OflBbw7ec3OgrAX9ojdfC++yHp4ULha3ON7JzdqwhOH6pOCtyY3+y1mo1xrKxTe8zu
         5qLyZn4n5oybRZjynFW9YG5UFG0li1NrfcYpMz2OElRbad0KHv5YVShk3/04EyTIBdKm
         B80b4y5X5vPI6fJjAEzM6NjJIdSLhan9L2ofArTvL8t59gSPUTZtb0XY++oHyx3OtWKF
         kHQJcPDfdKqOul0FQ6Mzwf02FQ/PrxiQBU5rvDLJ8ciUUNYlQcr5ktaMoKGwKFLaFWzS
         60YA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QIIwbCru5rZG9HfAkoSpxs65xJziZIPKMzaMe7qMM1c=;
        b=DSsmBa3D0cLTUua+tpo9UPHVckn/k2tVCHvm0x4+a2FLceYLkr3OCtmhZNgbRkcw0f
         +C8BCt2P5CBLpPrW7+TbzpZVYvT/ZHSqJG9XsqeH66KMFISPZwz4KJkVx6+Ofe/a6BaC
         6nBJJs44VyU3AmZ1XvHLHyR2Bs+A9ov4qsPhV3gLaN5PCDyXpxrYApVihOg4bPulNlEm
         kx/+abJJGn2mYuXtRPnUj5z/MC8tbLqSvfUHLRwffQ46b7Aoba/CgnKpjXW9FEYEidbu
         JRIbhVb0R/lgnAmNa5ZWpeL5QWanvJuPsvfqaRz18gk5NpZz4otaEjwCj0nlIv1GinYu
         ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QIIwbCru5rZG9HfAkoSpxs65xJziZIPKMzaMe7qMM1c=;
        b=KzuooKLnub4uUXy86MPe+BLSH+sykPnAGdS1mH9tZRC/wXd69OIDJpf8CjMB9ltXNi
         XWAmfb/m7LxJK2kqMbVP43tz3O6y3fw29qcxAxeWtLZlNZrdtddEV+BgpmIfPwbonEWO
         uSbSm8CZyF5P+iPWJW/0IJssb/o8Yy0Xd5McN4/71XUn6NRHGcWW0If0HueKtKeCe7y6
         8DikwmlUUGgUoa/p+7ta8hrckvsZ6Spx+91n0VTMUYps6Eivynhc/2ad9ZKSI690iqel
         bUi/J7V38wKr2vUlI+e38iYqwqBwChNdoqcgHmdXj70LcFD+pKKU+GNq/juMBJ3V96Xm
         5arQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532D8UUWI0FBTAnn9rxMrfLGBgH37JnLPrpVzzpF4MrcTwIA5oto
	fNkMhNQiEccRdpxIPgTG7sc=
X-Google-Smtp-Source: ABdhPJztZytdqpvHeRsO6Yjt66Q2op/HAbOHDC4YSz5jIcf5cPFRrnfj8izP8LqIPl0UTPA35bvt0g==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr58179wrn.394.1599577244215;
        Tue, 08 Sep 2020 08:00:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c2c1:: with SMTP id s184ls1552889wmf.2.canary-gmail;
 Tue, 08 Sep 2020 08:00:43 -0700 (PDT)
X-Received: by 2002:a5d:6283:: with SMTP id k3mr32281wru.191.1599577243325;
        Tue, 08 Sep 2020 08:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599577243; cv=none;
        d=google.com; s=arc-20160816;
        b=Shzh+XXZQ7zlEmT4eNRmzdwEf6UG1QpU1sT3ZMEpnRhKFi9B1EqKel1y7MHXu2hCV9
         A3RGD4Yy4+4fZmCNBATVH9V9eL18hPKP2WpxOz6I5lZs1EdABmjmZOkctaieoQErt6v1
         m1Vp9YluZYFkjFihbglPfewmguSs4CSk+qCV6RKbDIckbreFn3q8dmw/LuuHxK6TQsCf
         fHTjS5VmtiCWfT96E93V/drnWMffEFqRIl8htsUwZf/TcO14S18k18eld2k4o1ILm8M0
         zZ+mcSKSqeIstZnGasTtzZEFMFF5jz7+DFTPniLxb3Ej31ow6o1oc8zcjVuAyN9xMWOk
         vTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=y+F3uuEAqbVkmdsw28UBgzLCSXR40WnK4+0HYU29+2Y=;
        b=GM+/11Tbp5pluZbQUuSYoGnfuQrATiYZRfiQm/ZcflHw+0LX/CLfHoDLpv1GNmm01p
         J8wq78JZBBs8pP7mOdG39uIZW9vdi5L6L1LIse9N+5rJ/WyENNj1G3GpcPdP3hg0f3gF
         OL1Qo7xWC/Gq7wnryM91O9Hsv4e3qPK4DmdHqDaZbtYtr9obHCK5OFU7f+/X7v5towPd
         Sx20GkDVOk3Nddgm23yuBisMvZf88pFYfFgr+Xiugphx8FO5m8vmSgAlk+KIc/iovMAM
         B9GR+VvvkJAGZgaZvaavBeeKrcnck0os9kpfzbTfyXgVppkiD/eKoeI4ugNuAv3hMHLf
         qH5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id g5si1096093wmi.3.2020.09.08.08.00.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 08:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 088F0gqC003031
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 17:00:42 +0200
Received: from [167.87.163.123] ([167.87.163.123])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 088F0e6k019413;
	Tue, 8 Sep 2020 17:00:41 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
 <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
Date: Tue, 8 Sep 2020 17:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 08.09.20 16:21, Jan-Marc Stranz wrote:
> Now I'm using "linux-yocto" for the kernel with
> "linux-yocto_5.4%.bbappend" and all patches and the configuration
> fragment "jailhouse.cfg" from "meta-agl-devel".
> This builds Linux Kernel 5.4.61 with Yocto/poky "dunfell".
> 
> After building the kernel and exploring the resulting kernel konfig
> ".config" I can see, that only "CONFIG_IOMMU_SUPPORT" is set;
> "CONFIG_INTEL_IOMMU" is not set!
> All other configuration options from the configuration fragment
> "jailhouse.cfg" are set except "CONFIG_PCI_HOST_GENERIC".
> 
> Should this configuration work for "jailhouse"?
> 

It should get you to a booting setup for Jailhouse, not optimally
configured.

BUT: you will still need the Intel IOMMU parameters that "jailhouse
config create" normally extracts while the IOMMU is in full use by
Linux. Also the association of PCI devices and the IOAPIC to the DMAR
unit (typically, there are two units). Figuring all that out manually
will be tedious. That's why you should enable IOMMU support or use a
standard kernel while doing the config creation.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4fbc4f7c-de79-8bbb-357e-f5a056698f56%40siemens.com.
