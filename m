Return-Path: <jailhouse-dev+bncBDJONKHTZ4PRBDXETL3AKGQEZTP3CCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E791DD367
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 18:53:35 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id f62sf2901539wme.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 09:53:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590080014; cv=pass;
        d=google.com; s=arc-20160816;
        b=kJjF0m4I+APde9kyzqe4SCRJD/mil6PbpNdS6t7fzsC/kcNS7e2j0YY2p9Any2qvWw
         /VXZljaOdDNmlDxRgM0MfpimcN1k/vph4G81pwZtksBXBXOF4Z6YKZYZ6RXecw2QrFxi
         W7Z1FxKxf+eqQS5c9o5gEJFJzY/LEN20coTH24fmR9y06UD0mU9fKebTOowdFQybOXBL
         jnn+UH9gtz0IdHdzYv4w1CV5ddihRlqBpxYv0BFaThu+XGGyM3tIPqNNmIhdjIdnglqs
         X4XVFCrJmUpX8Z6lWUe7RPmW/Mtvj/d0pfKSQBRWRFvLebfB06n7tk735I1E6cnB1nCl
         Bwrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:sender:dkim-signature;
        bh=oFn2loh74vdeGHAHqqQEyAFsLkTXDNnIrJeNMnslQGk=;
        b=uQs7Qe6D6aPESUM3pfK8CnP9LsiCWuEK5IhlJFW23EuVl15OBBG2x7i23n+y0+WSNc
         XiBV11og2WG55VvcOLPWbvqz0meszMFWcNDzewqmdvwPwXYAXmTIIMonXYQoklDviI5U
         nDjdBVvShq5REBLzIFOzJO1pCzqVOeAOtsLc8JSBMCpUCLRSyvwvZQEyOk+9LmGHkYjI
         gmaWnycRjEMHg9gbxzk78m/ouPkpVdN6ag52lcaG1dM2D7J33CCJd7WJ6XrIdBKJRTOd
         GdJs6K/t+IJQQi8FZMI+PfGhf4NoXaOXFuZXmKvCLHXwH0drY8cSc4QoNocUFTW7vo0m
         OjcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnaZsjep;
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oFn2loh74vdeGHAHqqQEyAFsLkTXDNnIrJeNMnslQGk=;
        b=NWF8nrpcbnhSCyJ0vrsdFCITjPZTmIEvVJY6NNczh7rOGNuen8hTiT8nN34YfZoDp4
         ZHCIhsy5R94g9O9BJ9tRnqlSjwhy5bnYOQsVCtVG0WMWhKQp/y1UUEQhBdMbxHmNmD3v
         fKO+p+iD6TNd0JmSensjK0taE+bs8FDm8m+QBoz9b+i4l0nEZnyKChvL+m6ZJakUeF0Y
         4K/hvHgLpUz9w71RJTOlodwSbMBHnmi5iafk1c9y/pI2Pg+VdDyexY5xwEXKnqWYM7Gd
         47nLIClZF6v9HC3sZ+Xl7jYsZtjwBTxBhdisH8IMdglLFuvS843EyRN+6o84jr5kwIz2
         JW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oFn2loh74vdeGHAHqqQEyAFsLkTXDNnIrJeNMnslQGk=;
        b=gYNToyQQ08uXhFLJFIZHX2bIZBwJuQV131d9FE9kEPUtIYlIaEjq3Nd/NgeEa0W3hW
         lJBO+Am8BHiAVfRxl7dZg4eGJr4JfrjOSwM9RyjPVc0Rb0HxEEmDSKY0tc24Yp5dKrL0
         ng065fMyQMvl480Q+UCNm1+gMx1W921mhAqIjO/gz0A8Pid7ILQ0Y+09Mk4DjaSw+zrh
         u2Jrhel3SPHYgP4lNLXrchz2uOHj9Alpy1NgQc+luNEo2tQ9zP8RcnblcP45oi4Gw7b7
         8FEkh/P633Yn2j70ZFDk63jJ+hpb71tpJ26+RO69BObniHPTmxk6bg2WeChD8fuR+0Nc
         bOfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53309MrVyxoV4JR4dnUlz9RvYuHZkZSNrvHH3Xum0DlsiJ8uXVHJ
	HueeACbJs19Mp5/BBPD1viQ=
X-Google-Smtp-Source: ABdhPJxqfGOGVb/uQva9omd6iT2mEp+livd6r1WfKU+Eumra02cMbN6LHT48tagKb+ZgT0War8dBEw==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr9560256wrn.96.1590080014756;
        Thu, 21 May 2020 09:53:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c770:: with SMTP id x16ls1337153wmk.3.gmail; Thu, 21 May
 2020 09:53:34 -0700 (PDT)
