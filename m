Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB65YT7XAKGQEGNNGUVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DCF683E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 10:46:35 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id v22sf577732ljk.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 01:46:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573379195; cv=pass;
        d=google.com; s=arc-20160816;
        b=pRdNLoP1vfh7IFQZ/nlYjgMMgihY/dZwKm7GDO7rj8j3yRcDpu79gbUHCG8C6aIbXE
         RIlLaPE5rSoy50DNa/X+7sA2y7M7ZMXxKjSmJYsstGM0is3F3lz3Ekkd0OEsSaqyKesP
         QqlMijLE6O+FQ42MT1cWThS79peu8DQeAxB/Y2goHMJEy07IUsy6nUnIEi6L+XptWW15
         aIsSq9JB6wK4fe+uYXjpd9wLY+T/pWu7jvukotYs9z/o5f8jDagnu40zcggUUuvf1oLO
         96EUQALRWUwrsIXEZuSKn4xaiSf5YrREOItIfBIjC7i2rQAY07B76vXTw/sF/p7oO0x0
         NpIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Mg0YGk+DNeLZeVw7SI2bYven1z5In8H5frSkCKMrocI=;
        b=mFLCPxQbyH4WXfdyWPYeCecWif5/Ew501R8B4i3umMhgDXQnBmdE/NHKGRsAsOSOVo
         5VyQgOqNhO315eOSWJBGtNOisQrzW7asEI6SoQiaYWdaFZ7tfp4Wz0LYgN9sNa7wIaoU
         MzNSIUGWjYc3XsjkBvi7TJ+o9BHJwbNichSWChO3Js1nFpuleCePQ6oWcaonxlNvM5rs
         TZW89pK2/8wCl3sQDqRjZ9HMKHSQcETS/6l8VUvF8YDmDhaquTNKskUyPL/4rhBtASpf
         OUbvhQPlAx0OZRoIJR2PbrRY7aM6di2tKuVDhtZcn3fvKbd9LC4Ynuy+EOsrASBTV4dZ
         LB4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bwPb7rCt;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mg0YGk+DNeLZeVw7SI2bYven1z5In8H5frSkCKMrocI=;
        b=jLSNmHzKopWWVRKVFy+V/ffU4IcYzCR6fXzGLq4XYObC/Og++WsK3r4nGyIGUg92q0
         UCPUfBvE1GQ28tTuVenymvvDaZiA5wppLfimOttVGTHZjws/mPa+fYkZgewHjEZ3FgbP
         LoSkG7I66Nu0GdUzkKUcvNTPbL7Fbn+5+m8MnQ6fi1+ak6EW7qmPEyIpT9wo3cBIaIyx
         XpOuyO5Fs+MmVkC6TA2OB5DKwv/7vJ42oBa7Ts3xGtE8Kg3JFkc4lwghmPVGCJxs//9q
         vSrh3NrsX5rfJ24WyoSEfokAm/1Hsact0gjN0M+8I1IRtO7uiRWMfu+QHya16+RnyDzw
         DVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Mg0YGk+DNeLZeVw7SI2bYven1z5In8H5frSkCKMrocI=;
        b=jLMmVRlE08zmh8OIYpnPhvdwu19SvyfioRgZFLS7wyXaGPZ/o+kTpUvKIYHEYPRo0s
         xFWAyOzb1dJXHODsiIsjIYg3lTvMBzlsXsFRuVG1rapdx9I7mL64X1PTgrmYz4oqGx1a
         O6Ncrggx2sTNwTcFekCvkLFfT0V7c8nOfN3U+8Eols+jvqAQ4P1I7LZCK/5r55SURkZm
         QpL8NhazFJ8y8/7qgkJ8MCBglxMOw7dTVRATYovJs+14ZokTKDKcU0QkpDI9RAHbGe2T
         WsLQTqLMFyIMDv1DvGv95oB4HpH3Wyq/za6/zBxuffTHlsmmrfW/oBktPIOnLSnKR9ib
         jfHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVF1enxKCRrsW3fw/XegJG1zQVOw9/mtT4GT4WV+6vDWLAghvWL
	9uuAXP+O2TRN1C9zWm+N4+c=
