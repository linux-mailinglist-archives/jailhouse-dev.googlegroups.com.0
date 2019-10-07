Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLGX5XWAKGQEZPPNXOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B57CE998
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:45:33 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id s25sf70944wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:45:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570466733; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dz0yzvmqRO5AMrNrKJzoT3nnFD9EjJh1UXUggtJE5tHAaS+nHWa3vY0xP72sLlOae3
         4UYalDpRWOReoN8FHJTX9DnpFiPIwuAFyjpgS/xFhFHJ30xRi/hY9utFJSF4/uGHkAgc
         F9NwCu050ow+zDzsZRdNu5aZG9lHxP9N9Qk+4UJZlS+0y9vTiO+OrCqTnqM1NyNMJT7R
         SMR7J+UlOkM90wjXWuFKFaIqsbp3Te4Qi2ELEw3A2GjGwCsS0KaYtDl4IdS9K2U5JLoU
         RD/wVX3kUtukjMecMYdPvChgXyCLBh97wc5qaNuL2mkrHSlj2pOgXFGVNCW6+YglXSTS
         UZCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=6Qd4jFFZzYCL5VWheBPZZaZ1wAzf8tCeEho73P/ado8=;
        b=zeYOZyzW33fBaCpw5m36TodW/QUkMHaFn2/bz+17zTBDWcGXzPss6+MONXwJcZggns
         IrgTGpiT62PL88Ww3rGg1X4dxFGacUHavwtG4GzjK3hqb+qHgLVIdTiyXTndRGR1p5zb
         tm4fNmoflpvN44gTW6OFL6IOB5xGWbomNaYvAf6RimRv8a/b3aaAGmgHTIQ7gLPG43Gd
         2h7Q1oYJpUocn1lmY2VWscEdosjAZwHqne5t5KyzGDdhCsJpRfr8FTl38LjpW11ypW4k
         eQXinR3oqFoIU/ogRLzEsa0z4hKMhIoesStdejIN7RYdw+pf5HReHoPKDR0gsTCSKiEV
         UZXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6Qd4jFFZzYCL5VWheBPZZaZ1wAzf8tCeEho73P/ado8=;
        b=KqjggAGURQKxWI2ptIBTu/H5Qj0DUK2ddPSwgP3yIOjSVCdh5ZKA8tT640zzuv+7lJ
         531UYcD8Wb9WcyZBcJ3Ij26AUtdO44+a2c+pAwm87v0zQU3vscP1DYahFJsbGSMCmei1
         cO9W7wq8oq2JPGoIJnCq8PK3ZIEeRR6iAR8ydl9exbTzdmSb0wBj/BxodGZMLvr9Qp83
         fboPdD4YS3IyRs4C1ABL3FgwH8FSOdr5h8lhm3zM6ERP5Yo7KRTOoSxFRtsICOl/SNvD
         nIhaDAytd4aSZ85fzRgCpKikihrJDh3SSeNfe28SlnkMM3cmX/Ol6V7zrEji9KWaMVcC
         NnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6Qd4jFFZzYCL5VWheBPZZaZ1wAzf8tCeEho73P/ado8=;
        b=iI/33SCJ9C06PrpYfxIZfQGqfTHWde4Ipo4cAckbqvvKRhS52AF09S/uJalKbWeo1S
         uO8vyrT2f+T6+hjyvaLI9thxyeVPxQN+TOHQiJh4AS8rAdkHBO57lQVt+AD791yRImZK
         13OqeaexDf26RQaBDBWtXfA3MK+Uouvm9gctNkicIMY00WtvjtQMN+H2uHWPtMfdv3Yn
         cXHuO+HUG3rrXLcwNH1b60x6hswQ9t24j3i+RQ2M7R/HzA1rAs2NEEvPUHdAKI6fpcmh
         oBINqwzgmH8VU5QeMf6kR+U4dD0gU3TrxKtSeAH4sahH6rGBlpdD9U5yiya//uifBNPI
         aWRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjTwhh7fxk733ZoHfRDS6eC+8gin6nwQksMCGJLZpp4jg9l0V+
	Z1F4XcbFTvaPZcBKRexm+qU=