X-Received: by 2002:a1c:444:: with SMTP id 65mr10143155wme.21.1590080014156;
        Thu, 21 May 2020 09:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590080014; cv=none;
        d=google.com; s=arc-20160816;
        b=sro9V+81Hhh6D2KdziwqAYA73VwO+KS1N/BgqENl75hVk8a/EYJPO5W0O61eanjP+K
         4bYvlE+jZBEO6AsfkOodmTr7RMrsWEbu+ydvQqSkVVqTzinfSP7QIkB/fQ7jBUD+dfnZ
         i1MP5JLQ65hvz9CmsGistjdVBk2y1VPTJs1YhTSuFvbmP521SbKXQjfEhbzPitpO5WWb
         4HsmmLt19cTsy/a9u7ci4jzg67CIYY5sL0IFPBJD87k8n7GkYxe7D5wQVqjs3E1i2Lfc
         +1EfS/f+wnG129EXF+kwFQgqdtVNTnyTRA+fohh0ZI4gKO7I6OxmkDtZZYAyuEs4qV72
         YOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=+1miga9ogLLOn2cfQOxdPsZTYfR25BOk5zO9I4zkgD4=;
        b=H6xWpma5/Quifmsxn3dUkeIfekzg7yhS3VSVCqNfgQdPsgISdeKVzUlYJUD+lF5rEd
         gz3dfMJUIrEOwQ5pUjkBSwwaglQHyq4rnkBvcBv8yTA1RF+HzJNXmFNdhWcL3XdSOXWG
         ASVlCpSKkWP2ASyAHtJHfFziclWaEQCb0wf6TUZP5w15E3I0OTUD9g6VJV2HGpwHnI23
         bIMjIePFEd9xmXqsz72WGF2MQMR3nmVUxOoAqz0Dj/l6mRGwIhPfQAPsxu+FEYzttMmC
         qcIS3Qbq/Y9XGJJ7mP+WaZXZKeq2rhjCzME7P0+wqATeVCLLPk6lqlt7N8bxBWVQ0k1/
         1+EQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnaZsjep;
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com. [2a00:1450:4864:20::642])
        by gmr-mx.google.com with ESMTPS id u83si544993wmb.2.2020.05.21.09.53.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 09:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of alex.bennee@linaro.org designates 2a00:1450:4864:20::642 as permitted sender) client-ip=2a00:1450:4864:20::642;
Received: by mail-ej1-x642.google.com with SMTP id x20so9615381ejb.11
        for <jailhouse-dev@googlegroups.com>; Thu, 21 May 2020 09:53:34 -0700 (PDT)
X-Received: by 2002:a17:907:39b:: with SMTP id ss27mr4353887ejb.209.1590080013627;
        Thu, 21 May 2020 09:53:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w11sm4771711edf.32.2020.05.21.09.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:53:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5AA3A1FF7E;
	Thu, 21 May 2020 17:53:31 +0100 (BST)
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka@siemens.com>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
 Claudio Fontana <claudio.fontana@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Hannes Reinecke
 <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC][PATCH v2 2/3] docs/specs: Add specification of ivshmem
 device revision 2
In-reply-to: <5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka@siemens.com>
Date: Thu, 21 May 2020 17:53:31 +0100
Message-ID: <877dx5fcvo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: alex.bennee@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=bnaZsjep;       spf=pass
 (google.com: domain of alex.bennee@linaro.org designates 2a00:1450:4864:20::642
 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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


Jan Kiszka <jan.kiszka@siemens.com> writes:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> This imports the ivshmem v2 specification draft from Jailhouse where the
> implementation is about to be merged now. The final home of the spec is
> to be decided, this shall just simplify the review process at this
> stage.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  docs/specs/ivshmem-2-device-spec.md | 376 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 376 insertions(+)
>  create mode 100644 docs/specs/ivshmem-2-device-spec.md
>
> diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2-d=
evice-spec.md
> new file mode 100644
> index 0000000000..d93cb22b04
> --- /dev/null
> +++ b/docs/specs/ivshmem-2-device-spec.md
> @@ -0,0 +1,376 @@
> +IVSHMEM Device Specification
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE
> SPECIFICATION! **

Has there been any proposal to the OASIS virtio spec to use this as a
transport for VirtIO?

--=20
Alex Benn=C3=A9e

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/877dx5fcvo.fsf%40linaro.org.