X-Google-Smtp-Source: APXvYqzSc2D6UFUcMnZ9Yofzte6GI+NZCGtG/QwvsnkcsmNB1TZOsBRwkMWxTCblgXlnMWcXg1uEtQ==
X-Received: by 2002:a05:6512:509:: with SMTP id o9mr1726969lfb.28.1573379195318;
        Sun, 10 Nov 2019 01:46:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:c4:: with SMTP id 4ls665218ljr.6.gmail; Sun, 10 Nov
 2019 01:46:34 -0800 (PST)
X-Received: by 2002:a2e:9208:: with SMTP id k8mr12750718ljg.14.1573379194597;
        Sun, 10 Nov 2019 01:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573379194; cv=none;
        d=google.com; s=arc-20160816;
        b=N9wTZjHwjgHg+wr6tqrT1BfxDwGYL8yYcruS5TVulbWnP7d05ptsSBMPwrpM4zl60Z
         D5svaT9fOFYqCO0MnpnFUcXp/UgtPD1GIBYNECPgEjuKIAREkdhdm7wKatctg4NkJ7Ey
         ImKIgDAwgBrLq6rxCLmpJE/fsHFNF2BEkUy4XRWrVDsY4+de9eYN74AeDSmDLivuYCho
         J367bVjRWpruT85iGiFjoJbebY6hQzcwKPEQxW838UaXBlA9egtsQx8Vc5tCGVeVhrFN
         fZWB+MszqFM/wUZlDMx8udARdvQdMyg+rr0u+Z5Mq8TQ4pUGsZ5nH98+pCp7CWzkJGC0
         afBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=mEljAldbmoHSwI0YMi2etMQ0zxi8oWgpcyzA3tLsXUU=;
        b=DhfyHhxiXYQIy88IfpKVMZLKXxGXtNZtBcMHCQZ5me2gAiTm3/pj38WVcEQyqW9sNr
         qQxVZzaOqOZ3w3l0Wbrv9hqoZpLkDiYdT76XpQ0wNXUQcK3civFb+RnwLgxbfnes5Vcw
         k+TLe0ZDJGvPMnMAVQQVEgdBv/b4m4IWjfapKTAe/Jm38EId7xSAYmo3g+3SDcYcA8xl
         sF017TTZYItOdmI6sa7uMUKxC31hgRmALopuoalEJ6Mh8QTxzAX5F2MI7UbAwAI3Z4Pt
         hk4/gjUe8STIDLnXhBId9BQjumrQCOScaCJUEh2B8m00NOK1YrF8dQf5+v2yHXfgi10L
         gm5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bwPb7rCt;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id c25si658920lji.2.2019.11.10.01.46.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 01:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M5OaF-1hhNnq2loN-00zVZa; Sun, 10
 Nov 2019 10:46:33 +0100
