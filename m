Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB673TX5AKGQEJ7AFD6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E7254278
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 11:33:47 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id 89sf1308226wrr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 02:33:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598520827; cv=pass;
        d=google.com; s=arc-20160816;
        b=bjdFKIumJDNT1mSv5tHMH6i5kZ9ku8xucBwxohQRZWgTINbhS0/Z95QE6bGhivzGWG
         QTPtlC3jPrKWNI7nICX9Jgsc0EOJHhYLyW6WhAtn80+uFetu2Ep9Th/wPqwbkTkRDRT4
         DADdA3I2Kcs1e1V/kjF/eRUQ6uVuYq4BaoxRJabNluG6vPv/ihjVyMfKjxbzBpgrxIzz
         4HHS83fOGDeE7SWzrGPDIV9dgj17T9Cb8Xyf7vF+QmCY5xudXbuCBRlOV8HXLo1M5sq0
         wkGAY9udDABASbCeWlQv4oAUEI9bPAVKFmlC+G3tXkdC0Un0qZcEzsA/32HNw1zE2VD6
         Ia4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kH6Dptp7tx1dv6Pp+lCyztNXJ0myomv0tlcyeEJUuiY=;
        b=icI5b5o8L4EhPTSAASO7/VQrPNbCLITFjf6IjcilP3Ulp5p9GyWNdqT0z3Mxjnpbes
         YaZWCjGLmdZ7HrfeFnv6M7VUaKY/UmrTPtPKVIRgaPjZmyHCnNqL6eifCpxxEkbCqAVE
         RlhsQ+uFORRZownrhNkHkTMKvo1R4AtddU7LCwCWHC00aRlzQMpj/B3kmZ9KfuO3zUSK
         nc7xVKr3JXwlyNqjUea58OElSmwc/ILdasZYPjd3Ek82l6dZomfaO57tvQr/MZnN7HBn
         j75IjRS2XdPoML2R2/FYdRlK4SEpXju4meJYlod2IVzhDh4Gz0Erbx2xmMi53FMocQDl
         kMcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kH6Dptp7tx1dv6Pp+lCyztNXJ0myomv0tlcyeEJUuiY=;
        b=ped2erRjIoAis/dMdqWH4A8OjPoX/7S+BP6DJ+aAHFej6eB9s8kGFwZmXxqP93Rflz
         mDR68j7HgJ4YLwmV4QaHPYxKuCCXCJao5pSVaz7t7zSi6itKUiQABbDTrp+zrMTPZWiN
         k1ce3D6IYkGWgS+FbiK0SgxgQsrzVyGnY8r+TOnzS5eHatU5W4jzu8O3r+WctTMq/1OK
         1aJ4UWPxgjn/cVL4cUnv+XgAgfOlmOK67UPDniARZtWj+KQL45kwqVIfY81af0/ddVbY
         /tpVA7Z+SxiuZIFt7CK3OAcqZsv4rTJshh9rAK2fEysvo2yhpW6n6AYwhaZRGMPvfznp
         wDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kH6Dptp7tx1dv6Pp+lCyztNXJ0myomv0tlcyeEJUuiY=;
        b=OxmRvkr9mSqHMSfscktB5tY4L3/EH3MKHVHxOkYHGVuq8eZWCFk/O4GnYnB8QB+j6y
         WlWKbVky/LUWnyTu708YHmMvrX9hJ5HjxeXRvH0m/q5BAI6IEwLu5mxEGqnh11hVxl9+
         rw4J0WLCwO7GlFk+vnYTlw8F3h1B33Hre8wO59RfOpeTK/LXNEApklMhtkEK1lcgAzE1
         q0EO/iCfZ9tot1f7xyQzEUBDRB0uVxBRDYE+5D2Rt8PtVPdNwX79NSBDhMpvTvrEBo38
         PQag99V2/Z3+bjNELKFsji6OlhpT76o9ea2NfEbQP+mosM4lXqyxmJ3G+Nm/+DgJMANP
         6LCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530DQW9edg5aEpUdunseS7GOfrO0joYAZDYzedVArNw34xe/A4N+
	RQE+G08qBkOMkKV19dCX95Q=
X-Google-Smtp-Source: ABdhPJw/3dFirYhgrFoFbiGj+N6vHkB+wUAu3j0k9WIfT4xNtMRQglcJgYaSqH3iNPvaCzxvDJx3jQ==
X-Received: by 2002:a5d:460c:: with SMTP id t12mr20318057wrq.334.1598520827419;
        Thu, 27 Aug 2020 02:33:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:63c3:: with SMTP id c3ls658978wrw.1.gmail; Thu, 27 Aug
 2020 02:33:46 -0700 (PDT)
