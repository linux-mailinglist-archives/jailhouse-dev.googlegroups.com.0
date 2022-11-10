Return-Path: <jailhouse-dev+bncBD22BAF5REGBBX6DWSNQMGQE2QPHSPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA6624699
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 17:08:00 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id m25-20020a195219000000b004b40c1d5566sf704197lfb.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 08:08:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668096480; cv=pass;
        d=google.com; s=arc-20160816;
        b=qOyR/9VcfTKlAEEgvMr0vGkAP43Iy7U1RjP8DSuQOesFCaoC0uOv7bN/M6+CX6Omvw
         VF50u3uxxFF72/rayOZ5gXdmdB47NoNfsxTQ1IiR8jGJfjNtorN4DSlHwPXuj7kn0rTu
         IJhGDIZ6w/f1+kVWTGa78j9MsReqtJ8WaMnvVg79tXnUj2GQFphh3XVyLkDu8dNHQKwO
         sigAodt12CRCR5cKPt+DVG+rtyW0xMOfE6iZOY8fY6ih2n3NVKBPGWkVJnRkaKULYo8U
         JFEidKfWN3tfq5O0XV29sgbTYapzVf+TIH3PKiJYCxphF92peccMqsaoqmq7owkCna5U
         0wcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ufvHrpERxbqs0SSCGK3iZR5DuQdB47ibPl0VB8wd7BY=;
        b=TWJy4+sLK93AnwwDYKy/SpgvvAV1uFZh5MPeklOyeIXzy5AsCeofs3ATLuptAtpPGG
         SbdG+5XhSN5Wbxu6tpUZI3TtoBCQDX8xDFe4NfkrfwepDWP/v/AT5HkgOBRsGGpfFCyr
         e7zga4FNZFHtlE9kSdE5SmlN2GEw7aK1FmjJ+h16XZzLJ5WjZJjWrF+AhbzSuzK2pvZs
         rCGEUY9fxBJKwf1rA5KDedrA9w8ax4yfKZ6fZemwKRjfpPILAqzoki/PGBPmkYJoFfqB
         rY/aW2XSpTddOvMXij0e7gNyxXVcv7vuwLabprk+MOvrn/PnRVXF7y6hfnVAsIPMZ9BX
         28uA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ILDFbCoR;
       spf=pass (google.com: domain of dave.hansen@intel.com designates 192.55.52.43 as permitted sender) smtp.mailfrom=dave.hansen@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ufvHrpERxbqs0SSCGK3iZR5DuQdB47ibPl0VB8wd7BY=;
        b=MBh+3m2AIreMfLXqLpOSq91aC14bGXOfO/dWM1WZwLZ9cQfiW9KbaIR/Da0lgjnmTN
         FMdyJkLajFifSL8wVMPNOM5lemt2mDmVytGYZlKM01mx52A0nX4MqBN1iIXs594gOSEK
         /r8X3okQuxrQ9h9iDUYEZ3DE4/CvwzD639Tjesi+h0BtBX8hrzXQajOXjeoiIk7F5mlE
         ZSy73NQYsToknuJ/2l8xmyB6JhYc/GTuc9oFOvfKJK0mpT1WXN5m1j+W3jkAxlvZBiFf
         VwFKrmf5P55gtxjlmWv9wnIG40Cf3MUUZgZvrz+zxpH7/AYLbiRkXm8HAbI/st9ZfCdT
         /W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufvHrpERxbqs0SSCGK3iZR5DuQdB47ibPl0VB8wd7BY=;
        b=6tca0Zaq46DJxcBSpmL7m4EaiMAyQDXTlyG5POwjtPnUofIvQimjXmWIxMchiKzznk
         YYk/AFt9QR7YKtP/alaolauSmc1h7pBVzc4/P7gOGkXyWcnNq+j7v/zOkbJUtoKIx2KQ
         LB7qPaC7BFhV6LC/GHIpSwmU0EikrOMkKEUiFlkeTPqF7ivFI2P56yXQrGRzOEqgRUmv
         AGgbaXOU+dp+8yiXUevBvd1ZVKLZy9fXDSVJZycj46iDFPR81vHs1dT6W2R56xF4kzTk
         RJjWqixvSn/juIVPzfguYFM23+lAl21l8bHKtP6pX01XvZmtU2KrVQJ1H5tSkNgE3Ga9
         amjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1MnK/LatyzVmirzVNAF4uXpGPgflcFEwhn3CS0AFzJUzoUgBP5
	JTFNCtNoY5/uz9GBQsGHkww=
