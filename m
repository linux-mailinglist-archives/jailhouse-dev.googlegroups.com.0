Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXX4T3ZQKGQEM55QWNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4218031B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 17:20:47 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id y10sf1322690edw.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 09:20:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583857246; cv=pass;
        d=google.com; s=arc-20160816;
        b=l160974ZtupLkcphT2FjUNvk3sH8jJcWOGGYzKwGepFLEiQvFny21SC0cHNc8BEr5Q
         qA9hfhWNYNmxON2xXcjmrL3X/VgjIHpTDYcEG+E1AF3hmGgMgqa89hmuthybUAC4p2Ar
         pQON+HXu4WHCop9RqPQ7ogbkaFfFQ+gk/KSUZb1GauVK+zrj9EP6IQUkmqob62CUmQ1g
         c/s/BzmB1Dy7ER6xfni+honCgJixoNTOrFd+qVxnHsgWzUYwwN3ItaDXliv2Rd18NEu+
         /ZRw0Czx2nJcMdRRH9ZZYIUErtOMEkcmLg7C3QwON4Foz1BLBr3Jg/S4lYNb4EBW/AeO
         8Trg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=R/tLk1hSQOjgZGtV8VOFy9rXgIumYaWOnsy6LPxnSJ0=;
        b=jOylPJYkwKqy3qhtONUxLl8i+fLDaNlmcMWB87vTNNMnsDEzEFfVuKDVMtI/flpq6o
         hqw7Xr6we7VvUPp1vvTHQjPP3Adzy7WzLdRoQKyCWTvwb96Nfkpxe9B08/TiPBPESmUl
         EEWVIhRjtnO5zh1RpNLFmyFunyQABPbmlsIkmlmOCVh+a+jYDhFE/Bb81MCTvNXENtbC
         Lp7b0vxBNUdyUajcwB9elrxYv/VzLQplhd0x6VqcBjwyDhr8RpgkWQHm5KeUMESW45Sy
         ez3IvC4T1AvPyiOmN/ipP1SbLvNauA6lEWnReLbVRm1fDAWGDv4tjnh0LiMrE4o839rH
         wLFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=R/tLk1hSQOjgZGtV8VOFy9rXgIumYaWOnsy6LPxnSJ0=;
        b=Cfr8VydbCGf9jSLur4LLip6FlzV8p+2kncOMYMMMmthzGtEWbdwp/E9yzF67W/Lczy
         KbgT75zVK3gMPyE+HnKqmJ5rNL4z9dHfUpCqzWOR1ZFq/nHFzjPfSIUe7ju83CDY68S2
         aX4fEb9MhAa1u9cftXK9QPL2vjuGA36fUBM9Rwo/uFHTU34SiEou5DodLzZeUmog8Bd9
         Umqx6sZzZ5BNf1VV54Q+j/+kEnei4sfPYeZn7ciSanuoAKvafS2q3tmO5U+CB2/wV9vR
         u/dPV7g17kr8NOhMJ102DtlV7qoaHK58YpCL3kfc6Egk4LgqxJYUEQ7KW4AeqkrvQysN
         ocMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=R/tLk1hSQOjgZGtV8VOFy9rXgIumYaWOnsy6LPxnSJ0=;
        b=dkMyjDLA4SwL1WEfsTAhEFbJJeeadd/MvskugM409YKpQ9gqDq7v57oFrbp0zQZuIX
         QsE8rdBUadZ1jilZgOXhV9AM5NDFFr2gTEmP7XbDjZ+rOpfMJG4BB1cYK+rgiZ5l9amI
         0/FDyNEynH/f59TwSjEguO8mzb707Z7JnDVQuEPbktlLtIcBxvwuLsuNRLw0RP9YqI4o
         4qJ3W6+u8Kq/E+YhfgPg7Bje5S+6JQYCllYD2Uf5BMly+190obYPoLkbEq2eD6xlpmP+
         0wHZjXVR5t2BLaR29sMoakSEJ2OKUx+LQZlLJao/0m5hdJgY9lFpMJYIKVDLlvc9tC+G
         54qA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2z7BDW09LqFpo2yQnOZm1LJzLH1YfJWBi5drl3R78qyqpUiHNy
	vmLkDkA8fPY3iKsdn2WiHOA=
