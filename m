Return-Path: <jailhouse-dev+bncBDM2HMO5Q4HBB576XKUQMGQE6C2Z6MA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0377CC97B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 19:08:09 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 38308e7fff4ca-2b6ff15946fsf55850251fa.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 10:08:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1697562488; cv=pass;
        d=google.com; s=arc-20160816;
        b=dO1D4t1xIk99IjZlsnUanxH1u33gRHboStUI6XhkHVOSNL5DD0xI3etM/Lw5pse4Ck
         xJpYHSYkAgdIM0O84melu8selgkPLn2fgS2rHpu5rUe1X1LFrKogKTyfZ8cLIITYKO4Z
         2VOcSuQfHiHfXrUr2OjnDp3ACetKRZTQifI1qS+Tae8JSYz1Wm7Dg7TYlvw77lJLBQvs
         GHYS9OIGWHRxBLwPm9IyMbpYrWwxe0+hdpxJjscYAyHzavKC1SMuut52etiz+C31PPzJ
         xbU7cnPxNmlrcFpYj+6UivCootz9rO9L8fwceQPobBmLITkFNOywLiLqOazRCoFZxSsE
         5ODw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=C4eGwgdGyUZtqrcuuypZbU5tX0D8PAp4OUiSXSuIz4Y=;
        fh=ZYufU8t05C/rWqh06LxvJ8smNawm+0A98AoemSU+uos=;
        b=n8nXVQDnQIaduU4DLMcqp+4bSVqKgGJm76K/SJIDwxiKdnYpCktUFzgvVTX2XhUtw0
         kQWBI/aTzjZ28w25kgkECsb5EmFbh6QMx5Jk7ZGgbuVEl6DqYPqz1v2BHQhcgziAv4Ou
         cr7bdwKT2zVHstsyw+PU5lKPPUVOjBJUDk5RJyHub3/FX3dV/ypYv+IRylz4c/oAwSgv
         IlMIbF6XKiroeDuwgU8x31bgGxhJnfP0tEqyVMbPF09lxWoqydEYIUt1IEyiiCPB7Fiw
         lnF2kNxGhhoOT5DWzM2OhGFDb+vpMtlGY0u39bvlC2bWd52Q2af4cDjBpofelJXArvE1
         RTTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@marples.net header.s=mail header.b="UzSDN/4m";
       spf=neutral (google.com: 2a00:1450:4864:20::42f is neither permitted nor denied by domain of dave@marples.net) smtp.mailfrom=dave@marples.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697562488; x=1698167288; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=C4eGwgdGyUZtqrcuuypZbU5tX0D8PAp4OUiSXSuIz4Y=;
        b=Rx/MAsMQ1cIG5j1N+ReNykxnIdN/5IJAhUJwQDKTXwiG8gbqbk0qEnXZsgmI3HYqFg
         QaaSuK/ZcMxSw7NKL1EqwRlbgMslDChUWGqmVxbmpG4eevasvFxNZjdCKg4NzTfiCNsV
         LuCwqvujzz9yfQzzeAVH0ESxA3wCsUK0iV96CY2bKaxjM4ZiEKHUQ5RsLO2/WQMHt0t2
         Za6Dqeqmvub2ytLIB7IE9GBCQgV5iEUcbQX9Cut8eVMcS8uw48WwIh3xgTGHGfksY6qf
         Q+JQSKjYgDTT2g+19KZKlZLk1O/5DGX3uC6w68F96lskEUNBfyOpLrH5gNWBr49UNF+J
         gzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697562488; x=1698167288;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4eGwgdGyUZtqrcuuypZbU5tX0D8PAp4OUiSXSuIz4Y=;
        b=p4gpw/bPBocYxvVb/bLgVIAZ2EtDc5LLLPdzyqjy36c0DrRvrnIiozPtv1GK2tc+r2
         nlx0p/j+qix+2kF4OrNYUuH6LO8y99b0BXgSdNweny+HzkMDFpaJMkBfuHph1V2tkI2j
         Cjd9WukjDCK2n0HyTJuxW+mWhaVhje40+J0u3AOfYa7YxvBEGVATy0kIS5lbGaPjAVLJ
         Y5OX77NpyrFh3VEv3QREBJ84SRbmbPT2p7CbcfsMGOIOrIJrXBDJgWphOaPx3YDQAKTN
         7j8BvQs6dCmF644iai9sj820EdrqRMZoNmRSfI1gsgce1AvpnpymZGwiEJDmnNMwql+G
         HSBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzRg1KbADczsW8RaS7WhRVhsdh8ZZShBHqZzzJ3nYgtKRn3GTGe
	XeVJ9NH0ng+fIAaSpPnx5to=
X-Google-Smtp-Source: AGHT+IHnk8grJwlUk7BjvhZQAL2blMtG87RA+PNz9GdueXPyk+qcjmALUjCA+xeAcSAtG9gzkXyQDg==
X-Received: by 2002:a05:6512:54a:b0:507:a0bc:4aec with SMTP id h10-20020a056512054a00b00507a0bc4aecmr2270449lfl.64.1697562488044;
        Tue, 17 Oct 2023 10:08:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:5d1:b0:52f:3b2b:a285 with SMTP id
 n17-20020a05640205d100b0052f3b2ba285ls266261edx.0.-pod-prod-03-eu; Tue, 17
 Oct 2023 10:08:05 -0700 (PDT)
