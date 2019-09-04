Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBGMBX3VQKGQEJVJQI4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1ADA7F09
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 11:15:05 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id b15sf11681729wrp.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 02:15:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567588505; cv=pass;
        d=google.com; s=arc-20160816;
        b=n20WcDfzRDdwNtHjaSjAeh7OiuuGydpyDGqxbmwEszc9QttUtQHrrvnH96w0I3ChSh
         OsaRfVUSePA7xkPEvFkx6dMns3FCztMJ3JFog3LG5CyZQnHMnMoLAQuHA4Tza7czVQwk
         vkY2jTqD0gJ9/aRnjuSNXgGKKLw0WbvR66nN6vUnOW9qONpO3uR++ab9+WWhTUwvSphn
         BVdP9EI8cdf9vxGVjZQtEHr/SuksTSI6qE+grlV6lCpfsEhndBBamp4sHTcI10r6Ezz+
         OYydyoK467TQTzcLdfjdqWQDzpULPSulCQ8DxUGuO4yx3ejLIGRRopWMmsJMyvPTPEFt
         j9RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=a5fOfYYBAXvVrOcvXgTKhNwN0jom4VTUFfNLJth5TpA=;
        b=ajd0ugffrFh6M5KTcQFTA2NdO180rhugQmB6Gva94qKlFBO+UJBLFazo6zRJmXBctG
         10MOUD1gn+sSzKJJLwWVkJ9yu/epdXlAxQq8akNafBUkz4fmUT8QvGaJ1ZU6RUl57xHJ
         bJrX96byIc957OEiBn5caZdPVTSERuQ1TctTZb0HKe35XIem5ZTiKt/lbsP1MQBlYNX2
         wkvNqA+OZDiYE6eF1E0iyZBLmzDIMIFxyk68Zqy+Pnv5EaE/ySj3uV6KW+Obd1Lxl6oX
         kQXycno+WXROMjUn+IxV/zga6c6785LDNwKH4Qxgcsa16rZ8QF7HW6wTal3e8WKd05FM
         HI4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a5fOfYYBAXvVrOcvXgTKhNwN0jom4VTUFfNLJth5TpA=;
        b=UpdqCjAcqfhNdZNEREPEFkKXFlrPBAO0WiB/qcL8YyBxSqkOibrhH1hoW9Rfsmb9dh
         27rLOnbLk151Pgyk1DfvX6fOvOgoeFR7ZZS6cATCanQ1F0ylDXdx8w4mbgZjToqiwjwn
         97xXiYEo+HiuIrv/qZdSifQ3EWrfHYJX2k5WNdJdM4aVG/K8rxyH3M8faTFiMCrmRk/H
         fCYXGDbc7qFmjVl2gLrhQSYI9vvF3EIOvRbmEzAmwj+M/pVs7pLd5evv9C+KapDRLWOy
         yue8uyTeU6YGboLJVMcrmHv0QBt+csxIE2/I+F0g9jsWoUljAAXAa0dUleagg+X7ENwb
         L38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a5fOfYYBAXvVrOcvXgTKhNwN0jom4VTUFfNLJth5TpA=;
        b=PFblaCbKr3qnfwwYunCz+KGW2JmwUQGsPLAHtz5KNxHkLM2YCMhQmkuTLbK6yaLw6b
         86dkFZPboHkP88dSghNuWkd6S5UtqEmn2F9jBMJzsPdacN3tnaO0tzFiHJqhjdHbKuo+
         ps2L5eEAlVhemOPcU0cRPJc5sKELt+Tvg6HeM4EbttuD7R4GkvN+36BaGcxE3DllAkoI
         JSWuWEpMdlaXUgQLM7P8w84i44ki7ItELUYfFi8pyyoazwCQ5Muv5A3bORDDKeQPvEP7
         1CXLdW8ZFP+bPtbyHjT55UZJrbrS/5ay2qT4ZSjQjPNA8mu93qqr5UjRiAgrlzOP9718
         SXoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWa+BZyUTFlhJXQ+J5nKvOQqQN+zYlQl8QNPfYpQBL3AVKY4D5W
	7O8UWBlBNy1GSKBLDehhM7U=
X-Google-Smtp-Source: APXvYqyiE81COSQ0nt0Kj8YE1sVdZR6d7QCkaPjerlVELqlThIwiOmVa+u04FU/Tbe5CHr0tse7XdA==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr1670656wrl.81.1567588505660;
        Wed, 04 Sep 2019 02:15:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c44a:: with SMTP id l10ls890186wmi.0.gmail; Wed, 04 Sep
 2019 02:15:04 -0700 (PDT)
