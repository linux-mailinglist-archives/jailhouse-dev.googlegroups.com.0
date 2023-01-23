Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAOOXKPAMGQE3YDH4UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC76677FA3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Jan 2023 16:25:55 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id y26-20020a0565123f1a00b004b4b8aabd0csf5188427lfa.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Jan 2023 07:25:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674487554; cv=pass;
        d=google.com; s=arc-20160816;
        b=cg4v12oyziJinaQ47jqeR0FoOKyN9k+jutSbcSghAMK6CjxBTLbUD6fhK0yuoUnSci
         6J9xgaNdxJRkMW6fWfOgF47ZP3Ju88IVlz3VgunL9Wy8JbMwsyDSY3WpFxGkAGisJgD1
         NN2MooNsUfCJFKbnBOLKxzYFzs6hky8sxcJpyFnTrLOINftRm1UUPB7caAua221Se5XZ
         t6gWbFDspf92vp8pVAHzPtrkd+w0/FosKCSR5u8EMLUUwxojnVmA6u0hi4uiS2AgZJjQ
         32jXEKx3ucyBFy+TLLa6hU0FncxAbXjZ7dN061o1XH63F6WL+ek2oFuoExwOv0xLhEmF
         gJsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=NK0d1PHCiv75p4qkV+eeKyuVXXRqP5FLX9DU9aVY7v8=;
        b=OPm3xdaq9s9lstfoSI9xZuCpX7QoZu54qU01QQaGMQIZi2PEmyMQ2Qlyh9L/vjoapK
         MSsaYLz41chGu6DCi8DZzXu7wB3TOX7TLhFNagCPYsNS0O3qQatizP6mxyKLdzru0rRK
         ej+mHbGbEAiiplCUXXe6qejC0C7VPXurHCSEIIxIwMSOrf25klTg1jc7/1928J2t2loA
         oDHNBsevS3N1YmIcnK6YTfC5hk2dHS8gsL9GB56wPNK8Zea0LpG52fveH+/Hfwbtx5Zc
         j/x7Z1Sv8hZu7H4hAMIJ63YUC441ga+yctVSrHFbIxeLLGb5SR81XMh3miM3jIkWk4rV
         iIRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eDf+9Vks;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK0d1PHCiv75p4qkV+eeKyuVXXRqP5FLX9DU9aVY7v8=;
        b=lQ/LBRQb/ZP/+mC/8bm8VpT3uKvPUWKv2tR+iXj4JN/+Uv9vfJrZx4c+em9KDN1Q5z
         IXg+xugs5i74Irvi3sfTRPncLYQL/ijdHBAShhy9I73Qg5F8wrGqefue+FKfQA1E586o
         rE7JxYUqgPNgssEdCFd+lceahJdd/cBsdl1UIuchkN7Iv5FURaQRONy+0mTjsgPbqIeZ
         ybH1sgvUg3A3kdO8hHt7ufHF6PdE2ccv9eVc+Dq8lppWbTSI7x+xFGROlG1wcWKVNDI/
         2MaVp19W3juFEFbGN8h7pjq9wAPQhWygYDeJhX698YDoeq/I1A37aAFB0XWLltXxzFi1
         mDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK0d1PHCiv75p4qkV+eeKyuVXXRqP5FLX9DU9aVY7v8=;
        b=mf552bfAEER8fhVTixShWHGu7vbcvd19oMfDivokGMHXAhSRQRPGvKsjjKcRraulE1
         awxrgpLsHEpM5sAcou3+Xza16Xso24//RRQHytdXLJP56W35C7fGdtrhO/nyajy5Jq+i
         MtJeFTAlKyiXKs0iAJixB/c7A82X2N4Fy7URmb3idhq0Jbpxpi3KO9QCla5JqT9/sNxq
         CztbXHdnMQNe8P1+QcX9yWsHg3ZWxAeLzRVTXZ6bChAf7M5aZDWwUl537rYf4AHI54zN
         LRxdaMHWMwSY3HnOj4cqg6dBu1z8VgJJJcTKWoaKu3x3olrT45+vCoDra7b8zQaM70g+
         QnkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqUNcbJOlhF/qJOLm3mCXk3e78PWhueUxYIeLJdAmnsZOo6uIpv
	im22EKYPTT15TBGYnDlFnLk=