X-Received: by 2002:a05:6402:4415:b0:53e:bd5c:801f with SMTP id y21-20020a056402441500b0053ebd5c801fmr2696881eda.21.1697562485811;
        Tue, 17 Oct 2023 10:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697562485; cv=none;
        d=google.com; s=arc-20160816;
        b=qOdE3c3Q6MiCV+z0GUBDDUIBsVo6xJ7lSJt8mDLJolJR6e/Y9V+4xLs3hHhn2ugTOT
         hGStI/1gC6RFE/DhoCXIsCEDcsmNoOQ7lYvXZcrVunaIIb41CRWf9IHIq4LP1qSXYxB+
         ks4+uYEOz/fMll0cd0rSHkQ8LoB35bWaFXhAdynYfWdBVyg2zKCg6+Fo17igpMX6l+7Y
         1HQ3YvzY8pG6IQKhNeCSBZjanIrej1zTX0bUUrVWxqf7Mv6QkGaw3kLznCgJXXwkfoSw
         QdbPaPz9az4KMbcv4k2MBhDr+UmC7n7+J1BqPgzkha9LBELpFg6b1UXxVz272Wnl1iUf
         y7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FxjbSHySxnISGbSCsI1v638vENgptUmM1PdAho+Ae6I=;
        fh=ZYufU8t05C/rWqh06LxvJ8smNawm+0A98AoemSU+uos=;
        b=LO7OgLuwtn6pnDN9rFssQLQ2Ggl83SfTdwMVwLE0lGzbDlQpO5lbdzgiUyu00ZcWwg
         xZt7E1dRLR2S3C3l6/ZRTvHasLJhLCYvVdbZ6Fggg6QIQ5WSeslFH7PZRtKf+eeeggM0
         1+DPvSw/L10zDd+10/b04hU8In4gU6FPqdU5AgPWIF/ATURwDhM6p1H5zRjOWDHtd3Q5
         RQH7XJG/vCJZgWWr4ub8MeJ0ZIOcJ+Lx4VOecXlBuBnedj+wW7J5iy/O09UYuQgJNrtr
         pYy0iVGKzv9RblpBJ6qThEALtZjZRbBVXoYqDBq7+rVOSdYYpCZINWcryth8wqxjea2r
         lGmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@marples.net header.s=mail header.b="UzSDN/4m";
       spf=neutral (google.com: 2a00:1450:4864:20::42f is neither permitted nor denied by domain of dave@marples.net) smtp.mailfrom=dave@marples.net
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com. [2a00:1450:4864:20::42f])
        by gmr-mx.google.com with ESMTPS id o15-20020a056402038f00b0053e26876354si93168edv.5.2023.10.17.10.08.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 10:08:05 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::42f is neither permitted nor denied by domain of dave@marples.net) client-ip=2a00:1450:4864:20::42f;
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32da9ef390fso2428276f8f.2
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Oct 2023 10:08:05 -0700 (PDT)
X-Received: by 2002:adf:f70f:0:b0:32d:7615:372b with SMTP id r15-20020adff70f000000b0032d7615372bmr2330790wrp.12.1697562484728;
        Tue, 17 Oct 2023 10:08:04 -0700 (PDT)
Received: from [192.168.0.250] (cpc143270-mfl21-2-0-cust976.13-1.cable.virginm.net. [86.28.243.209])
        by smtp.gmail.com with ESMTPSA id a15-20020a056000100f00b0032d9337e7d1sm203007wrx.11.2023.10.17.10.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 10:08:04 -0700 (PDT)
Message-ID: <8753f9c0-7105-4362-9884-90a2c57fd137@marples.net>
Date: Tue, 17 Oct 2023 18:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can't install jailhouse on linux-6.1 arm system
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
From: Dave Marples <dave@marples.net>
In-Reply-To: <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: dave@marples.net
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@marples.net header.s=mail header.b="UzSDN/4m";       spf=neutral
 (google.com: 2a00:1450:4864:20::42f is neither permitted nor denied by domain
 of dave@marples.net) smtp.mailfrom=dave@marples.net
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

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de">
      <blockquote type=3D"cite">
        <br>
        Help still appreciated...Can't help getting the feeling I'm
        missing a document somewhere whereby all this lot magically
        becomes easy...
        <br>
      </blockquote>
      <br>
      Did you also apply the patch that I attached? I'm pretty sure that
      it's missing.
      <br>
      <br>
    </blockquote>
    <p>Hi Ralf,</p>
    <p>Thanks for the reply. That patch was indeed missing but applying
      it didn't change my symptoms. Just spinning up a yocto image to
      see where the differences are.</p>
    <p>Regards</p>
    <p>DAVE</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8753f9c0-7105-4362-9884-90a2c57fd137%40marples.net=
?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/=
jailhouse-dev/8753f9c0-7105-4362-9884-90a2c57fd137%40marples.net</a>.<br />