X-Received: by 2002:a1c:7009:: with SMTP id l9mr3389895wmc.159.1567588504835;
        Wed, 04 Sep 2019 02:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567588504; cv=none;
        d=google.com; s=arc-20160816;
        b=iiD9uCJ1H2vT+ba7Mdvntd32As6+iYZ1xZPbjuLmn9D7GQ9UqR0oi15TTgIADUTGJG
         m7mwDE8wrY/BMAZI7rZiCmj4R0q6a7WI4Ptg5OSjhGYe4LrCjOh9ezfhx3Mbh9WiFWMA
         CKujp6cGzDH0QRmNVI4L4u5x5q6nKuGAIYu/EqmL2nSyXOwHRGNBgw55kQzuCMj5ht+W
         Kc9Jiu6CxJ5A3ENIZPpxZ0+Rf0XZU1s13bjknY9CVv2UbtN2OSr60dhkK3RiPRpUmdvr
         F6cdoCJwkaGImVpFDwk8lrx0RcpqVrbxHAl6S1cBHhNEhG5veNEayTEdCEcCghkFjhrW
         DcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=3GQwFpAziFHYFznCgw+u24tDCpxG0iv5zS7k0MD2Mg8=;
        b=KgIH87XgtMEBjUldRkmHte5Uz/S0npLP5isODFr5Z/BmqjPLKPWDnyY/3/zZi6TmQo
         CD+qB/do0UxNStTGu2TWcqQjKlZdtpMa75nFQvRbFdCQeTZyy6LTnNe9fbNjKxONnWDB
         zn1u19eRsT+ct9XuJnwuW7NjyEqKEyDV/uhFe5qzO4ZTj2Pk4kZ152YmPOxeB7UM4D95
         8IEpJjuWTdkt8nrKgjY55buESMzbcOcdGeaPeNLbGy0xXFz0XsOY6UcvNusEIkagTEhY
         bk2OxAji4ALvh5Mm6kfczBy8X3TBGdqBGAPnbrG1IgOJ4ljIjaC92V7HcBY6xgL9BoUu
         UhSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a198si103633wma.4.2019.09.04.02.15.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 02:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x849F4mM020219
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 11:15:04 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x849F3Y7008287;
	Wed, 4 Sep 2019 11:15:03 +0200
Date: Wed, 4 Sep 2019 11:15:02 +0200
From: Henning Schild <henning.schild@siemens.com>
To: "[ext] Jan Kiszka" <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [jh-images][PATCH 02/13] build-images: Use latest kas-docker
 internally
Message-ID: <20190904111502.2fcbe1c3@md1za8fc.ad001.siemens.net>
In-Reply-To: <458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
	<458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Am Tue, 3 Sep 2019 07:59:14 +0200
schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:

> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> By now, more mature starting of the kas-isar container is achieved by
> using upstream kas-docker. E.g., build-images.sh still forwards SHELL
> unconditionally, breaking on hosts with shells the container does not
> support.
> 
> Therefore, pull kas-docker on demand and use it. Expert users can
> define an own source by setting KAS_DOCKER.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  .gitignore      |  1 +
>  build-images.sh | 33 ++++++++++++++++-----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index fe0ae1a..43892c0 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,3 +1,4 @@
>  build/
>  isar/
>  recipes-core/customizations/local.inc
> +kas-docker
> diff --git a/build-images.sh b/build-images.sh
> index 50ed677..28c3a50 100755
> --- a/build-images.sh
> +++ b/build-images.sh
> @@ -2,7 +2,7 @@
>  #
>  # Jailhouse, a Linux-based partitioning hypervisor
>  #
> -# Copyright (c) Siemens AG, 2018
> +# Copyright (c) Siemens AG, 2018-2019
>  #
>  # Authors:
>  #  Jan Kiszka <jan.kiszka@siemens.com>
> @@ -21,24 +21,25 @@ usage()
>  	exit 1
>  }
>  
> -KAS_FILES="/jailhouse-images/kas.yml"
> +JAILHOUSE_IMAGES=$(dirname $0)
> +KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
>  CMD="build"
>  
>  while [ $# -gt 0 ]; do
>  	case "$1" in
>  	--latest)
> -
> KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-latest.yml"
> +
> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml" shift 1
>  		;;
>  	--rt)
> -		KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-rt.yml"
> +
> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml" shift 1
>  		;;
>  	--all)
>  		KAS_TARGET=
>  		while read MACHINE DESCRIPTION; do
>  			KAS_TARGET="${KAS_TARGET}
> multiconfig:${MACHINE}-jailhouse-demo:demo-image"
> -		done < images.list
> +		done < ${JAILHOUSE_IMAGES}/images.list
>  		shift 1
>  		;;
>  	--shell)
> @@ -60,7 +61,7 @@ if [ -z "${KAS_TARGET}" ]; then
>  		MACHINES="${MACHINES} ${MACHINE}"
>  		NUM_MACHINES=$((NUM_MACHINES + 1))
>  		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
> -	done < images.list
> +	done < ${JAILHOUSE_IMAGES}/images.list
>  	echo " 0: all (may take hours...)"
>  	echo ""
>  
> @@ -93,17 +94,15 @@ if [ -z "${KAS_TARGET}" ]; then
>  		fi
>  	done
>  fi
> +export KAS_TARGET
>  
> -if [ -t 1 ]; then
> -	INTERACTIVE="-t -i"
> +if [ -z ${KAS_DOCKER} ]; then

In addition a "command -v" or "which" to see if it is installed
globally would be useful.

Henning

> +	KAS_DOCKER=./kas-docker
> +	if [ ! -e ${KAS_DOCKER} ]; then
> +		wget -q --show-progress -O ${KAS_DOCKER} \
> +
> https://raw.githubusercontent.com/siemens/kas/master/kas-docker
> +		chmod a+x ${KAS_DOCKER}
> +	fi
>  fi
>  
> -docker run -v $(pwd):/jailhouse-images:ro -v $(pwd):/work:rw
> --workdir=/work \
> -	   -e USER_ID=$(id -u) -e SHELL=${SHELL} \
> -	   -e KAS_TARGET="${KAS_TARGET}" -e KAS_TASK="${KAS_TASK}" \
> -	   --rm ${INTERACTIVE} \
> -	   --cap-add=SYS_ADMIN --cap-add=MKNOD --privileged \
> -	   -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
> -	   -e ftp_proxy=$ftp_proxy -e no_proxy=$no_proxy \
> -	   -e NO_PROXY=$NO_PROXY \
> -	   kasproject/kas-isar ${CMD} ${KAS_FILES}
> +${KAS_DOCKER} --isar ${CMD} ${KAS_FILES}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190904111502.2fcbe1c3%40md1za8fc.ad001.siemens.net.
