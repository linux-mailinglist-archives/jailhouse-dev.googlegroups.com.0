Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLOEX3VQKGQEYP3THKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BEA812D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 13:38:22 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id a2sf11811505wrs.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 04:38:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567597102; cv=pass;
        d=google.com; s=arc-20160816;
        b=DBGrqikRdxZEeQp9ikKan3fPqHmxEKPbdUSRDapBKX/EMIAm26wbWQk3ByEeFh1NYj
         tak2CnLcIEf9wFHYv/gO+OJhRU6N1pw0tRtYACAvqD9wtqMgQp80Ktjy8+85lEgKDEvY
         ZmFbOcVHsqDhbI8/FlDnbTOfbUqBbleOPk0wsHJ/jIkSSRZcWrqX4e1TioBG0jzBRXDu
         tIj7Uupe2a1alzg0+9z+hffzSv8TdgPJNPXHwJIPemwshWvhT/LhiQLhr/dobdyIIHeB
         P/nflIh9igyTneUul80ur1GX+QhIr0v9mxyjnOxg9vLU6tZF0rYNBXapxzqhnSaABOl2
         NlUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=knHvuf4MCns/rpZ809/kZ1bQintExaWeDJMcmxST1TI=;
        b=GmYRvyw4eSibteaaGHR0yN2zeCmeYmhuP44kuHLMPcNxQHlD0pjrdH9SVlZW9d1fly
         yaD11LXtGBhDgbuBhKn4t0Dvnu9JZmGl/37zAHFcl6RQJDnWSpYdBPEsdMOMTWx9ht7D
         b75XTrog281QH5JT3eZK0uTdqj0N2pcidWfoVJEbdl22esr75t+MTY7a7I1zDI3LOy6z
         f2sD6YJuEu77ZPJQEefW9Jvri8wbWHM/ZYi1qcatG3RAi83sHc/ErzoEaJTDMAx9JnqW
         a4wZit5Di0A3dM4AreuUmJM47FukF+KCyFCDin7Kqd89o0ILfDxEfmWgIMc1oicJjz9M
         XwxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=knHvuf4MCns/rpZ809/kZ1bQintExaWeDJMcmxST1TI=;
        b=WTgJlLx4I/kFnk2AtTAJ00X85OsSiFMqTx3Y4RKJOuWn9YZz52E8TDnKR2TmuH9cTh
         s16zeDkC+DgtUMe7RORaFWsTNQoLRN7y9aLKPfwdpEQnMYBc3ut/aqPUeiq25/hHTmbD
         o1FnfX65+C3q7Sef3eMMnrsjd+eeqEbKDnaYv/3TOODKndCKNduVBLsDRlhpfrd/kLaR
         7zqTcR/kf/dscZeYhCjW9RiZ5GK1S4ZqCHmFg2Zw7vq7hCQ82rP+318eHIxFZcowqpvO
         NRBLOVBEkKrOgdSR9CszEmv/i5+b7tT7eWsliOeLdTUY+OHfw1NeWMKA+ZnA7PSv2bYU
         VsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=knHvuf4MCns/rpZ809/kZ1bQintExaWeDJMcmxST1TI=;
        b=oRIE7smWtGcXpk30BofDz9a2RppNJTyZmsXmDMtAO/UPiHLwBlKa4AIOxgbGRVlOgZ
         1IyjFnZRr46eu9n9UKWhE55b/8a9xEAG47txCYwLTMRygAnnKbThSjK9Wn000xpxgx2Z
         o1ZPnw38bwHXYeMMVazFmHM0c9+gngI74QGsqc8SDERFC8gxDGSeopQoGzZFWxLW/Qkt
         98/s0GmHnCfmQVmw3+n5f3Sxb8900ZwBSy8U4p1kN2LV6URolQ0JYl9eDbFPt4oUWBTK
         R7LYc3gG5N3+YiJpSLp3MGJ92snsq5AEHgyfhoVGNffjI0GHs4RZFHnUnv9fntZ2KFoO
         gM9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUozH1uT8aSfSm+h5OAnmRvsXRSxTnx8QGDXVciBTF2Ykyc8xBw
	CzdrOCUUofwvklorbrzQKiI=
X-Google-Smtp-Source: APXvYqyx6zzNl+lWL8uXCp0qmjkhaWG+EqS+OpFyNBwWLvGhPAx0F0pvGgqEQ5fwS6/rFG3A0OBchA==
X-Received: by 2002:a05:600c:285:: with SMTP id 5mr4304721wmk.161.1567597101974;
        Wed, 04 Sep 2019 04:38:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5302:: with SMTP id e2ls2799373wrv.0.gmail; Wed, 04 Sep
 2019 04:38:21 -0700 (PDT)