X-Google-Smtp-Source: AMsMyM6QM5TTNI3I5y1AxMEetKh1rm/1rpb0kvCfcylMlcBfH7F8uG7hky0gZ8Mzqxc9Q2aaQFBbTg==
X-Received: by 2002:ac2:53a8:0:b0:4a2:4589:fa1e with SMTP id j8-20020ac253a8000000b004a24589fa1emr1504397lfh.444.1668096479775;
        Thu, 10 Nov 2022 08:07:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:74e:b0:49a:b814:856d with SMTP id
 c14-20020a056512074e00b0049ab814856dls454543lfs.1.-pod-prod-gmail; Thu, 10
 Nov 2022 08:07:58 -0800 (PST)
X-Received: by 2002:a05:6512:2249:b0:4a2:2e81:9be5 with SMTP id i9-20020a056512224900b004a22e819be5mr1656163lfu.486.1668096478263;
        Thu, 10 Nov 2022 08:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668096478; cv=none;
        d=google.com; s=arc-20160816;
        b=k/1wMRSnV1cOssVquP5HmUodqQ5qN2FTWB9XW5zoPeNXS+xdTDIr/fDQWAPpC2YeU4
         OmXPlmz0hAIonbYDCXgH3dDDs2AYIj03reSLNB74QODIXRy7FH+s0jwSOnRJXIrz2tW2
         Y6puHPoHdrm+u+CGv3GJX8Wavpe1idUkO8z1Ac0DnzHzO8IjckS+5oWXqFJyyY3ho2bq
         YDNka07gCR0Ea27nRM1sInAcYFzGF270FUnUJ9PDdc8bwLoldmxq8bFlR8XIvJzEN9ZL
         iCL4GhM1SJYbXmZ8KRSHC1pLBujnR/wkkuJ80+6BTSlaefxbBTQV3En4RbVl3iwfzXBe
         aM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QFHN59zPecg8GBUrV4BgxKgSlDALh6+o7CMS36L573E=;
        b=QFK2JgWJLzMbupEw90DgEgqhDnndv0J7YYR8Hnrq4jBQQZPc3/x1IyiAi4WIqCqzM0
         h17mI0UljahdgFY8DTdTaRgT9JkJ77W3WgGS6Gm+o6KFe4I1tuTJJDqin4PSS3jYtoEO
         tUYsCw6JGSldfi1yT5bJm3R2Tpp/z1agy/0iOSlecGGJWnnAPp4ROa+4AibTkZbhP0J9
         sWTaKWgroH7c8IMZ56jmtnddILMWNaw6AHgbcfdgcpm8VYYhsPXOMltfaMwKXu/67d9L
         OR5NDfMw91+1D+99n7tkWf23z2Wzg9NagrQ+39ojOysOcLRU7kYoGtJKQ3kH9lbPt3X6
         MY8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ILDFbCoR;
       spf=pass (google.com: domain of dave.hansen@intel.com designates 192.55.52.43 as permitted sender) smtp.mailfrom=dave.hansen@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com. [192.55.52.43])
        by gmr-mx.google.com with ESMTPS id 6-20020a2eb946000000b0026fcb9f003csi617376ljs.6.2022.11.10.08.07.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.hansen@intel.com designates 192.55.52.43 as permitted sender) client-ip=192.55.52.43;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397643832"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="397643832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 08:07:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="631702730"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="631702730"
Received: from csalvo-mobl1.amr.corp.intel.com (HELO [10.212.217.97]) ([10.212.217.97])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 08:07:54 -0800
Message-ID: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
Date: Thu, 10 Nov 2022 08:07:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org, jgross@suse.com,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: dave.hansen@intel.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=ILDFbCoR;       spf=pass
 (google.com: domain of dave.hansen@intel.com designates 192.55.52.43 as
 permitted sender) smtp.mailfrom=dave.hansen@intel.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=intel.com
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

On 11/10/22 07:45, Ross Philipson wrote:
>  	dt = early_memremap(initial_dtb, map_len);
> +	if (!dt) {
> +		pr_warn("failed to memremap initial dtb\n");
> +		return;
> +	}

Are all of these new pr_warn/err()'s really adding much value?  They all
look pretty generic.  It makes me wonder if we should just spit out a
generic message in early_memremap() and save all the callers the trouble.

Oh, and don't we try to refer to functions() with parenthesis?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e62a029-f2fa-0627-1f71-4850a68ec6b6%40intel.com.