Subject: Re: [PATCH] tools/Makefile: fix install of jailhouse-config-collect
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <20191109223045.26043-1-fontaine.fabrice@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <80c93e40-9dc8-35eb-123e-62c688338dee@web.de>
Date: Sun, 10 Nov 2019 10:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191109223045.26043-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:BtCLc3aogqcmC3fUNX7QDBP8OHZfEOnqzR7TfGn+L/TD/5Jy7yD
 CPgjEcnJP6H7glEtjAHQbFnGZk9PjoXK0jFg5GfQGOZTci85zj72Gy972b5kiDwgn+V/rrv
 459UEaAwqkUQmx7TCuzaVTbN4HEQQUOaMBOsGxH/agjPpjGjRNQUA50D0WPDkPNZTHGl9uI
 JW5y/SOSi1lJtAgmdoj2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2pcyjb4pnmI=:8W8B9f55NLcySLkKImVmcu
 921tR8f8bz5Q3bUsAnaTmrfdU5q7KRFnQ7KwxUkf/YQ7CTkFTHkScbZv5jXdy6HHybt0d7jKn
 16oUocEdqp2wgKkmgPv7UJwKpL+QgRkWE0K3c31KA8gq1OOwtosp8iqiPAfU3K4mPIOA5AqE0
 a3nj3bwYHdi4UJDMyLQL+FKzvgJLMgt2LbjMpKknK804vtyFpmKYc+WK/qEHjiBr/5ANYYi1+
 eqZdPCs+z4f6WG/f+8jdazgVFolGehjXoEcisJctmDpqfR1sgCGSGUSi7wiOq16qgzA0LyUqw
 CaMPGutpVo0muysCXdAxEfhIukLCbx+I1cdrZJm2cF835IQXV1wUAraS+2tomngBnhcD6Wx7M
 eDhw2ZthwTHHmZj3wlcoFQDhQwBfrIeihTV43t8zNCeTRDwd5wJtod0oEduKGHLsmkibHXSZd
 1Fp1LymreSTaUugrJyWEzPkTze6aQQkBGV83oMT/TWlIH4F9qztXKEx+/Uxq1JVLuMTFXb8IQ
 vHZB71MCgQljfsAO1WV8KunA56sA+/P4aecFcA5DXFLMPL6aME2qHz2qq9Y8kJcx7OZTo1s4W
 uyXvNu8aY+SvCWOQGqphVKNlDTTM7y5YeRQKXC33GmEl+0WmOqnWO4JV4G+1b115PMSlSxAIm
 rt8KkGzzCnsCaA43o0QlGGa+TpS6eNAIUN14fRmBZxi/hKZDRc5q6PFhxtzdLfB9ZEEYnurP/
 GalLMGjacViZFq2Jt1uj8TRd1P7e5F5LPwctKrkkQM/D78wxvPo6Y5JB/ui9bavpC+KYA1ojQ
 NszaUDt4GBSi0iejh2RsmGJPRcqA7F3y3wPkJBLr4dgukPmoV/r6CreE1eNFDZ1H7wMFB6cDc
 wsCRjx0iY+aKjcln+aOymc+dkXbUa3H2leKWyDMdkGw7DepohNoeDF2ytP1UeeEUOCSNk5TB0
 LHOD+qkFlw8Z85HdWCQ4/NUJ5bZnmBua8oxdEBz3BXi5Zo/PXLTe75AAjCo5gb0oBiy1OU9bp
 0EtRRcWstwR0mCCvBEsvrKF3ETWsE+xY/gYF5u4Kda86fxJaRoi2Hw7yndnLCFsSwvAmLmRAl
 OckqXSs3/ioutqbFFUnPZi8vdrRCVDltPEjKK2K9fvMow1BnzA6d5Z/9WUpu1wxNnwexC3mEC
 xVxvtU7c23FPBtcPI5Ctxq0184mMgjSkdSLcZFsV7l93PQZLD/6LjADV3rtEWC+jRmpuoXRcD
 l9dhjBvq6YHPYZGjYZ4JbRixzZyJmsYp71O1m40udV+Rxtcm3Od7KRJL23iA=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=bwPb7rCt;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.11.19 23:30, Fabrice Fontaine wrote:
> Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
> jailhouse-config-collect is not installed anymore on target as HELPERS
> is updated after install-libexec target so fix this mistake
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   tools/Makefile | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/tools/Makefile b/tools/Makefile
> index c7dbc734..7f4d00ff 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -35,8 +35,24 @@ KBUILD_CFLAGS += $(call cc-option, -no-pie)
>   BINARIES := jailhouse
>   always := $(BINARIES)
>
> +HAS_PYTHON_MAKO := \
> +	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
> +	&& echo yes)
> +
> +ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
> +always += jailhouse-config-collect
> +HELPERS := jailhouse-config-collect
> +
> +else  # !HAS_PYTHON_MAKO
> +
> +$(info WARNING: Could not create the helper script to generate \
> +	   configurations on remote machines \
> +	   ("jailhouse-conf-collect"). You need Python and the \
> +	   Mako library for it.)
> +endif # !HAS_PYTHON_MAKO
> +
>   ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
> -HELPERS := \
> +HELPERS += \
>   	jailhouse-cell-linux \
>   	jailhouse-cell-stats \
>   	jailhouse-config-create \
> @@ -62,22 +78,6 @@ install::
>   		   Python and pip in order to install them.)
>   endif # !PYTHON_PIP_USABLE
>
> -HAS_PYTHON_MAKO := \
> -	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
> -	&& echo yes)
> -
> -ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
> -always += jailhouse-config-collect
> -HELPERS += jailhouse-config-collect
> -
> -else  # !HAS_PYTHON_MAKO
> -
> -$(info WARNING: Could not create the helper script to generate \
> -	   configurations on remote machines \
> -	   ("jailhouse-conf-collect"). You need Python and the \
> -	   Mako library for it.)
> -endif # !HAS_PYTHON_MAKO
> -
>   MAN8_PAGES := jailhouse.8 jailhouse-cell.8 jailhouse-enable.8
>
>   define patch_dirvar
>

Good catch. I'm adding a "Fixes:" tag on merge.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/80c93e40-9dc8-35eb-123e-62c688338dee%40web.de.
