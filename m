Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIGD5XWAKGQE6KQ2T6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B550CE888
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:02:41 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c90sf9282230edf.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:02:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570464161; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Sb/2Im8LCXMkVgAHUOdCgWO0X2TFD0N9Vm5I+82QBXQB/0V63+RGDU6HDvUXPc3hn
         6+EV9ah2b+eSN/13OPasHlmMMBSgJ3RsoTa+7/JHN2yYuOJwKpHhlvNdDOl0I9O5P5Ie
         dU8Qm4dtjTPNlW6frQBmARcbSoRYiia9tsCCmh3bJ6t/sz80fZIhslG+lcx5IdSt0N0s
         rpAz0GXaiqdmHjeebeD5VRxt8gGA4oE1Z57EzUkvZqtllGDzwA9aNJxsfXFJxGRkQDeO
         TmrRjf9Ci3MYBzCvKhjuxb7CVyZpOftUNmqPkqb+JDjdPfxiGpQYzf9+5lNNcDFz72z9
         uSEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=+xYk0eN0lnPCOwjj731Sj6zwNmw1V/yogQOBDNsZR+E=;
        b=O6TdXuYwWTNDKkDkBxyY3E23/cGBgB9PDD8VGbQhBPyNXoDF5sadNHBmfkOTplNrOJ
         SekSoKl5n79djtK3PnYTUos+IMzt0+SvaQZc/w5qiDG2lUogqIUUx10sPvrJL/cZmzUR
         8BH96H9PHnKRAu1k6SPG8IQe2AzpmitLJsfyWG8YuZpAZJrmtCh3O5N2LgjPtvYmxvi7
         mXx7H6IXABBrDjqD/vx97hdi3udWpjqMKDrm8EcDl8s/GBAVDUM3fR+Tyoya1Fqlxro9
         /32UXoEAUrxJxXQrbtgyti1n+IkfCJhBso0JoizT5lD8rpCPdk6v7862W4lF/9tnpVeH
         Wn+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+xYk0eN0lnPCOwjj731Sj6zwNmw1V/yogQOBDNsZR+E=;
        b=KoRl2p0XBgoiGjo8U6gQX8ObAC1BsqDBvFjdR9s/1o0XjfW5x/sacMGqJ4dsK5HF7w
         2fCNexq6wQOSBn0Ltngdwr8K36xYgfRqiQT3BTLHogPCVt/yFc0db71x4IXe7wl99mRD
         eVC2ReiMrvNcqiyRiDEnrlJn4VajLM/MmBqTTdrLcKBfodyRlrs01/wZzN3nF4bsta8d
         pUZzGH7fqZkoRYNmBuqQuNDzb8hls4OisEJ3OaiWhA0yTziglzIDmjfUk0X0gkR45+kL
         ePFisx7NRTvu6Hybumls8Cwmb9uTtIlQSMkkRYog0DPzOPvjN+NjVgE5vviktRbey0QH
         0TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+xYk0eN0lnPCOwjj731Sj6zwNmw1V/yogQOBDNsZR+E=;
        b=qSH5MoNDJ+s6qvOBJTZoSaDpKW5/+KEHS+iiDJFgPVoHk9GMOTUMts3KsCVro05tj9
         aJ3PD1tzP+SoHh1OTXJKGyDUSbDSFpzHHD/K01gLkQqQWJXQLd4iMi7MUh49+4yCVS4a
         1T9nd3zFtXttu9u0VBq0kPOmkz1z6EBbk5Pm3bMImNd5IZw14eAc6QDWfpAlkTDJ/eYQ
         9f99Um/YjwQvay5a3zJ4YEz5DJX0z8zahK9KIJGv+vLcEVnRhLpLP8TXgpdiPNLPnEwK
         Rfl5ku/OT0y81HzxH0/CUC1hz2/HLSEhKDWZ/crDeVKr01pH5prAg1EgjOnmZ/dzICSr
         tafw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWy1ltbmUJ2XlVcEHISmk9bB9fPwAn9/Bt9QvI2iWiT6RDgx/bZ
	4BVnoi1tn+Is3one/oPplis=