X-Google-Smtp-Source: AMrXdXtzoy1XrIDl9yFOCMBiuSRDCRSqoRNSoRHqYgyTtsSLSepevlM7TJkocpcx32RpEbk5yHomDg==
X-Received: by 2002:ac2:4e04:0:b0:4bb:d443:ef42 with SMTP id e4-20020ac24e04000000b004bbd443ef42mr1555766lfr.43.1674487554519;
        Mon, 23 Jan 2023 07:25:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:214f:b0:4c8:8384:83f3 with SMTP id
 s15-20020a056512214f00b004c8838483f3ls4768239lfr.3.-pod-prod-gmail; Mon, 23
 Jan 2023 07:25:52 -0800 (PST)
X-Received: by 2002:a05:6512:23a6:b0:4b1:3960:4cf8 with SMTP id c38-20020a05651223a600b004b139604cf8mr8580550lfv.28.1674487552600;
        Mon, 23 Jan 2023 07:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674487552; cv=none;
        d=google.com; s=arc-20160816;
        b=CHlc8KUn2j24zIiBIq9agJKCyIh7IvCBnio2Y6OXDz7EiTFDOCgoceq944w2ggPbS/
         UsH3uZ+5dSIvvbcdJ5+bKiiwTm9QSs3TXLm4d+ZywL1Re+69OIBOCJB+L5J30iCW3ZUt
         L7Ks5yB+rKcsquHeEytZ1Y8SMPPRMjKA1DmCIzfNqA9kYMlruz8W3xIRBENKGjzF5LNS
         LGrM2fnRFgIZ5QErTWZpTr9NCq5s/QNuyN5JmW0/39tH/sLYiVMDWvnJVlk8yMM6RnTT
         +nSKFlB1yW97/FnWHPmtYAyRFld8zph3rtmU+v2HWdYyj6XRfoB0hePjhr7efQSidEfN
         U4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AbuRZB9P8hKWeygnW6Nva4HwmDkk/j0b3mQMHsvQRV8=;
        b=sN+oE4oTgFihzHiEJ7X+Y65lpTyp6BbzoKq5nwu6BnjoKX5De3VdClS5zkDe/rewjc
         UR83s1pC5oThwlCFQqWUdhBgkDcgl7M7VErtx5mwhBeIYzXTlkecx3rgqWPNIP3jtlhf
         mmNm5GZ2REMGBTLNfOOkSJG8NH2kS7PG7kqUO+oaEFQ9ghfkpZYtC+auWDG/l2U5aNyo
         AOZoOWD3+fO3CkFrTE+uo2/x/Tg6VskmBhmRx65UdagfN7ACXN9+YAvVaxhA+1hAQc3T
         n8IxbtksHgLDgqJRUmyoiJftH4ngcAiZ1ff9ku8scFFHzIJfDtO3jjEU/noBG2Bg26rF
         V79w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eDf+9Vks;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id s5-20020a056512314500b004b59c9b7fbdsi2035783lfi.7.2023.01.23.07.25.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4P0v7g5zMwzxsn;
	Mon, 23 Jan 2023 16:25:51 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 23 Jan
 2023 16:25:51 +0100
Message-ID: <0dbb69b6-8453-4a46-892c-cce40b3249c5@oth-regensburg.de>
Date: Mon, 23 Jan 2023 16:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 03/14] scripts: Add config checker script
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
 <051aa4a9d5e96ba29bf407e6bd43046764a7acfb.1674415741.git.jan.kiszka@siemens.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <051aa4a9d5e96ba29bf407e6bd43046764a7acfb.1674415741.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eDf+9Vks;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 22/01/2023 20:28, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Allows to check most root-cell configs along with typically loaded