X-Received: by 2002:adf:828e:: with SMTP id 14mr3820711wrc.217.1598520826572;
        Thu, 27 Aug 2020 02:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598520826; cv=none;
        d=google.com; s=arc-20160816;
        b=Ije3GbgwWVSrfafiCdPc+b4HO4U+BXA389sOPWdUcwXuJRw27v4QObRtUfpfYrfdON
         +Cw7R6tV5+YihwQBoHKW+aGV5Vd9U85tHlanTIOWj2kxyFWxH4RPcbgQizBHNtMzn0Mg
         CgijshxZ+htAQoqw1m4jsdnau58L61x9BWF8v3egvlW0okwU+V3WCIn3p3IzWq/qlHu0
         d8EfDLI9BPAa05hqeOtcLuX7iRXvWzKCMCFdCV+Wzntmj42ViNc9W71ILlozuLsLk9BL
         UOqzdHSYt7cF/KtakD0yOGSSNxwMm7CRywPdqzS2XToqz/tH8Nxf4yCVlAalMDBk/7r0
         QM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lE+9FzWzjMs2c3+qKMnYfCDzutJfAvea5ZN7OaOSFnA=;
        b=wfgNveo/ZID+Y4psb6mc6t+LCZXx4TeeHX1RYqtJ4J4fjj8drus2QVgSSwfvww5DKF
         rCfmrjCIweSi0H3MZ4Bo3vBrV4k2DFCsKmZoDbsSk1TGlR7/KM/6Nj74h5GzDgcenmZn
         gPZmgt0oJtjzY4QIrd85MmRB+bMchyeMw3sK3IFhJhD8k63Ddg9cTsBjS6FwmE+NKyJC
         9NSAJ9MuuKjJNIQdABAqLGgjjEA9EGDSg4cx2dCILTaprQ9yRwp43PFOHvwySWL0u7v+
         utab4DrvsEYszmGBkvfYWlvhU7Aal1vuNWS5+Uh+nPrQD1OfUy5mmzFqrFgGTXfMFIB5
         Td1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a15si144417wmd.2.2020.08.27.02.33.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 02:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07R9XkMQ007272
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2020 11:33:46 +0200
Received: from [167.87.79.124] ([167.87.79.124])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07R9Xjtw013530;
	Thu, 27 Aug 2020 11:33:45 +0200
Subject: Re: [PATCH v3 0/7] Configuration parser streamlining
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9afe26e3-a7fb-ebae-ea94-7d0ff228ebed@siemens.com>
Date: Thu, 27 Aug 2020 11:33:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
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

On 25.08.20 16:50, Andrej Utz wrote:
> Theses patches mostly improve non-functional aspects of the Jailhouse
> configuration parser. Logic for unpacking binary data is consolidated
> into CStruct class, which all parser classes are inherited from.
> To improve input flexibility, data slices are replaced with I/O streams
> (see Pythons 'io' package for how to use them).
> Finally, a CPU set check is added, which will list conflicting CPUs
> between cells and also usage of non-existing ones in the root-cell.
> 
> Changes v2->v3:
>   - fix config_parser usage in jailhouse-cell-linux
>   - fix output style in "CPU checks" commit
> 
> Changes v1->v2:
>   - reference class variables via class object or class name
>   - drop implicit PEP8 formatting
>   - dropped unused patches
> 
> Andrej Utz (7):
>   pyjailhouse: config_parser: store binary format specification in
>     struct.Struct
>   pyjailhouse: config_parser: move parsing into class methods
>   pyjailhouse: config_parser: consolidate binary parsing into CStruct
>     class
>   pyjailhouse: config_parser: use I/O stream instead slice of bytes
>   pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
>   pyjailhouse: config_parser: consolidate header parsing
>   tools: config-check: add CPU overlap and boundary check
> 
>  pyjailhouse/config_parser.py | 296 ++++++++++++++++++++++-------------
>  tools/jailhouse-cell-linux   |   2 +-
>  tools/jailhouse-config-check |  33 +++-
>  3 files changed, 215 insertions(+), 116 deletions(-)
> 
> --
> 2.28.0
> 

Still doesn't work - did you test jailhouse cell linux?

Traceback (most recent call last):
  File "jailhouse/tools/jailhouse-cell-linux", line 723, in <module>
    config = config_parser.parse(args.config, config_parser.CellConfig)
  File "jailhouse/tools/../pyjailhouse/config_parser.py", line 287, in parse
    return config_expect.parse(stream)
  File "jailhouse/tools/../pyjailhouse/config_parser.py", line 220, in parse
    cpu_set_num = int(self.cpu_set / cpu_fmt.size)
TypeError: unsupported operand type(s) for /: 'set' and 'int'

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9afe26e3-a7fb-ebae-ea94-7d0ff228ebed%40siemens.com.
