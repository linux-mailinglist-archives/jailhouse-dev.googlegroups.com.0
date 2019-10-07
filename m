Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVGN5XWAKGQEV5IIXFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D87CE919
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:24:53 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id y28sf3674214ljn.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:24:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570465493; cv=pass;
        d=google.com; s=arc-20160816;
        b=S/9KzNSY0lGra5FYFi8Pbum4NedGuQDgXWGwK+Ercu9U7V8R+12w/ioRghkQxbw+qM
         hrLX1y9SQU0sx2vzlsCWcPtIjTQyyg8M8YzalVdHBcUl2LbwN2gIvN1QuraNmPGtRxHP
         P5I4NwTl075rknoXRH0dj1FkXGKAPTFHQHOm5IjFySaH+cyY8Uqpjo3bmkKPM9L5xjeX
         B/5Ti1jNLF+HaRWLq1l7wTRW0XYu0qjYrBFRuhC2GC4CJAmDVbxQxhKbcd11TNVNExDp
         fYe8Ewe8mg1o/2aWtY/VmDNjadW/WA3Lh5I/bCJkBe6lRcTPEoMLkjCTyg1R1kHg5God
         B6rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=S3djfUH8LlYh2u99xfteupvx6UpUS8IfC9q/Y5yAO40=;
        b=z3uCXPS9zPCT5QFDuPFEaMBWBHn9pUCjZ6XJMMaInvmKLQ0DYwqPOqSzT9FuR6bY/y
         ohp744trkAAV3MiGIhgA9GGbotcBqcYblHXpLhPX9ZKxFGuOVQhNPY4s8Q9iaWvHo5Lj
         esdYNstMjc9ejiwp5yqVrLIzK7JumLpyP8n4VBXWZo64V2cFMNhmUtcdVD0Zjc5I7Fcg
         Xaq6rRZdP8oljbcNMGarTc2UbtT4iM2CpbHQquhClyk4VkUc9/tHcMoUT2JY1j2Rr9YK
         digywcRIP7+X8DuVEnnMXe1Oc4P8XbCiDLrR4Hc+vHUIi7yKcMKBn/zQd9qxnlUgem+i
         V2DQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S3djfUH8LlYh2u99xfteupvx6UpUS8IfC9q/Y5yAO40=;
        b=PJ6esVGnjwylFfLIMfK+PEmhQJQy0ZdLDNSIuQcFJuZV/zZXFzpJJsrAquINmXMvxx
         si311yX62d5cKI9dmeX6dG8cQj6T+R7hGZKxfohcSViQkkxdZkO43R6+zgkhzjO46/Yu
         yJN+hlGr+XcFhXzq+dCVzi7e1fVeDOG20U25OOH+xkBE9sNsPiJ8xa44vZDClu1KehlT
         3SNjWhVF4Zygpc4LgsLyFJOT1M/vMkbJwmVPVSlQpQfjddxrEI/t9yIs6ikNXuY2/aYt
         f3pc09lyfWBxCjWxYPKgk6W5DcWqnX20f96XL9yCI1IxTpAdr35yftmx+Ke4XcTXIIy/
         A4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S3djfUH8LlYh2u99xfteupvx6UpUS8IfC9q/Y5yAO40=;
        b=ScLmvdDJzrhQtYZtHjaorwtqYdunmRbnaOdSF3LT7l3uccSypze0T+Gv8LyQo1a0ew
         2Bw10gM9AscZpjUQlHIvrdwKi90/f2o9ZibUL4IL6pYG1t24IJom1nCQYMvT1Qza9Eh/
         mlGOs/MuGZXlRhlLp3LpHrF+QzzsPE3iNsclXKtJ0cFjJY0Ma0fRevLgVSs3/XSd6sar
         E5T0mmDND19pNInCiMjAQSbuZxxt78nySVzCsgtSUDV3IGRi1rCDUVVWMYM5jF14zcXT
         llsb9NG0LidNKW0dFzDjyXz0bExpxhkikp1uqiwDfcHJym4BcfhqlfcMWyGFWUa4hapn
         bg6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9wXyteZOizQQKQi6MSwny8an8lalI/IUhccd0gR0X3FK14D4A
	P44P3QBYhzSUjFx8xGxfPbo=