X-Google-Smtp-Source: APXvYqxLvhUtkTDSF/C0aZ8c8GuOU0C+8U9LUDpWnPFuUKCdFnAPBsdP8Rbvc3cPT3JPzb2j3z/9/Q==
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr206163wmp.28.1570466733038;
        Mon, 07 Oct 2019 09:45:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls62873wme.1.gmail; Mon, 07 Oct
 2019 09:45:32 -0700 (PDT)
X-Received: by 2002:a1c:4805:: with SMTP id v5mr178706wma.130.1570466732294;
        Mon, 07 Oct 2019 09:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570466732; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ4u63QTgpa9zfk3cPWlM974NjO+9auFRYKR6qgN3guw8hc8xLzMxa0zJXL83FzLJv
         UgTGcsnzA85df/MDne1Id/AXyXyy166CgZBd7xnSoqcQ4LbOwxsgA6KlN+ZZQ9Tl3gEl
         07ELz3mCQhQtzwl8KvwdisDmAuElKDuOAxEPMOd3JH4EbQ8+grk0qPiXJ5FLXf95iEAx
         cYCf7GlmhA5Q0opw3zmlKCsK99f9UAJTeQ6cDSu/6uwq4TEoTg5cUZ5JXRYTpuUtQW1Z
         tvVomL7dtTS44nZfPXHJhYHUqjvlctAP3x0QqZMuvgw/z9YiK2heeYWx459x6ZQeDdtJ
         faAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ak2zOojm6CJxh8epLCHVL8DZ0Ytlw8+7dTFArcZCPTw=;
        b=v680UYz5+T6wFh0V76ciHX/WBLHseSmLTgYBj5XxHa+4RxVObb/mvN19mbJokY4O/W
         4BcdGXpeQqcujyyn/kGlIR8vqaIUQg6OvP6YWXRrZmNXgnlqDAWYpJbEeBzHh3qAnwQY
         wlW0tUt9aWdYc3H3qy9lfrPFhnR+bKro5oKukl23SqB+w0I1AWiYM9B/1mRUazeA0+Ij
         9S43c+bBJSF/f5OjEkim718jmtgw7kv1WR4b1BNuHR76ZeT+DsEm96rpyktYt+aSPUiY
         orDQDSLFzsub4pPhDvbpBJIh1Hyjrke5QUBV31ixAdMhkix77GTYQoPwB1MUWdIVlFTy
         47jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s194si32365wme.2.2019.10.07.09.45.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x97GjVQf024138
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:45:31 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GjVIF008644;
	Mon, 7 Oct 2019 18:45:31 +0200
Subject: Re: [PATCH v3 12/14] pyjailhouse: sysfs_parser: abstract parts of
 MemRegion into IORegion
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-4-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f60ecdd7-c68f-b983-b9a0-a34d9ade36e2@siemens.com>
Date: Mon, 7 Oct 2019 18:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193857.2866-4-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
> This prepares for the refactor in following commits.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 3027f82e..0f91d928 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -779,20 +779,30 @@ class PCIPCIBridge(PCIDevice):
>          return (secondbus, subordinate)
>  
>  
> -class MemRegion:
> -    def __init__(self, start, stop, typestr, comments=None):
> +class IORegion:
> +    def __init__(self, start, stop, typestr):

No comments planned for IORegions?

>          self.start = start
>          self.stop = stop
>          self.typestr = typestr
> +
> +    def __str__(self):
> +        return '%08x-%08x : %s' % (self.start, self.stop, self.typestr)
> +
> +    def size(self):
> +        return int(self.stop - self.start)
> +
> +
> +class MemRegion(IORegion):

A bit strange, this hierarchy. It may match technically but IORegion and
MemRegion should rather have a common parent.

> +    def __init__(self, start, stop, typestr, comments=None):
> +        super(MemRegion, self).__init__(start, stop, typestr)
>          self.comments = comments or []
>  
>      def __str__(self):
> -        return 'MemRegion: %08x-%08x : %s' % \
> -            (self.start, self.stop, self.typestr)
> +        return 'MemRegion: %s' % super(MemRegion, self).__str__()
>  
>      def size(self):
>          # round up to full PAGE_SIZE
> -        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000
> +        return int((super(MemRegion, self).size() + 0xfff) / 0x1000) * 0x1000
>  
>      def flagstr(self, p=''):
>          if (
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f60ecdd7-c68f-b983-b9a0-a34d9ade36e2%40siemens.com.