X-Google-Smtp-Source: ADFU+vtHijf6B023txBBvuLzoggW9MgL+QaJ+nVDggRx2wYJe6nNR2cQ+lejBqHKtYc/0/CLcsYn7w==
X-Received: by 2002:a17:906:785:: with SMTP id l5mr19658112ejc.311.1583857246700;
        Tue, 10 Mar 2020 09:20:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0cb:: with SMTP id bq11ls3999914ejb.7.gmail; Tue,
 10 Mar 2020 09:20:45 -0700 (PDT)
X-Received: by 2002:a17:906:bfcb:: with SMTP id us11mr10208908ejb.185.1583857245793;
        Tue, 10 Mar 2020 09:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583857245; cv=none;
        d=google.com; s=arc-20160816;
        b=s+Bqeq0kNIflpjqmFW/6GHtqZvX9juE2J+3w6AjsjUP9FgOYAzITVg9hNee9jBDVXo
         mi6mSJ2BtxxjaTUzZHOuDTaWI+shAQJpz7mA9pGeLcC//Hdlf8aWZTHI5+cHtCVCDlxV
         qunT4fZX2/Fn5qRSjdZOD6PRKt+n8xbEgmeo9iA+MF5HQCXSAstDof6sm8y+YCTdjbrm
         ZlliVENZ1CPn27gteVwR3qfxgYYtubE0gtmNfUZmwgiPvLPaSH++F5rI9r7LVWFJQ4/Y
         l2OzY0k6r0SyKNmo4F//FjQpv2EWla9pK6itccgjbKFkCDM9FFHpldJzaFX+YjAPC+ar
         bv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qTL3do3HqAhMAn/sP2dzGdqdRILO+UHGm28QeNQDBMg=;
        b=W/vD7Z5p0R+T8QFKkOGsT5KaJHhOTciJeusHEJP9YfcqjDwRhEV6qeU4NrV9c0t+Dv
         aC2rgACnOEgMwP55+9nMZ+OFBMH8XA6qw+eEZDyWzgoOecX+05Q7U7U05HPgjlViYDS0
         i7YVHpHHAuwrXRiVA0p1h7k0O64m+0KOSnFYKCJ+RIxYwjizeIgdG9gENtUUEk+ypyIj
         b+DqZIyyVy0N4jjEIn6i3IwzwavWvaRA+ZRaX/Wk/upjec1aKgcPVDqCV6+4CE4AWuIb
         abQ8/NiLUnH6A1+GjoZxuemuFvLr6pnGgrAa8owrIIo+No5TCCnofI5Ueu756VdrG2EZ
         I/YA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d7si726115edo.5.2020.03.10.09.20.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AGKjkJ029023
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2020 17:20:45 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AGKju6018646;
	Tue, 10 Mar 2020 17:20:45 +0100
Subject: Re: [PATCH] Documentation: use virtio-ivshmem-block for block backend
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev@googlegroups.com
References: <20200310160324.21136-1-p.rosenberger@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b8a2c0a2-5a2c-cc90-22cf-419116ce0df1@siemens.com>
Date: Tue, 10 Mar 2020 17:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310160324.21136-1-p.rosenberger@linutronix.de>
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

On 10.03.20 17:03, Philipp Rosenberger wrote:
> The example for the virtio-ivshmem-block shows virtio-ivshmem-console
> not virtio-ivshmem-block as backend.
> 
> Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
> ---
>   Documentation/inter-cell-communication.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/inter-cell-communication.md b/Documentation/inter-cell-communication.md
> index ff99a592..eeed9876 100644
> --- a/Documentation/inter-cell-communication.md
> +++ b/Documentation/inter-cell-communication.md
> @@ -116,7 +116,7 @@ Analogously, you can create a virtio block backend by running
>   
>   in the root cell. Then start the backend service like this:
>   
> -    virtio-ivshmem-console /dev/uio2 /path/to/disk.image
> +    virtio-ivshmem-block /dev/uio2 /path/to/disk.image
>   
>   The disk will show up as /dev/vda in the non-root Linux and can be accessed
>   normally.
> 

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b8a2c0a2-5a2c-cc90-22cf-419116ce0df1%40siemens.com.