X-Google-Smtp-Source: APXvYqzjXQX9uJkkCGBgpU2RexqFhxjrjuiRP/Zgdc1uAM9AtTJSIpSP+ORE1KKnr1hi4d+lh98tMA==
X-Received: by 2002:a50:f0dd:: with SMTP id a29mr29715425edm.219.1570464161000;
        Mon, 07 Oct 2019 09:02:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3591:: with SMTP id o17ls111755ejb.5.gmail; Mon, 07
 Oct 2019 09:02:40 -0700 (PDT)
X-Received: by 2002:a17:906:8054:: with SMTP id x20mr17527097ejw.65.1570464160341;
        Mon, 07 Oct 2019 09:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570464160; cv=none;
        d=google.com; s=arc-20160816;
        b=f0hlQgjyI7KsX13G7ZP/+mkbZWS39wF+46tbMFmllT+eTtlKaZ0zrUmJ75RF8v/1XO
         mft1TQ/ct/uQYeJLskvXpzZlfMGNrUUM4aWnGe036+rI7VZnDjX0h7jnuuM4i+M0FKKJ
         TRI0ugvhwZyl5egOAkP+HxOQ5HD3nrBmvY5x06yvmuo2zhwwrLiIayl1ZhvtW0Pq3yj5
         sUyxAnIqHwIXsxbFJphj8GiBj8vY13GMbxdchq8z+3mtUVSNzr/lkh43DQ6CmNe4zu4d
         kOYPDXNme9YMhs+yu5P/YMK/vxPmztepOuXYG2db/1D12ByvFD/HPswCUlASki+IvHcy
         Nh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Zb4yVT0RbWq0hMy1lEFv70+PCX72REtG5oFGqhojPYE=;
        b=GzP06hT+UryVyF7TV8hzkgEHKpfbYBH8vJP4nf59t+O1GCVxwalJFcutu4Fz86++f/
         ibRcDr3Qz4ccgWL4IerGGivj0OqOsfPuEfbrWyqy1Z6ILnyKFLHVchFyEDurX68/t6Jt
         XgvNJ52eOHVZKPbop1UImpp4WBTklkQT3CEff63TDMPmN5pmDiJiBhblmSQzxIx0Bm+Q
         VzFkTJhCMgpgHnC+74LElgaD1HnZktbbrasOiFgs0m1NYWv7u7moLPxVssQXnIRhlHCf
         uva0d9mK3EBpv9iVjRxXExbZG36z5KoecSfq7zy5xKbIrygAuGjsdF+Elxy8TIaaaC4C
         C7kA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d14si1144388edb.4.2019.10.07.09.02.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x97G2d1t015841
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:02:40 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97G2dwa003011;
	Mon, 7 Oct 2019 18:02:39 +0200
Subject: Re: [PATCH v3 05/14] pyjailhouse: sysfs_parser: simplify statement
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-6-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a1cf01e3-5e75-57b0-dee6-550814faeaca@siemens.com>
Date: Mon, 7 Oct 2019 18:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-6-andrej.utz@st.oth-regensburg.de>
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

On 30.09.19 21:13, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> No functional change.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 464b6a80..b0a9bf44 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -113,7 +113,7 @@ def parse_iomem(pcidevices):
>          append_r = True
>          # filter the list for MSI-X pages
>          for d in pcidevices:
> -            if d.msix_address >= r.start and d.msix_address <= r.stop:
> +            if r.start <= d.msix_address <= r.stop:
>                  if d.msix_address > r.start:
>                      head_r = MemRegion(r.start, d.msix_address - 1,
>                                         r.typestr, r.comments)
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a1cf01e3-5e75-57b0-dee6-550814faeaca%40siemens.com.