> non-root cells. Except for dual-core targets and x86, each
> config/<arch>/<root>.cell is tested along <root>-inmate-demo.cell and
> <root>-linux-demo.cell.
> 
> Note that the configs have to be compiled for all architectures before
> calling the script.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>   scripts/check-configs | 90 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>   create mode 100755 scripts/check-configs
> 
> diff --git a/scripts/check-configs b/scripts/check-configs
> new file mode 100755
> index 00000000..7017cc74
> --- /dev/null
> +++ b/scripts/check-configs
> @@ -0,0 +1,90 @@
> +#!/bin/sh
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2023
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +topdir=$(readlink -f $(dirname $0)/..)
> +
> +JAILHOUSE_CONFIG_CHECK=${topdir}/tools/jailhouse-config-check
> +
> +ONLY_TWO_CELLS=" \
> +	bananapi.cell \
> +	emtrion-rzg1e.cell \
> +	emtrion-rzg1m.cell \
> +	espressobin.cell \
> +	imx8dxl.cell \
> +	jetson-tx2.cell \
> +	k3-j7200-evm.cell \
> +	k3-j721e-evm.cell \
> +	ls1028a-rdb.cell \
> +	"
> +
> +only_two_cells()
> +{
> +	for match in $ONLY_TWO_CELLS; do
> +		if [ "$1" == "${match}" ]; then
> +			return 0
> +		fi
> +	done
> +	return 1
> +}
> +
> +run_check()
> +{
> +	[ -f ${topdir}/configs/${arch}/$2 ] || return
> +	if [ -n "$3" ]; then
> +		echo -n "Checking $1 $2 $3... "
> +		output=$(${JAILHOUSE_CONFIG_CHECK} \
> +			${topdir}/configs/${arch}/$1 \
> +			${topdir}/configs/${arch}/$2 \
> +			${topdir}/configs/${arch}/$3)
> +	else
> +		echo -n "Checking $1 $2... "
> +		output=$(${JAILHOUSE_CONFIG_CHECK} \
> +			${topdir}/configs/${arch}/$1 \
> +			${topdir}/configs/${arch}/$2)
> +	fi
> +	if [ $? -eq 0 ]; then
> +		echo "ok"
> +	else
> +		echo "FAILED"
> +		if [ -z "${quiet}" ]; then
> +			echo "-->>>---"
> +			echo "$output"
> +			echo "--<<<---"
> +			echo
> +		fi
> +	fi
> +}
> +
> +[ "$1" == "-q" ] && quiet=1
> +
> +# x86 is special
> +arch=x86
> +echo "--- x86 ---"
> +run_check qemu-x86.cell apic-demo.cell tiny-demo.cell
> +run_check qemu-x86.cell ivshmem-demo.cell linux-x86-demo.cell

Hmm, I would rather do it this way: If called with no arguments, check 
all architectures, but allow to specify '-a arch'. In a typical 
development scenario, you're only working on one single architecture, 
and you don't want to compile all cells of all architectures.

> +
> +for arch in arm arm64; do
> +	echo "--- ${arch} ---"
> +	for root_cell in $(cd ${topdir}/configs/${arch}; grep -l JHSYS *.cell); do
> +		if only_two_cells ${root_cell}; then
> +			run_check ${root_cell} \
> +				${root_cell/.cell/-inmate-demo.cell}

If an architecture is not compiled, the script fails with misleading 
'grep' errors.

   Ralf

> +			run_check ${root_cell} \
> +				${root_cell/.cell/-linux-demo.cell}
> +		else
> +			run_check ${root_cell} \
> +				${root_cell/.cell/-inmate-demo.cell} \
> +				${root_cell/.cell/-linux-demo.cell}
> +		fi
> +	done
> +done

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0dbb69b6-8453-4a46-892c-cce40b3249c5%40oth-regensburg.de.