X-Google-Smtp-Source: APXvYqzJIrEvvbAwax+HmuckE339ROZc4FdXwmjycYJoaMXznq7+G8gvsjSOyC1dNOOXniddISLUfg==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr2429128ljc.237.1570465493084;
        Mon, 07 Oct 2019 09:24:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c4c:: with SMTP id i12ls18406lfj.2.gmail; Mon, 07 Oct
 2019 09:24:51 -0700 (PDT)
X-Received: by 2002:ac2:5196:: with SMTP id u22mr1977323lfi.130.1570465491924;
        Mon, 07 Oct 2019 09:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465491; cv=none;
        d=google.com; s=arc-20160816;
        b=SpsDK6Der7RFhWT0kG2vM9SBVnmyAiaMpDRj8zbzMf/jS9MSTMqrozPZe9mmc6Z7r6
         LP+7x4NrNwPl/oyQcfFzOdWO+Mm1lfubx4SRrgCL/46ezLu7JqbYw95b+9geJ6R7NgHZ
         WrTznDFZPIHJ5zIzQgnabg/i02VNWi804xonMmBEQWj6zLzfpbArBvZ8HKyjIBoVxSVe
         9ptX7nOQRhvsy3MKJjq0vtrAnLhDfJafhcQtNEuCu9PylAQUWJ473/ZZRzDvOANojN5M
         FnBxCiTzmrO1Ro0X/G1FfUAyAu4OfjkCBzLTaCZZHGXjyZHqvzG7Xt8kxX63CAM9AqQ4
         NDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=MpHSp1JOn6tvpAvbba7MFGhn/yiuyxZG1PRZOKudSXw=;
        b=RNSCq0btSR5nqIF1ahdqk5uq0YWhl392OS33IGTKVIq2QLU/2Tmph94JWryAU9YD/3
         ydEDcc2xXpOcQjWPBCb1QYbRW8YvKp9hFxFWRwLtQZ0n48M7pMpbQmlJRiQwRcnKfTVS
         cxJ78oB2imx7xbWLwQ127j9MS6zTozk2saao+i+54oq2JX97jZ8umRVJ8XqzbeJWnqPj
         /+ktKpau9jcGL0unVL8I5GcgPcUJZjp0B5E2iuZg9t4EcjlwSurNgWoyAOlrnZow/i4M
         7M8WzKC7zcGJrNHKaEH3cFdIcSJze5VOnQNKlGWjZ0FYwRIFBLnk0dLDIGyJzeNiykFa
         gYfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a9si1042256lfk.5.2019.10.07.09.24.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x97GOph2004328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:24:51 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GOpoM019630;
	Mon, 7 Oct 2019 18:24:51 +0200
Subject: Re: [PATCH v3 10/14] pyjailhouse: sysfs_parser: remove
 parse_iomem_file
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cae93650-ca20-1485-eb22-2fea8ee1b134@siemens.com>
Date: Mon, 7 Oct 2019 18:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193857.2866-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 30.09.19 21:38, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> We don't need it, call IORegionTree parser directly.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 50ca62fc..d2b36876 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -97,8 +97,8 @@ def input_listdir(dir, wildcards):
>  
>  
>  def parse_iomem(pcidevices):
> -    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
> -        IOMemRegionTree.parse_iomem_file())
> +    tree = IORegionTree.parse_io_file('/proc/iomem', MemRegion)
> +    regions, dmar_regions = IOMemRegionTree.parse_iomem_tree(tree)

Style.

>  
>      rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
>      add_rom_region = False
> @@ -902,10 +902,6 @@ class IOMemRegionTree:
>  
>          return [before_kernel, kernel_region, after_kernel]
>  
> -    @staticmethod
> -    def parse_iomem_file():
> -        return IORegionTree.parse_io_file('/proc/iomem', MemRegion)
> -
>      # find specific regions in tree
>      @staticmethod
>      def find_regions_by_name(tree, name):
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cae93650-ca20-1485-eb22-2fea8ee1b134%40siemens.com.