X-Received: by 2002:a5d:4f08:: with SMTP id c8mr21886919wru.51.1567597101041;
        Wed, 04 Sep 2019 04:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567597101; cv=none;
        d=google.com; s=arc-20160816;
        b=qPDKs7jKqwxS78tlYZSBYBtjpVCdBFGNenj12P2vcNME3nv0HecZ6yZgvSpiTgasPY
         qGmEjjrklGv89X1V4IaBIeRvEB3RJh39p3AlihaCxUdNk1UULc5fwwBQqlPApI7YZwKP
         1MTMzdWar8KPmjbLCjV2H+O2qBZBf9BdqjKf2M/8dfhGQbZMobq4KAeQihKLzILt34jD
         dZ7Mg+u+1hdepYmKVRGxEVcHVjPyTc/hNK+464iXTLimtcqBHrspLtHCP4oKZKtNg576
         3aWYu5qAwFIAYqd0ciGT9Bj7OAt2PSE+YX9O2sRAmIO3OiNU0f/0juuqm4rxfF/FuTZs
         hJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=LR23RwAeY61e2vTKAnDzf7JqrcPPm9ZHzFAufLVJcHg=;
        b=Q/O4nZUC/91JlaRIDepTWgxW9gDGTOCwwpKSvjlQjJ0lLqWlaDgeRc1NSYjI8BZitC
         Jn+LD+EcQqn2SQf8EFkdvu/3r0MRFzUAR7mHwuXalTJ0GaFTHK8okjxK+7niJJgNu9Oa
         sBqMKcDhiHBLWFznuyANfAlRMXM4NSqMZj1nGjCavMmlMb8+oaYZcV/cKvuQTz0h/0YP
         T1wmN5DzARTKkbL1sy7Ep+NwM+n8okUzPPRvcD6jrFJj9se7u3zFcV0j29QwcN523qki
         umniOgJjV1Cc0CDZhTqEpPi1lAVpRwfUbOhcV3OBqLk0kA6rmJvI8780IS9XbvFgK39p
         oN6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l9si135203wmc.0.2019.09.04.04.38.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 04:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x84BcKPU008161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 13:38:20 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x84BcKjm010319;
	Wed, 4 Sep 2019 13:38:20 +0200
Subject: Re: [jh-images][PATCH 02/13] build-images: Use latest kas-docker
 internally
To: Henning Schild <henning.schild@siemens.com>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1567490365.git.jan.kiszka@siemens.com>
 <458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka@siemens.com>
 <20190904111502.2fcbe1c3@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d88a6bfa-2fd4-9358-d291-06252c69ec85@siemens.com>
Date: Wed, 4 Sep 2019 13:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904111502.2fcbe1c3@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 04.09.19 11:15, Henning Schild wrote:
> Am Tue, 3 Sep 2019 07:59:14 +0200
> schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> 
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> By now, more mature starting of the kas-isar container is achieved by
>> using upstream kas-docker. E.g., build-images.sh still forwards SHELL
>> unconditionally, breaking on hosts with shells the container does not
>> support.
>>
>> Therefore, pull kas-docker on demand and use it. Expert users can
>> define an own source by setting KAS_DOCKER.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   .gitignore      |  1 +
>>   build-images.sh | 33 ++++++++++++++++-----------------
>>   2 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index fe0ae1a..43892c0 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -1,3 +1,4 @@
>>   build/
>>   isar/
>>   recipes-core/customizations/local.inc
>> +kas-docker
>> diff --git a/build-images.sh b/build-images.sh
>> index 50ed677..28c3a50 100755
>> --- a/build-images.sh
>> +++ b/build-images.sh
>> @@ -2,7 +2,7 @@
>>   #
>>   # Jailhouse, a Linux-based partitioning hypervisor
>>   #
>> -# Copyright (c) Siemens AG, 2018
>> +# Copyright (c) Siemens AG, 2018-2019
>>   #
>>   # Authors:
>>   #  Jan Kiszka <jan.kiszka@siemens.com>
>> @@ -21,24 +21,25 @@ usage()
>>   	exit 1
>>   }
>>   
>> -KAS_FILES="/jailhouse-images/kas.yml"
>> +JAILHOUSE_IMAGES=$(dirname $0)
>> +KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
>>   CMD="build"
>>   
>>   while [ $# -gt 0 ]; do
>>   	case "$1" in
>>   	--latest)
>> -
>> KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-latest.yml"
>> +
>> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml" shift 1
>>   		;;
>>   	--rt)
>> -		KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-rt.yml"
>> +
>> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml" shift 1
>>   		;;
>>   	--all)
>>   		KAS_TARGET=
>>   		while read MACHINE DESCRIPTION; do
>>   			KAS_TARGET="${KAS_TARGET}
>> multiconfig:${MACHINE}-jailhouse-demo:demo-image"
>> -		done < images.list
>> +		done < ${JAILHOUSE_IMAGES}/images.list
>>   		shift 1
>>   		;;
>>   	--shell)
>> @@ -60,7 +61,7 @@ if [ -z "${KAS_TARGET}" ]; then
>>   		MACHINES="${MACHINES} ${MACHINE}"
>>   		NUM_MACHINES=$((NUM_MACHINES + 1))
>>   		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
>> -	done < images.list
>> +	done < ${JAILHOUSE_IMAGES}/images.list
>>   	echo " 0: all (may take hours...)"
>>   	echo ""
>>   
>> @@ -93,17 +94,15 @@ if [ -z "${KAS_TARGET}" ]; then
>>   		fi
>>   	done
>>   fi
>> +export KAS_TARGET
>>   
>> -if [ -t 1 ]; then
>> -	INTERACTIVE="-t -i"
>> +if [ -z ${KAS_DOCKER} ]; then
> 
> In addition a "command -v" or "which" to see if it is installed
> globally would be useful.

I thought about using an installed version where available but dropped the idea 
as "too special for this interface". The point is that, as an expert, you can 
now call kas-docker on jailhouse-images directly while build-images.sh is the 
simple interface for people not familiar with the internals.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d88a6bfa-2fd4-9358-d291-06252c69ec85%40siemens.com.
